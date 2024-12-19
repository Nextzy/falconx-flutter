import 'package:falconnect/lib.dart';

class ForbiddenException extends ClientErrorException {
  const ForbiddenException({
    super.statusCode = 403,
    super.type,
    super.statusMessage,
    super.errorMessage,
    super.developerMessage,
    super.response,
    super.requestOptions,
    super.stackTrace,
    super.errors,
  });
}
