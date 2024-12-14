import 'package:falconnect/lib.dart';

class ServiceUnavailableException extends ServerErrorException {
  const ServiceUnavailableException({
    super.code = 503,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
