import 'package:falmodel/lib.dart';

abstract class BaseFormDataBody extends BaseRequest {
  const BaseFormDataBody();

  Map<String, Object?> toJson();

  String toJsonStr() => json.encode(toJson());

  Future<FormData> toFormData();
}
