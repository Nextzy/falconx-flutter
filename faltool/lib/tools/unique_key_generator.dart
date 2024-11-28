import 'package:uuid/uuid.dart';

class UniqueKeyTool{
  static const Uuid _uuid = Uuid();

  static String generateUuid() => _uuid.v4();
}