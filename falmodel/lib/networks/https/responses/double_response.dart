import 'package:falmodel/lib.dart';

class DoubleResponse extends Response<double> {
  DoubleResponse({
    super.data,
    super.statusCode,
    super.statusMessage,
    required super.requestOptions,
    super.isRedirect,
    super.redirects,
    super.extra,
    Headers? headers,
  });
}
