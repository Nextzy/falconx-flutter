import 'package:falconnect/lib.dart';

class BadGatewayException extends ServerErrorException {
  const BadGatewayException({
    super.code = 502,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
