import 'package:falconnect/lib.dart';

class BadRequestException extends ClientErrorException {
  const BadRequestException({
    super.statusCode = 400,
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
