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
  final List<Exception>? errors;
  final StackTrace? stackTrace;

  DioException toDioException() => DioException(
        requestOptions: requestOptions ?? RequestOptions(),
        response: response,
        error: this,
        stackTrace: stackTrace ?? StackTrace.current,
        type: DioExceptionType.unknown,
        message: message,
      );

  @override
  String toString() {
    String msg = '';
    if (code != 0) msg += '>>Code: $code\n';
    if (requestOptions != null) msg += '>>Request options: $requestOptions\n';
    if (response != null) msg += '>>Response: $response\n';
    if (message != null && message!.isNotEmpty) {
      msg += ' | Exception: $message\n';
    }
    if (developerMessage != null && developerMessage!.isNotEmpty) {
      msg += '[$developerMessage]\n';
    }
    errors?.forEach(
      (error) => msg += '   ${error.toString()}]\n',
    );
    return msg;
  }
}
