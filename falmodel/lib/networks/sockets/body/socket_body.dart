import 'package:falmodel/lib.dart';

abstract class BaseSocketBody extends BaseRequest {
  const BaseSocketBody();

  Map<String, Object?> toJson();

  String toJsonStr() => json.encode(toJson());
}
