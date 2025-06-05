// Ignore because is not necessary
// ignore_for_file: avoid_dynamic_calls

import 'package:falconnect/lib.dart';

/// Support Error Response:
/// {
///   "type": "ERROR_TYPE",
///   "message": "Message show to user",
///   "developerMessage": "Message show to developer",
///   "errors": {
///     ...
///   }
/// }
abstract class NetworkErrorHandlerInterceptor extends QueuedInterceptor {
  NetworkErrorHandlerInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      final timeout = err.requestOptions.connectTimeout;
      handler.reject(
        err.copyWith(
          error: NetworkTimeoutException(
            timeout: timeout,
            requestOptions: err.requestOptions,
            response: err.response,
            message: err.message,
            stackTrace: err.stackTrace,
          ),
          stackTrace: err.stackTrace,
        ),
      );
    } else if (_isServerError(response)) {
      final exception =
          _getExceptionFromResponse(err.response, stacktrace: err.stackTrace);
      onServerError(err.copyWith(error: exception), handler);
    } else if (_isClientError(response)) {
      final exception =
          _getExceptionFromResponse(err.response, stacktrace: err.stackTrace);
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

  Exception? _getExceptionFromResponse(
    Response? response, {
    StackTrace? stacktrace,
  }) {
    final statusCode = response?.statusCode ?? 0;

    String? type;
    String? errorMessage;
    String? developerMessage;
    try {
      if (response?.data is String) {
        errorMessage = response?.data as String?;
      } else if (response?.data is Map) {
        type = response?.data['type'] as String?;
        errorMessage = response?.data['error'] as String?;
        developerMessage = response?.data['developerMessage'] as String?;
      }
    } catch (e) {
      errorMessage = null;
    }

    if (statusCode >= 600) {
      return NonStandardErrorException(
        statusCode: statusCode,
        type: type,
        statusMessage: response?.statusMessage,
        errorMessage: errorMessage,
        developerMessage: developerMessage,
        requestOptions: response?.requestOptions,
        response: response,
        stackTrace: stacktrace ?? StackTrace.current,
      );
    } else if (statusCode >= 500 && statusCode < 600) {
      if (statusCode == 500) {
        return InternalServerErrorException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else if (statusCode == 501) {
        return NotImplementException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else if (statusCode == 502) {
        return BadGatewayException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else if (statusCode == 503) {
        return ServiceUnavailableException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else if (statusCode == 504) {
        return GatewayTimeoutException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else {
        return ServerNetworkException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      }
    } else if (statusCode >= 400 && statusCode < 500) {
      if (statusCode == 400) {
        return BadRequestException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else if (statusCode == 401) {
        return AuthenticationException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else if (statusCode == 403) {
        return ForbiddenException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else if (statusCode == 404) {
        return NotFoundException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else if (statusCode == 405) {
        return MethodNotAllowedException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else if (statusCode == 408) {
        return RequestTimeoutException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      } else {
        return ClientNetworkException(
          statusCode: statusCode,
          type: type,
          statusMessage: response?.statusMessage,
          errorMessage: errorMessage,
          developerMessage: developerMessage,
          requestOptions: response?.requestOptions,
          response: response,
          stackTrace: stacktrace ?? StackTrace.current,
        );
      }
    }
    return null;
  }
}
