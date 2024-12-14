import 'package:falconnect/lib.dart';

class InternalServerErrorException extends ServerErrorException {
  const InternalServerErrorException({
    super.code = 500,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
