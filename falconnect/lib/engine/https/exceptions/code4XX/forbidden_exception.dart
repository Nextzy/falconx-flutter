import 'package:falconnect/lib.dart';

class ForbiddenException extends ClientErrorException {
  const ForbiddenException({
    super.code = 403,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
