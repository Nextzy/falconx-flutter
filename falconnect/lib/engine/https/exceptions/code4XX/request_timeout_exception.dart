import 'package:falconnect/lib.dart';

class RequestTimeoutException extends ClientErrorException {
  const RequestTimeoutException({
    super.code = 408,
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
