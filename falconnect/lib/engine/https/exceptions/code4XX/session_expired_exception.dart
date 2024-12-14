import 'package:falconnect/lib.dart';

class SessionExpiredException extends ClientErrorException {
  const SessionExpiredException({
    super.code = 401,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
