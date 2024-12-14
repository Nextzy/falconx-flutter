import 'package:falconnect/lib.dart';

class BadRequestException extends ClientErrorException {
  const BadRequestException({
    super.code = 400,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
