
import 'package:falmodel/lib.dart';

abstract class FirebaseModel with EquatableMixin {
  const FirebaseModel();


  Map<String, dynamic> toMap();


  @override
  bool get stringify => true;
}