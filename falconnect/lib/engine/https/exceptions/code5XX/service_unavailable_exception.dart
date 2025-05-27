import 'package:falconnect/lib.dart';

class ServiceUnavailableException extends ServerNetworkException {
  const ServiceUnavailableException({
    super.statusCode = 503,
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
