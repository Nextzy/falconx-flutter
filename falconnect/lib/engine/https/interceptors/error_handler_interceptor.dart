import 'package:falconnect/lib.dart';

abstract class NetworkErrorHandlerInterceptor extends InterceptorsWrapper {
  NetworkErrorHandlerInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      final int timeout =
          err.requestOptions.connectTimeout?.inMilliseconds ?? -1;
      handler.reject(
        err.copyWith(
          error: RequestTimeoutException(
            timeout: timeout,
            developerMessage: 'Error on NetworkErrorHandlerInterceptor',
          ),
          stackTrace: err.stackTrace,
        ),
      );
    } else if (_isServerError(response)) {
      final Exception? exception = _getExceptionFromResponse(err);
      onServerError(exception ?? err, handler);
    } else if (_isClientError(response)) {
      final Exception? exception = _getExceptionFromResponse(err);
      onClientError(exception ?? err, handler);
    } else {
      onNonStandardError(err, handler);
      super.onError(err, handler);
    }
  }

  void onClientError(Exception? err, ErrorInterceptorHandler handler);

  void onServerError(Exception? err, ErrorInterceptorHandler handler);

  void onNonStandardError(Exception? err, ErrorInterceptorHandler handler) {}

  ///========================= PRIVATE METHOD =========================///
  bool _isClientError(Response? response) =>
      response != null &&
      (response.statusCode ?? 0) >= 400 &&
      (response.statusCode ?? 0) < 500;

  bool _isServerError(Response? response) =>
      response != null &&
      (response.statusCode ?? 0) >= 500 &&
      (response.statusCode ?? 0) < 600;

  Exception? _getExceptionFromResponse(DioException error) {
    final code = error.response?.statusCode ?? 0;

    String? errorMessage;
    if (error.response?.data is String) {
      errorMessage = error.response?.data;
    } else if (error.response?.data is Map) {
      errorMessage = error.response?.data['error'];
    }

    if (code >= 500) {
      if (code == 500) {
        return InternalServerErrorException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else if (code == 501) {
        return NotImplementException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else if (code == 502) {
        return BadGatewayException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else if (code == 503) {
        return ServiceUnavailableException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else if (code == 504) {
        return GatewayTimeoutException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else {
        return ServerErrorException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      }
    } else if (code >= 400) {
      if (code == 400) {
        return BadRequestException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else if (code == 401) {
        return SessionExpiredException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else if (code == 403) {
        return ForbiddenException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else if (code == 404) {
        return NotFoundException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else if (code == 405) {
        return MethodNotAllowedException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else if (code == 408) {
        return RequestTimeoutException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      } else {
        return ClientErrorException(
          code: code,
          message: errorMessage ?? error.response?.statusMessage,
          developerMessage: 'Http Interceptor',
          requestOptions: error.response?.requestOptions,
          response: error.response,
          stackTrace: error.stackTrace,
        );
      }
    }
    return null;
  }
}
