import 'package:falconnect/lib.dart';

class RequestTimeoutException extends ClientNetworkException {
  const RequestTimeoutException({
    super.statusCode = 408,
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
