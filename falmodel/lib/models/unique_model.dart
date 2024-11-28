import 'package:falmodel/lib.dart';

abstract class BaseUniqueModel<T> extends BaseModel<T> {
  BaseUniqueModel({String? id}) : id = id ?? UniqueKeyTool.generateUuid();

  final String id;
}
