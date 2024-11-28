import 'package:falmodel/lib.dart';

/// {
///   'string': 'string'
/// }

class StringResponse extends Response<String> {
  StringResponse({
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
