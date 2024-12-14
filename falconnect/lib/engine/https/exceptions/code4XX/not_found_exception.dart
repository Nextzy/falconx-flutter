import 'package:falconnect/lib.dart';

class NotFoundException extends ClientErrorException {
  const NotFoundException({
    super.code = 404,
    super.message,
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
