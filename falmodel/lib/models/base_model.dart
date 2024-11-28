import 'package:falmodel/lib.dart';

abstract class BaseModel<T> with EquatableMixin {
  const BaseModel();

  @override
  bool? get stringify => true;

  T copyWith();
}
