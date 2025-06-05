import 'package:falmodel/lib.dart';

class StringResponse extends Response<String> {
  StringResponse({
    super.data,
    super.statusCode,
    super.statusMessage,
    required super.requestOptions,
    super.isRedirect,
    super.redirects,
    super.extra,
    headers,
  });
}
