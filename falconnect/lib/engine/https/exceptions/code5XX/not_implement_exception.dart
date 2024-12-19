import 'package:falconnect/lib.dart';

class NotImplementException extends ServerErrorException {
  const NotImplementException({
    super.statusCode = 501,
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
