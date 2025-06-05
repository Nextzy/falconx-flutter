import 'package:falconnect/lib.dart';

class NetworkTimeoutException implements Exception {
  const NetworkTimeoutException({
    this.message,
    this.requestOptions,
    this.response,
    this.stackTrace,
    this.timeout,
  });

  final String? message;
  final Duration? timeout;
  final Response? response;
  final RequestOptions? requestOptions;
  final StackTrace? stackTrace;

  DioException toDioException({
    RequestOptions? requestOptions,
    Response? response,
    StackTrace? stackTrace,
    DioExceptionType? type,
    String? message,
  }) =>
      DioException(
        requestOptions:
            requestOptions ?? this.requestOptions ?? RequestOptions(),
        response: response ?? this.response,
        error: this,
        stackTrace: stackTrace ?? this.stackTrace ?? StackTrace.current,
        type: type ?? DioExceptionType.unknown,
        message: message ?? this.message,
      );

  @override
  String toString() {
    var msg = '';
    if (timeout != null) {
      msg += '>>Timeout: $timeout\n';
    }
    if (message != null && message!.isNotEmpty) {
      msg += '>>Message: $message\n';
    }
    if (response != null) msg += '>>Response: $response\n';
    return msg;
  }
}
