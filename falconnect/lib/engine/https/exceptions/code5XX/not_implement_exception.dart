import 'package:falconnect/lib.dart';

class NotImplementException extends ServerErrorException {
  const NotImplementException({
    super.code = 501,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
