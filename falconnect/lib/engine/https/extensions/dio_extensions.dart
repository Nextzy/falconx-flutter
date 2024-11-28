import 'package:falconnect/lib.dart';

extension RequestOptionExtensions on RequestOptions {
  void setHeaderTokenBearer(String token) {
    headers[HttpHeader.AUTHORIZE] = 'Bearer $token';
  }

  void removeHeaderToken() async {
    headers.remove(HttpHeader.AUTHORIZE);
  }
}
