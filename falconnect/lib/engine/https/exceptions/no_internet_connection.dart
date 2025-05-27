import 'package:falconnect/lib.dart';

class NoInternetConnectException implements Exception {
  const NoInternetConnectException({
    this.message,
    this.requestOptions,
    this.stackTrace,
  });

  final String? message;
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
        error: this,
        stackTrace: stackTrace ?? this.stackTrace ?? StackTrace.current,
        type: type ?? DioExceptionType.unknown,
        message: message ?? this.message,
      );

  @override
  String toString() {
    String msg = '';
    if (message != null && message!.isNotEmpty) {
      msg += '>>Message: $message\n';
    }
    return msg;
  }
}
