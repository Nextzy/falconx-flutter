import 'package:falconnect/lib.dart';
import 'package:flutter/foundation.dart';

abstract class AccessTokenInterceptor extends InterceptorsWrapper {
  AccessTokenInterceptor({
    this.accessToken,
    this.refreshToken,
    this.retryLimit = 0,
  }) : _retryCounter = 0;

  String? accessToken;
  String? refreshToken;
  int _retryCounter;
  final int retryLimit;

  bool get hasAccessToken =>
      accessToken != null && accessToken?.isNotEmpty == true;

  bool get hasRefreshToken =>
      refreshToken != null && refreshToken?.isNotEmpty == true;

  @protected
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (isCatchError(response) && _retryCounter <= retryLimit) {
      onTokenResponse(response, handler, _retryCounter);
      _retryCounter += 1;
    } else {
      _retryCounter = 0;
      super.onResponse(response, handler);
    }
  }

  @protected
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (isCatchError(err.response) && _retryCounter <= retryLimit) {
      onTokenError(err, handler, _retryCounter);
      _retryCounter += 1;
    } else {
      _retryCounter = 0;
      super.onError(err, handler);
    }
  }

  bool isCatchError(Response? response);

  void onTokenResponse(
      Response response, ResponseInterceptorHandler handler, int retryCounter);

  void onTokenError(
      DioException err, ErrorInterceptorHandler handler, int retryCounter);
}
