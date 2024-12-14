import 'package:falconnect/lib.dart';

class MethodNotAllowedException extends ClientErrorException {
  const MethodNotAllowedException({
    super.code = 405,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
