import 'package:dio/dio.dart';

class NetworkException implements Exception {
  const NetworkException({
    this.statusCode = 0,
    this.type,
    this.statusMessage,
    this.errorMessage,
    this.developerMessage,
    this.response,
    this.requestOptions,
    this.stackTrace,
    this.errors,
  });

  final int statusCode;
  final String? type;
  final String? statusMessage;
  final String? errorMessage;
  final String? developerMessage;
  final Response? response;
  final RequestOptions? requestOptions;
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
        message: message ?? statusMessage,
      );

  @override
  String toString() {
    var msg = '';
    if (statusCode != 0) msg += '>>Status code: $statusCode\n';
    if (type != null && type!.isNotEmpty) {
      msg += '>>Type: $type\n';
    }
    if (statusMessage != null && statusMessage!.isNotEmpty) {
      msg += '>>Status message: $statusMessage\n';
    }
    if (errorMessage != null && errorMessage!.isNotEmpty) {
      msg += '>>Error message: $errorMessage\n';
    }
    if (developerMessage != null && developerMessage!.isNotEmpty) {
      msg += '>>Developer message: $developerMessage\n';
    }
    if (response != null) msg += '>>Response: $response\n';
    errors?.forEach(
      (error) => msg += '   $error]\n',
    );
    return msg;
  }
}
