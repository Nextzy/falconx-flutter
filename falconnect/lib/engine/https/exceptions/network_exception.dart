import 'package:dio/dio.dart';

class NetworkException implements Exception {
  const NetworkException({
    this.code = 0,
    this.response,
    this.requestOptions,
    this.message,
    this.developerMessage,
    this.stackTrace,
    this.errors,
  });

  final int code;
  final Response? response;
  final RequestOptions? requestOptions;
  final String? message;
  final String? developerMessage;
  final List<NetworkException>? errors;
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
    String msg = '';
    if (code != 0) msg += '>>Code: $code\n';
    if (message != null && message!.isNotEmpty) {
      msg += '>>Message: $message\n';
    }
    if (developerMessage != null && developerMessage!.isNotEmpty) {
      msg += '>>Developer message: $developerMessage\n';
    }
    if (response != null) msg += '>>Response: $response\n';
    errors?.forEach(
      (error) => msg += '   ${error.toString()}]\n',
    );
    return msg;
  }
}
