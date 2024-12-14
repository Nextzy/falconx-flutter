import 'package:falmodel/lib.dart';

abstract class BaseUniqueModel<T> extends BaseModel<T> {
  BaseUniqueModel({String? id}) : id = id ?? UuidGenerator.getV4();

  final String id;
}
