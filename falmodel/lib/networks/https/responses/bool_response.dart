import 'package:dio/dio.dart';
import 'package:falmodel/lib.dart';

class BoolResponse extends Response<bool> {
  BoolResponse({
    super.data,
    super.statusCode,
    super.statusMessage,
    required super.requestOptions,
    super.isRedirect,
    super.redirects,
    super.extra,
  });
}
