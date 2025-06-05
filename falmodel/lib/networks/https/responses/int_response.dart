import 'package:falmodel/lib.dart';

class IntResponse extends Response<int> {
  IntResponse({
    super.data,
    super.statusCode,
    super.statusMessage,
    required super.requestOptions,
    super.isRedirect,
    super.redirects,
    super.extra,
  });
}
