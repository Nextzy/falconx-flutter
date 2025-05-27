import 'package:falconnect/lib.dart';

class InternalServerErrorException extends ServerNetworkException {
  const InternalServerErrorException({
    super.statusCode = 500,
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
