import 'package:dio/dio.dart';
import 'package:falmodel/lib.dart';

/// {
///   'status': 'true/false'
/// }

class BoolResponse extends Response<bool> {
  BoolResponse({
    super.data,
    super.statusCode,
    super.statusMessage,
    RequestOptions? requestOptions,
    super.isRedirect,
    super.redirects,
    super.extra,
    Headers? headers,
  }) : super(requestOptions: requestOptions ?? RequestOptions());
}
