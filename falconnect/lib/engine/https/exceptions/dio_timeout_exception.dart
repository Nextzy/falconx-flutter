import 'package:falconnect/lib.dart';

class DioTimeoutException extends ClientErrorException {
  const DioTimeoutException({
    super.code = 0,
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
