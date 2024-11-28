import 'package:flutter/widgets.dart';

extension FalconToolContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => screenSize.height;

  double get screenHeightWithoutInsets =>
      screenSize.height -
      MediaQuery.of(this).viewInsets.top -
      MediaQuery.of(this).viewInsets.bottom;

  double get screenWidth => screenSize.width;
}
