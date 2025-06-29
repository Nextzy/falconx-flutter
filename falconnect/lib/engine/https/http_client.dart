import 'package:falconnect/lib.dart';

abstract class BaseHttpClient implements RequestApiService {
  BaseHttpClient({
    required Dio dio,
  }) : _dio = dio {
    setupOptions(_dio, _dio.options);
    setupInterceptors(_dio, _dio.interceptors);
  }

  late final Dio _dio;

  Dio get dio => _dio;

  void setupBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  void setupOptions(Dio dio, BaseOptions options) {}

  void setupInterceptors(Dio dio, Interceptors interceptors) {}

  BaseOptions get config => _dio.options;

  Interceptors get interceptors => _dio.interceptors;

  /// Handy method to make http GET requests, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isUseToken = true,
    required FutureOr<T> Function(Map<String, dynamic> json) converter,
    T? Function(DioException exception, StackTrace? stackTrace)? catchError,
  }) async {
    return _dio
        .get(
          path,
          queryParameters: queryParameters,
          options: options,
          onReceiveProgress: onReceiveProgress,
        )
        .mapJson((json) async => await converter(json))
        .catchWhenError(catchError);
  }

  /// Handy method to make http POST requests, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> post<T>(
    String path, {
    BaseRequestBody? data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isUseToken = true,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioException exception, StackTrace? stackTrace)? catchError,
  }) async {
    return _dio
        .post(
          path,
          queryParameters: queryParameters,
          data: data?.toJson(),
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
        )
        .mapJson((json) => converter(json))
        .catchWhenError(catchError);
  }

  @override
  Future<Response<T>> postFormData<T>(
    String path, {
    FormData? data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isUseToken = true,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioException exception, StackTrace? stackTrace)? catchError,
  }) async {
    return _dio
        .post(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
        )
        .mapJson((json) => converter(json))
        .catchWhenError(catchError);
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    BaseRequestBody? data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isUseToken = true,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioException exception, StackTrace? stackTrace)? catchError,
  }) async {
    return _dio
        .patch(
          path,
          queryParameters: queryParameters,
          data: data?.toJson(),
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
        )
        .mapJson((json) => converter(json))
        .catchWhenError(catchError);
  }

  /// Handy method to make http PUT requests, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> put<T>(
    String path, {
    BaseRequestBody? data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isUseToken = true, // Please
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioException exception, StackTrace? stackTrace)? catchError,
  }) async {
    return _dio
        .put(
          path,
          data: data?.toJson(),
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        )
        .mapJson((json) => converter(json))
        .catchWhenError(catchError);
  }

  @override
  Future<Response<T>> putFormData<T>(
    String path, {
    FormData? data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isUseToken = true,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioException exception, StackTrace? stackTrace)? catchError,
  }) async {
    return _dio
        .put(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
        )
        .mapJson((json) => converter(json))
        .catchWhenError(catchError);
  }

  /// Handy method to make http DELETE requests, which is a alias of  [dio.fetch(RequestOptions)].
  @override
  Future<Response<T>> delete<T>(
    String path, {
    BaseRequestBody? data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool isUseToken = true,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioException exception, StackTrace? stackTrace)? catchError,
  }) async {
    return _dio
        .delete(
          path,
          data: data?.toJson(),
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        )
        .mapJson((json) => converter(json))
        .catchWhenError(catchError);
  }
}
