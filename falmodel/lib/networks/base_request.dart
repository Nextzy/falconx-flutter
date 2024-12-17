import 'package:equatable/equatable.dart';
import 'package:falmodel/lib.dart';

abstract class BaseRequest with EquatableMixin {
  const BaseRequest();


  @override
  bool get stringify => true;
}
