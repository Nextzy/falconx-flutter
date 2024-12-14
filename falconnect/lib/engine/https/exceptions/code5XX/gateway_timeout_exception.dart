import 'package:falconnect/lib.dart';

class GatewayTimeoutException extends ServerErrorException {
  const GatewayTimeoutException({
    super.code = 504,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
    this.timeout,
  });

  final int? timeout;
}
