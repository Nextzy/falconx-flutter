import 'package:falconnect/lib.dart';

extension FalconnectHttpFutureDynamicExtensions on Future<Response<dynamic>> {
  Future<Response<T>> mapJson<T>(
      FutureOr<T> Function(Map<String, Object?> response) f) {
    return then((Response<dynamic> response) async {
      T data;
      if (response.data is String) {
        final map = <String, dynamic>{};
        map['result'] = response.data;
        data = await f(map);
      } else {
        data = await f(response.data as Map<String, Object?>);
      }

      return response.copyWith(data: data);
    });
  }
}

extension FalconnectFutureResponseExtensions<T> on Future<Response<T>> {
  Future<T> unwrapResponse() {
    return then<T>((Response<T> response) {
      return Future.value(response.data);
    });
  }

  Future<Response<T>> catchWhenError(
      T? Function(DioException exception, StackTrace? stackTrace)? f) {
    return then(
      (value) => value,
      onError: (Object error, StackTrace stackTrace) {
        if (f != null && error is DioException) {
          final resolve = f(error, error.stackTrace);
          final response = error.response.transformData(data: resolve);
          return Future.value(response);
        }
        throw error;
      },
    );
  }
}

extension FalconnectHttpFutureRpcResponseExtensions<T, E>
    on Future<JsonRpcResponse<T, E>> {
  Future<T> unwrapResponse() {
    return then<T>((JsonRpcResponse<T, E> response) {
      return Future.value(response.result);
    });
  }

  Future<JsonRpcResponse<T, E>> catchWhenError(
      T? Function(DioException exception, StackTrace? stackTrace)? f) {
    return then(
      (value) => value,
      onError: (Object error, StackTrace stackTrace) {
        if (f != null && error is DioException) {
          final resolve = f(error, error.stackTrace);
          final response = error.response.transformData(data: resolve);
          return Future.value(response);
        }
        throw error;
      },
    );
  }
}

extension FalconnectHttpFutureResponseExtensions<T> on Future<HttpResponse<T>> {
  Future<T> unwrapResponse() {
    return then<T>((HttpResponse<T> response) {
      return Future.value(response.data);
    });
  }

  Future<HttpResponse<T>> catchWhenError(
      T? Function(DioException exception, StackTrace? stackTrace)? f) {
    return then(
      (value) => value,
      onError: (Object error, StackTrace stackTrace) {
        if (f != null && error is DioException) {
          final resolve = f(error, error.stackTrace);
          final response = error.response.transformData(data: resolve);
          return Future.value(response);
        }
        throw error;
      },
    );
  }
}

extension FalconnectResponseExtensions on Response? {
  Response<T> copyWith<T>({
    T? data,
    Headers? headers,
    RequestOptions? requestOptions,
    bool? isRedirect,
    int? statusCode,
    String? statusMessage,
    List<RedirectRecord>? redirects,
    Map<String, dynamic>? extra,
  }) {
    return Response<T>(
      data: (data ?? this?.data) as T?,
      headers: headers ?? this?.headers,
      requestOptions: requestOptions ?? this!.requestOptions,
      isRedirect: isRedirect ?? this?.isRedirect ?? false,
      statusCode: statusCode ?? this?.statusCode,
      statusMessage: statusMessage ?? this?.statusMessage,
      redirects: redirects ?? this?.redirects ?? [],
      extra: extra ?? this?.extra ?? {},
    );
  }

  Response<T> transformData<T>({
    required T? data,
    Headers? headers,
    RequestOptions? requestOptions,
    bool? isRedirect,
    int? statusCode,
    String? statusMessage,
    List<RedirectRecord>? redirects,
    Map<String, dynamic>? extra,
  }) {
    if (this == null) {
      this?.data = data;
      return this! as Response<T>;
    }
    return Response<T>(
      data: data,
      headers: headers ?? this?.headers,
      requestOptions: requestOptions ?? this!.requestOptions,
      isRedirect: isRedirect ?? this?.isRedirect ?? false,
      statusCode: statusCode ?? this?.statusCode,
      statusMessage: statusMessage ?? this?.statusMessage,
      redirects: redirects ?? this?.redirects ?? [],
      extra: extra ?? this?.extra ?? {},
    );
  }
}
