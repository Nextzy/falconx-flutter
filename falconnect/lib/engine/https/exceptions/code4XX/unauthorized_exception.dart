import 'package:falconnect/lib.dart';

class UnauthorizedException extends ClientErrorException {
  const UnauthorizedException({
    super.code = 401,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
