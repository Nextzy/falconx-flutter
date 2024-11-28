import 'package:falmodel/lib.dart';

abstract class BaseRequestBody extends BaseRequest {
  const BaseRequestBody();

  Map<String, Object?> toJson();

  String toJsonStr() => json.encode(toJson());
}
