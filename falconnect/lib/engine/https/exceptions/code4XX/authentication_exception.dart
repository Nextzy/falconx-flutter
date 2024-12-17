import 'package:falconnect/lib.dart';

class AuthenticationException extends ClientErrorException {
  const AuthenticationException({
    super.code = 401,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
