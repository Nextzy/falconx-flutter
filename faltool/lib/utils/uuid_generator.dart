import 'package:uuid/uuid.dart';

class UuidGenerator{
  static const Uuid _uuid = Uuid();

  static String getV4() => _uuid.v4();
}
