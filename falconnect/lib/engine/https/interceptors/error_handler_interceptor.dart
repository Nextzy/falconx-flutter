import 'package:falconnect/lib.dart';

abstract class NetworkErrorHandlerInterceptor extends Interceptor {
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
          error: DioTimeoutException(
            timeout: timeout,
            developerMessage: 'Error on NetworkErrorHandlerInterceptor',
          ),
          stackTrace: err.stackTrace,
        ),
      );
    } else if (_isServerError(response)) {
      final Exception? exception = _getExceptionFromResponse(err);
      onServerError(err.copyWith(error: exception), handler);
    } else if (_isClientError(response)) {
      final Exception? exception = _getExceptionFromResponse(err);
      onClientError(err.copyWith(error: exception), handler);
    } else {
      onNonStandardError(err, handler);
    }
  }

  void onClientError(DioException err, ErrorInterceptorHandler handler);

  void onServerError(DioException err, ErrorInterceptorHandler handler);

  void onNonStandardError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

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
    try {
      if (error.response?.data is String) {
        errorMessage = error.response?.data;
      } else if (error.response?.data is Map) {
        errorMessage = error.response?.data['error'];
      } else {
        errorMessage = error.response?.statusMessage ?? error.toString();
      }
    } catch (e) {
      errorMessage = null;
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
        return AuthenticationException(
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
