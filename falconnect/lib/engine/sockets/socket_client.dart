import 'package:falconnect/lib.dart';

abstract class SocketClient implements RequestSocketService {
  SocketClient(String baseUrl) {
    _tmpOptions = SocketOptions(uri: baseUrl);
    _replaySubject = PublishSubject<SocketResponse>();
    _retryLimitCounter = _tmpOptions.retryLimit;
    interceptors = SocketInterceptors();
    setupConfig(_tmpOptions);
    setupInterceptors(interceptors);
  }

  static const TAG = 'SocketChannel';
  late SocketOptions _tmpOptions;
  late PublishSubject<SocketResponse> _replaySubject;
  late int _retryLimitCounter;
  late final SocketInterceptors interceptors;

  WebSocketChannel? _channel;
  bool _isClose = true;
  StreamSubscription? _subscription;

  bool get isClose => _isClose;

  set setIsClose(bool isClose) => _isClose = isClose;

  SocketOptions get options => _tmpOptions;

  void setupConfig(SocketOptions configs);

  void setupInterceptors(SocketInterceptors interceptors) {}

  @override
  Future<void> createChannel() async {
    if (_channel != null || !_isClose) {
      await closeChannel();
      _isClose = true;
    }

    _channel = WebSocketChannel.connect(Uri.parse(_tmpOptions.uri));
    _subscription = _channel?.stream.listen(
      _onResponse,
      onError: _onError,
      onDone: _onDone,
    );
    _isClose = false;
  }

  Future<void> _onDone() async {
    NLog.i(TAG, 'DONE');
    _logCloseReason();
    await closeChannel();
  }

  void _onError(Exception? error, StackTrace? stackTrace) async {
    if (_retryLimitCounter > 0) {
      _executeInterceptorOnError(
          exception: SocketRetryException(
            retryCount: _retryLimitCounter,
            exception: error,
            stackTrace: stackTrace,
          ),
          options: _tmpOptions.copyWith());
      _isClose = false;
      _retryLimitCounter--;
      if (_tmpOptions.data != null) {
        _channel?.sink.add(_tmpOptions.data);
      }
    } else {
      _executeInterceptorOnError(
          exception: SocketException(
            exception: error,
            stackTrace: stackTrace,
          ),
          options: _tmpOptions.copyWith());
      _isClose = true;
      _replaySubject.addError(error as Object, stackTrace);
      await _subscription?.cancel();
    }
  }

  @override
  Future<void> closeChannel() async {
    if (_isClose == false) {
      await _channel?.sink.close();
      await _subscription?.cancel();
      _isClose = true;
      _tmpOptions = _tmpOptions.copyWith(data: null);
    }
  }

  /// Create channel automatically when first call request.
  @override
  void request(String data) async {
    if (_channel == null || isClose == true) {
      await createChannel();
    }
    _tmpOptions = _tmpOptions.copyWith(
      protocol: _channel?.protocol,
      data: data,
    );
    _executeInterceptorOnRequest(options: _tmpOptions);
    _channel?.sink.add(_tmpOptions.data);
  }

  @override
  Stream<T> getResponseStream<T>({
    bool Function(SocketResponse response)? filter,
    required T Function(SocketResponse response) converter,
  }) =>
      _replaySubject.stream
          .where(filter ?? (data) => true)
          .asyncMap((response) => converter(response));

  @override
  Stream<SocketResponse> getRawStream({
    bool Function(SocketResponse response)? filter,
  }) =>
      _replaySubject.stream.where(filter ?? (data) => true);

  Future<void> checkConnection() async {
    try {
      printInfo('Socket: PING to server');
      _channel?.sink.add('ping');
    } on StateError catch (error, stackTrace) {
      printError(error, stackTrace);
      await createChannel();
    }
  }

  void _onResponse(dynamic response) {
    _retryLimitCounter = _tmpOptions.retryLimit;
    final responseWrap = SocketResponse(
      data: response as String,
      requestOptions: _tmpOptions.copyWith(),
    );
    _executeInterceptorOnResponse(response: responseWrap);
    _replaySubject.add(responseWrap);
  }

  void _executeInterceptorOnRequest({
    required SocketOptions options,
  }) {
    for (var interceptor in interceptors) {
      interceptor.onRequest(options);
    }
  }

  void _executeInterceptorOnResponse({
    required SocketResponse response,
  }) {
    for (var interceptor in interceptors) {
      interceptor.onResponse(response);
    }
  }

  void _executeInterceptorOnError({
    required SocketException exception,
    required SocketOptions options,
  }) {
    for (var interceptor in interceptors) {
      interceptor.onError(exception, options);
    }
  }

  void _logCloseReason() {
    final protocol = _channel?.protocol;
    final closeCode = _channel?.closeCode;
    final closeReason = _channel?.closeReason;
    printError(
        'Protocol: $protocol\nClose code: $closeCode\nClose reason: $closeReason');
  }
}
