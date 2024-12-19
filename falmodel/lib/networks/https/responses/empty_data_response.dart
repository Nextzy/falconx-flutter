import 'package:falmodel/lib.dart';

class EmptyResponse extends Response<Object> {
  EmptyResponse({
    super.data = '',
    super.statusCode,
    super.statusMessage,
    required super.requestOptions,
    super.isRedirect,
    super.redirects,
    super.extra,
    super.headers,
  });
}
