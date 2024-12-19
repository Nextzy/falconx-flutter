import 'package:falconnect/lib.dart';

class GatewayTimeoutException extends ServerErrorException {
  const GatewayTimeoutException({
    super.statusCode = 504,
    super.type,
    super.statusMessage,
    super.errorMessage,
    super.developerMessage,
    super.response,
    super.requestOptions,
    super.stackTrace,
    super.errors,
    this.timeout,
  });

  final int? timeout;
}
