import 'package:falkit/lib.dart';

class Space {
  Space._();

  static Widget get empty => const SizedBox(); //
  static Widget get shrink => const SizedBox.shrink(); //
  static Widget get expand => const SizedBox.expand(); //

  static Widget box(double gap) => SizedBox(width: gap, height: gap);

  static Widget get boxZero => const SizedBox(width: 0.0, height: 0.0); //
  static Widget get box1 => const SizedBox(width: 1.0, height: 1.0); //
  static Widget get box2 => const SizedBox(width: 2.0, height: 2.0); //
  static Widget get box4 => const SizedBox(width: 4.0, height: 4.0); //
  static Widget get box6 => const SizedBox(width: 6.0, height: 6.0); //
  static Widget get box8 => const SizedBox(width: 8.0, height: 8.0); //
  static Widget get box10 => const SizedBox(width: 10.0, height: 10.0); //
  static Widget get box12 => const SizedBox(width: 12.0, height: 12.0); //
  static Widget get box14 => const SizedBox(width: 14.0, height: 14.0); //
  static Widget get box16 => const SizedBox(width: 16.0, height: 16.0); //
  static Widget get box18 => const SizedBox(width: 18.0, height: 18.0); //
  static Widget get box20 => const SizedBox(width: 20.0, height: 20.0); //
  static Widget get box24 => const SizedBox(width: 24.0, height: 24.0); //
  static Widget get box32 => const SizedBox(width: 32.0, height: 32.0); //
  static Widget get box40 => const SizedBox(width: 40.0, height: 40.0); //
  static Widget get box48 => const SizedBox(width: 48.0, height: 48.0); //
  static Widget get box56 => const SizedBox(width: 56.0, height: 56.0); //
  static Widget get box64 => const SizedBox(width: 64.0, height: 64.0); //
  static Widget get box72 => const SizedBox(width: 72.0, height: 72.0);

  static Widget gap(double gap) => Gap(gap); //
  static Widget get gapZero => const Gap(0.0); //
  static Widget get gap1 => const Gap(1.0); //
  static Widget get gap2 => const Gap(2.0); //
  static Widget get gap4 => const Gap(4.0); //
  static Widget get gap6 => const Gap(6.0); //
  static Widget get gap8 => const Gap(8.0); //
  static Widget get gap10 => const Gap(10.0); //
  static Widget get gap12 => const Gap(12.0); //
  static Widget get gap14 => const Gap(14.0); //
  static Widget get gap16 => const Gap(16.0); //
  static Widget get gap18 => const Gap(18.0); //
  static Widget get gap20 => const Gap(20.0); //
  static Widget get gap24 => const Gap(24.0); //
  static Widget get gap32 => const Gap(32.0); //
  static Widget get gap40 => const Gap(40.0); //
  static Widget get gap48 => const Gap(48.0); //
  static Widget get gap56 => const Gap(56.0); //
  static Widget get gap64 => const Gap(64.0); //
  static Widget get gap72 => const Gap(72.0); //

  ///==============///

  static EdgeInsets insetAll(double value) => EdgeInsets.all(value);

  static EdgeInsets insetOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);

  static EdgeInsets insetSymmetric({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  static EdgeInsets get insetZero => EdgeInsets.zero; //
  static EdgeInsets get insetAll1 => const EdgeInsets.all(1.0); //
  static EdgeInsets get insetAll2 => const EdgeInsets.all(2.0); //
  static EdgeInsets get insetAll4 => const EdgeInsets.all(4.0); //
  static EdgeInsets get insetAll6 => const EdgeInsets.all(6.0); //
  static EdgeInsets get insetAll8 => const EdgeInsets.all(8.0); //
  static EdgeInsets get insetAll10 => const EdgeInsets.all(10.0); //
  static EdgeInsets get insetAll12 => const EdgeInsets.all(12.0); //
  static EdgeInsets get insetAll14 => const EdgeInsets.all(14.0); //
  static EdgeInsets get insetAll16 => const EdgeInsets.all(16.0); //
  static EdgeInsets get insetAll18 => const EdgeInsets.all(18.0); //
  static EdgeInsets get insetAll20 => const EdgeInsets.all(20.0); //
  static EdgeInsets get insetAll24 => const EdgeInsets.all(24.0); //
  static EdgeInsets get insetAll32 => const EdgeInsets.all(32.0); //
  static EdgeInsets get insetAll40 => const EdgeInsets.all(40.0); //
  static EdgeInsets get insetAll56 => const EdgeInsets.all(56.0); //
  static EdgeInsets get insetAll64 => const EdgeInsets.all(64.0); //
  static EdgeInsets get insetAll72 => const EdgeInsets.all(72.0);

  static EdgeInsetsGeometry get insetGeometryZero => EdgeInsetsGeometry.zero; //
  static EdgeInsetsGeometry get insetGeometryAll1 =>
      const EdgeInsetsGeometry.all(1.0); //
  static EdgeInsetsGeometry get insetGeometryAll2 =>
      const EdgeInsetsGeometry.all(2.0); //
  static EdgeInsetsGeometry get insetGeometryAll4 =>
      const EdgeInsetsGeometry.all(4.0); //
  static EdgeInsetsGeometry get insetGeometryAll6 =>
      const EdgeInsetsGeometry.all(6.0); //
  static EdgeInsetsGeometry get insetGeometryAll8 =>
      const EdgeInsetsGeometry.all(8.0); //
  static EdgeInsetsGeometry get insetGeometryAll10 =>
      const EdgeInsetsGeometry.all(10.0); //
  static EdgeInsetsGeometry get insetGeometryAll12 =>
      const EdgeInsetsGeometry.all(12.0); //
  static EdgeInsetsGeometry get insetGeometryAll14 =>
      const EdgeInsetsGeometry.all(14.0); //
  static EdgeInsetsGeometry get insetGeometryAll16 =>
      const EdgeInsetsGeometry.all(16.0); //
  static EdgeInsetsGeometry get insetGeometryAll18 =>
      const EdgeInsetsGeometry.all(18.0); //
  static EdgeInsetsGeometry get insetGeometryAll20 =>
      const EdgeInsetsGeometry.all(20.0); //
  static EdgeInsetsGeometry get insetGeometryAll24 =>
      const EdgeInsetsGeometry.all(24.0); //
  static EdgeInsetsGeometry get insetGeometryAll32 =>
      const EdgeInsetsGeometry.all(32.0); //
  static EdgeInsetsGeometry get insetGeometryAll40 =>
      const EdgeInsetsGeometry.all(40.0); //
  static EdgeInsetsGeometry get insetGeometryAll56 =>
      const EdgeInsetsGeometry.all(56.0); //
  static EdgeInsetsGeometry get insetGeometryAll64 =>
      const EdgeInsetsGeometry.all(64.0); //
  static EdgeInsetsGeometry get insetGeometryAll72 =>
      const EdgeInsetsGeometry.all(72.0);

  ///==============///

  static EdgeInsets get insetVerticalZero => EdgeInsets.zero; //
  static EdgeInsets get insetVertical1 =>
      const EdgeInsets.symmetric(vertical: 1.0); //
  static EdgeInsets get insetVertical2 =>
      const EdgeInsets.symmetric(vertical: 2.0); //
  static EdgeInsets get insetVertical4 =>
      const EdgeInsets.symmetric(vertical: 4.0); //
  static EdgeInsets get insetVertical6 =>
      const EdgeInsets.symmetric(vertical: 6.0); //
  static EdgeInsets get insetVertical8 =>
      const EdgeInsets.symmetric(vertical: 8.0); //
  static EdgeInsets get insetVertical10 =>
      const EdgeInsets.symmetric(vertical: 10.0); //
  static EdgeInsets get insetVertical12 =>
      const EdgeInsets.symmetric(vertical: 12.0); //
  static EdgeInsets get insetVertical14 =>
      const EdgeInsets.symmetric(vertical: 14.0); //
  static EdgeInsets get insetVertical16 =>
      const EdgeInsets.symmetric(vertical: 16.0); //
  static EdgeInsets get insetVertical18 =>
      const EdgeInsets.symmetric(vertical: 18.0); //
  static EdgeInsets get insetVertical20 =>
      const EdgeInsets.symmetric(vertical: 20.0); //
  static EdgeInsets get insetVertical24 =>
      const EdgeInsets.symmetric(vertical: 24.0); //
  static EdgeInsets get insetVertical32 =>
      const EdgeInsets.symmetric(vertical: 32.0); //
  static EdgeInsets get insetVertical40 =>
      const EdgeInsets.symmetric(vertical: 40.0); //
  static EdgeInsets get insetVertical56 =>
      const EdgeInsets.symmetric(vertical: 56.0); //
  static EdgeInsets get insetVertical64 =>
      const EdgeInsets.symmetric(vertical: 64.0); //
  static EdgeInsets get insetVertical72 =>
      const EdgeInsets.symmetric(vertical: 72.0);

  static EdgeInsetsGeometry get insetGeometryVerticalZero =>
      EdgeInsetsGeometry.zero; //
  static EdgeInsetsGeometry get insetGeometryVertical1 =>
      const EdgeInsetsGeometry.symmetric(vertical: 1.0); //
  static EdgeInsetsGeometry get insetGeometryVertical2 =>
      const EdgeInsetsGeometry.symmetric(vertical: 2.0); //
  static EdgeInsetsGeometry get insetGeometryVertical4 =>
      const EdgeInsetsGeometry.symmetric(vertical: 4.0); //
  static EdgeInsetsGeometry get insetGeometryVertical6 =>
      const EdgeInsetsGeometry.symmetric(vertical: 6.0); //
  static EdgeInsetsGeometry get insetGeometryVertical8 =>
      const EdgeInsetsGeometry.symmetric(vertical: 8.0); //
  static EdgeInsetsGeometry get insetGeometryVertical10 =>
      const EdgeInsetsGeometry.symmetric(vertical: 10.0); //
  static EdgeInsetsGeometry get insetGeometryVertical12 =>
      const EdgeInsetsGeometry.symmetric(vertical: 12.0); //
  static EdgeInsetsGeometry get insetGeometryVertical14 =>
      const EdgeInsetsGeometry.symmetric(vertical: 14.0); //
  static EdgeInsetsGeometry get insetGeometryVertical16 =>
      const EdgeInsetsGeometry.symmetric(vertical: 16.0); //
  static EdgeInsetsGeometry get insetGeometryVertical18 =>
      const EdgeInsetsGeometry.symmetric(vertical: 18.0); //
  static EdgeInsetsGeometry get insetGeometryVertical20 =>
      const EdgeInsetsGeometry.symmetric(vertical: 20.0); //
  static EdgeInsetsGeometry get insetGeometryVertical24 =>
      const EdgeInsetsGeometry.symmetric(vertical: 24.0); //
  static EdgeInsetsGeometry get insetGeometryVertical32 =>
      const EdgeInsetsGeometry.symmetric(vertical: 32.0); //
  static EdgeInsetsGeometry get insetGeometryVertical40 =>
      const EdgeInsetsGeometry.symmetric(vertical: 40.0); //
  static EdgeInsetsGeometry get insetGeometryVertical56 =>
      const EdgeInsetsGeometry.symmetric(vertical: 56.0); //
  static EdgeInsetsGeometry get insetGeometryVertical64 =>
      const EdgeInsetsGeometry.symmetric(vertical: 64.0); //
  static EdgeInsetsGeometry get insetGeometryVertical72 =>
      const EdgeInsetsGeometry.symmetric(vertical: 72.0);

  ///==============///

  static EdgeInsets get insetHorizontalZero => EdgeInsets.zero; //
  static EdgeInsets get insetHorizontal1 =>
      const EdgeInsets.symmetric(horizontal: 1.0); //
  static EdgeInsets get insetHorizontal2 =>
      const EdgeInsets.symmetric(horizontal: 2.0); //
  static EdgeInsets get insetHorizontal4 =>
      const EdgeInsets.symmetric(horizontal: 4.0); //
  static EdgeInsets get insetHorizontal6 =>
      const EdgeInsets.symmetric(horizontal: 6.0); //
  static EdgeInsets get insetHorizontal8 =>
      const EdgeInsets.symmetric(horizontal: 8.0); //
  static EdgeInsets get insetHorizontal10 =>
      const EdgeInsets.symmetric(horizontal: 10.0); //
  static EdgeInsets get insetHorizontal12 =>
      const EdgeInsets.symmetric(horizontal: 12.0); //
  static EdgeInsets get insetHorizontal14 =>
      const EdgeInsets.symmetric(horizontal: 14.0); //
  static EdgeInsets get insetHorizontal16 =>
      const EdgeInsets.symmetric(horizontal: 16.0); //
  static EdgeInsets get insetHorizontal18 =>
      const EdgeInsets.symmetric(horizontal: 18.0); //
  static EdgeInsets get insetHorizontal20 =>
      const EdgeInsets.symmetric(horizontal: 20.0); //
  static EdgeInsets get insetHorizontal24 =>
      const EdgeInsets.symmetric(horizontal: 24.0); //
  static EdgeInsets get insetHorizontal32 =>
      const EdgeInsets.symmetric(horizontal: 32.0); //
  static EdgeInsets get insetHorizontal40 =>
      const EdgeInsets.symmetric(horizontal: 40.0); //
  static EdgeInsets get insetHorizontal56 =>
      const EdgeInsets.symmetric(horizontal: 56.0); //
  static EdgeInsets get insetHorizontal64 =>
      const EdgeInsets.symmetric(horizontal: 64.0); //
  static EdgeInsets get insetHorizontal72 =>
      const EdgeInsets.symmetric(horizontal: 72.0); //

  static EdgeInsetsGeometry get insetGeometryHorizontalZero =>
      EdgeInsetsGeometry.zero; //
  static EdgeInsetsGeometry get insetGeometryHorizontal1 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 1.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal2 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 2.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal4 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 4.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal6 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 6.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal8 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 8.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal10 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 10.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal12 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 12.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal14 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 14.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal16 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 16.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal18 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 18.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal20 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 20.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal24 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 24.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal32 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 32.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal40 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 40.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal56 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 56.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal64 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 64.0); //
  static EdgeInsetsGeometry get insetGeometryHorizontal72 =>
      const EdgeInsetsGeometry.symmetric(horizontal: 72.0); //

  ///==============///

  static EdgeInsets get insetLeftZero => EdgeInsets.zero; //
  static EdgeInsets get insetLeft1 => const EdgeInsets.only(left: 1.0); //
  static EdgeInsets get insetLeft2 => const EdgeInsets.only(left: 2.0); //
  static EdgeInsets get insetLeft4 => const EdgeInsets.only(left: 4.0); //
  static EdgeInsets get insetLeft6 => const EdgeInsets.only(left: 6.0); //
  static EdgeInsets get insetLeft8 => const EdgeInsets.only(left: 8.0); //
  static EdgeInsets get insetLeft10 => const EdgeInsets.only(left: 10.0); //
  static EdgeInsets get insetLeft12 => const EdgeInsets.only(left: 12.0); //
  static EdgeInsets get insetLeft14 => const EdgeInsets.only(left: 14.0); //
  static EdgeInsets get insetLeft16 => const EdgeInsets.only(left: 16.0); //
  static EdgeInsets get insetLeft18 => const EdgeInsets.only(left: 18.0); //
  static EdgeInsets get insetLeft20 => const EdgeInsets.only(left: 20.0); //
  static EdgeInsets get insetLeft24 => const EdgeInsets.only(left: 24.0); //
  static EdgeInsets get insetLeft32 => const EdgeInsets.only(left: 32.0); //
  static EdgeInsets get insetLeft40 => const EdgeInsets.only(left: 40.0); //
  static EdgeInsets get insetLeft56 => const EdgeInsets.only(left: 56.0); //
  static EdgeInsets get insetLeft64 => const EdgeInsets.only(left: 64.0); //
  static EdgeInsets get insetLeft72 => const EdgeInsets.only(left: 72.0); //

  static EdgeInsetsGeometry get insetStartZero =>
      const EdgeInsetsGeometry.directional(start: 0.0); //
  static EdgeInsetsGeometry get insetStart1 =>
      const EdgeInsetsGeometry.directional(start: 1.0); //
  static EdgeInsetsGeometry get insetStart2 =>
      const EdgeInsetsGeometry.directional(start: 2.0); //
  static EdgeInsetsGeometry get insetStart4 =>
      const EdgeInsetsGeometry.directional(start: 4.0); //
  static EdgeInsetsGeometry get insetStart6 =>
      const EdgeInsetsGeometry.directional(start: 6.0); //
  static EdgeInsetsGeometry get insetStart8 =>
      const EdgeInsetsGeometry.directional(start: 8.0); //
  static EdgeInsetsGeometry get insetStart10 =>
      const EdgeInsetsGeometry.directional(start: 10.0); //
  static EdgeInsetsGeometry get insetStart12 =>
      const EdgeInsetsGeometry.directional(start: 12.0); //
  static EdgeInsetsGeometry get insetStart14 =>
      const EdgeInsetsGeometry.directional(start: 14.0); //
  static EdgeInsetsGeometry get insetStart16 =>
      const EdgeInsetsGeometry.directional(start: 16.0); //
  static EdgeInsetsGeometry get insetStart18 =>
      const EdgeInsetsGeometry.directional(start: 18.0); //
  static EdgeInsetsGeometry get insetStart20 =>
      const EdgeInsetsGeometry.directional(start: 20.0); //
  static EdgeInsetsGeometry get insetStart24 =>
      const EdgeInsetsGeometry.directional(start: 24.0); //
  static EdgeInsetsGeometry get insetStart32 =>
      const EdgeInsetsGeometry.directional(start: 32.0); //
  static EdgeInsetsGeometry get insetStart40 =>
      const EdgeInsetsGeometry.directional(start: 40.0); //
  static EdgeInsetsGeometry get insetStart56 =>
      const EdgeInsetsGeometry.directional(start: 56.0); //
  static EdgeInsetsGeometry get insetStart64 =>
      const EdgeInsetsGeometry.directional(start: 64.0); //
  static EdgeInsetsGeometry get insetStart72 =>
      const EdgeInsetsGeometry.directional(start: 72.0); //

  ///==============///

  static EdgeInsets get insetRightZero => EdgeInsets.zero; //
  static EdgeInsets get insetRight1 => const EdgeInsets.only(right: 1.0); //
  static EdgeInsets get insetRight2 => const EdgeInsets.only(right: 2.0); //
  static EdgeInsets get insetRight4 => const EdgeInsets.only(right: 4.0); //
  static EdgeInsets get insetRight6 => const EdgeInsets.only(right: 6.0); //
  static EdgeInsets get insetRight8 => const EdgeInsets.only(right: 8.0); //
  static EdgeInsets get insetRight10 => const EdgeInsets.only(right: 10.0); //
  static EdgeInsets get insetRight12 => const EdgeInsets.only(right: 12.0); //
  static EdgeInsets get insetRight14 => const EdgeInsets.only(right: 14.0); //
  static EdgeInsets get insetRight16 => const EdgeInsets.only(right: 16.0); //
  static EdgeInsets get insetRight18 => const EdgeInsets.only(right: 18.0); //
  static EdgeInsets get insetRight20 => const EdgeInsets.only(right: 20.0); //
  static EdgeInsets get insetRight24 => const EdgeInsets.only(right: 24.0); //
  static EdgeInsets get insetRight32 => const EdgeInsets.only(right: 32.0); //
  static EdgeInsets get insetRight40 => const EdgeInsets.only(right: 40.0); //
  static EdgeInsets get insetRight56 => const EdgeInsets.only(right: 56.0); //
  static EdgeInsets get insetRight64 => const EdgeInsets.only(right: 64.0); //
  static EdgeInsets get insetRight72 => const EdgeInsets.only(right: 72.0); //

  static EdgeInsetsGeometry get insetGeometryEndZero =>
      const EdgeInsetsGeometry.directional(end: 0.0); //
  static EdgeInsetsGeometry get insetGeometryEnd1 =>
      const EdgeInsetsGeometry.directional(end: 1.0); //
  static EdgeInsetsGeometry get insetGeometryEnd2 =>
      const EdgeInsetsGeometry.directional(end: 2.0); //
  static EdgeInsetsGeometry get insetGeometryEnd4 =>
      const EdgeInsetsGeometry.directional(end: 4.0); //
  static EdgeInsetsGeometry get insetGeometryEnd6 =>
      const EdgeInsetsGeometry.directional(end: 6.0); //
  static EdgeInsetsGeometry get insetGeometryEnd8 =>
      const EdgeInsetsGeometry.directional(end: 8.0); //
  static EdgeInsetsGeometry get insetGeometryEnd10 =>
      const EdgeInsetsGeometry.directional(end: 10.0); //
  static EdgeInsetsGeometry get insetGeometryEnd12 =>
      const EdgeInsetsGeometry.directional(end: 12.0); //
  static EdgeInsetsGeometry get insetGeometryEnd14 =>
      const EdgeInsetsGeometry.directional(end: 14.0); //
  static EdgeInsetsGeometry get insetGeometryEnd16 =>
      const EdgeInsetsGeometry.directional(end: 16.0); //
  static EdgeInsetsGeometry get insetGeometryEnd18 =>
      const EdgeInsetsGeometry.directional(end: 18.0); //
  static EdgeInsetsGeometry get insetGeometryEnd20 =>
      const EdgeInsetsGeometry.directional(end: 20.0); //
  static EdgeInsetsGeometry get insetGeometryEnd24 =>
      const EdgeInsetsGeometry.directional(end: 24.0); //
  static EdgeInsetsGeometry get insetGeometryEnd32 =>
      const EdgeInsetsGeometry.directional(end: 32.0); //
  static EdgeInsetsGeometry get insetGeometryEnd40 =>
      const EdgeInsetsGeometry.directional(end: 40.0); //
  static EdgeInsetsGeometry get insetGeometryEnd56 =>
      const EdgeInsetsGeometry.directional(end: 56.0); //
  static EdgeInsetsGeometry get insetGeometryEnd64 =>
      const EdgeInsetsGeometry.directional(end: 64.0); //
  static EdgeInsetsGeometry get insetGeometryEnd72 =>
      const EdgeInsetsGeometry.directional(end: 72.0); //

  ///==============///

  static EdgeInsets get insetTopZero => EdgeInsets.zero; //
  static EdgeInsets get insetTop1 => const EdgeInsets.only(top: 1.0); //
  static EdgeInsets get insetTop2 => const EdgeInsets.only(top: 2.0); //
  static EdgeInsets get insetTop4 => const EdgeInsets.only(top: 4.0); //
  static EdgeInsets get insetTop6 => const EdgeInsets.only(top: 6.0); //
  static EdgeInsets get insetTop8 => const EdgeInsets.only(top: 8.0); //
  static EdgeInsets get insetTop10 => const EdgeInsets.only(top: 10.0); //
  static EdgeInsets get insetTop12 => const EdgeInsets.only(top: 12.0); //
  static EdgeInsets get insetTop14 => const EdgeInsets.only(top: 14.0); //
  static EdgeInsets get insetTop16 => const EdgeInsets.only(top: 16.0); //
  static EdgeInsets get insetTop18 => const EdgeInsets.only(top: 18.0); //
  static EdgeInsets get insetTop20 => const EdgeInsets.only(top: 20.0); //
  static EdgeInsets get insetTop24 => const EdgeInsets.only(top: 24.0); //
  static EdgeInsets get insetTop32 => const EdgeInsets.only(top: 32.0); //
  static EdgeInsets get insetTop40 => const EdgeInsets.only(top: 40.0); //
  static EdgeInsets get insetTop56 => const EdgeInsets.only(top: 56.0); //
  static EdgeInsets get insetTop64 => const EdgeInsets.only(top: 64.0); //
  static EdgeInsets get insetTop72 => const EdgeInsets.only(top: 72.0); //

  static EdgeInsetsGeometry get insetGeometryTopZero =>
      const EdgeInsetsGeometry.directional(top: 0.0); //
  static EdgeInsetsGeometry get insetGeometryTop1 =>
      const EdgeInsetsGeometry.directional(top: 1.0); //
  static EdgeInsetsGeometry get insetGeometryTop2 =>
      const EdgeInsetsGeometry.directional(top: 2.0); //
  static EdgeInsetsGeometry get insetGeometryTop4 =>
      const EdgeInsetsGeometry.directional(top: 4.0); //
  static EdgeInsetsGeometry get insetGeometryTop6 =>
      const EdgeInsetsGeometry.directional(top: 6.0); //
  static EdgeInsetsGeometry get insetGeometryTop8 =>
      const EdgeInsetsGeometry.directional(top: 8.0); //
  static EdgeInsetsGeometry get insetGeometryTop10 =>
      const EdgeInsetsGeometry.directional(top: 10.0); //
  static EdgeInsetsGeometry get insetGeometryTop12 =>
      const EdgeInsetsGeometry.directional(top: 12.0); //
  static EdgeInsetsGeometry get insetGeometryTop14 =>
      const EdgeInsetsGeometry.directional(top: 14.0); //
  static EdgeInsetsGeometry get insetGeometryTop16 =>
      const EdgeInsetsGeometry.directional(top: 16.0); //
  static EdgeInsetsGeometry get insetGeometryTop18 =>
      const EdgeInsetsGeometry.directional(top: 18.0); //
  static EdgeInsetsGeometry get insetGeometryTop20 =>
      const EdgeInsetsGeometry.directional(top: 20.0); //
  static EdgeInsetsGeometry get insetGeometryTop24 =>
      const EdgeInsetsGeometry.directional(top: 24.0); //
  static EdgeInsetsGeometry get insetGeometryTop32 =>
      const EdgeInsetsGeometry.directional(top: 32.0); //
  static EdgeInsetsGeometry get insetGeometryTop40 =>
      const EdgeInsetsGeometry.directional(top: 40.0); //
  static EdgeInsetsGeometry get insetGeometryTop56 =>
      const EdgeInsetsGeometry.directional(top: 56.0); //
  static EdgeInsetsGeometry get insetGeometryTop64 =>
      const EdgeInsetsGeometry.directional(top: 64.0); //
  static EdgeInsetsGeometry get insetGeometryTop72 =>
      const EdgeInsetsGeometry.directional(top: 72.0); //

  ///==============///

  static EdgeInsets get insetBottom1 => const EdgeInsets.only(bottom: 1.0); //
  static EdgeInsets get insetBottom2 => const EdgeInsets.only(bottom: 2.0); //
  static EdgeInsets get insetBottom4 => const EdgeInsets.only(bottom: 4.0); //
  static EdgeInsets get insetBottom6 => const EdgeInsets.only(bottom: 6.0); //
  static EdgeInsets get insetBottom8 => const EdgeInsets.only(bottom: 8.0); //
  static EdgeInsets get insetBottom10 => const EdgeInsets.only(bottom: 10.0); //
  static EdgeInsets get insetBottom12 => const EdgeInsets.only(bottom: 12.0); //
  static EdgeInsets get insetBottom14 => const EdgeInsets.only(bottom: 14.0); //
  static EdgeInsets get insetBottom16 => const EdgeInsets.only(bottom: 16.0); //
  static EdgeInsets get insetBottom18 => const EdgeInsets.only(bottom: 18.0); //
  static EdgeInsets get insetBottom20 => const EdgeInsets.only(bottom: 20.0); //
  static EdgeInsets get insetBottom24 => const EdgeInsets.only(bottom: 24.0); //
  static EdgeInsets get insetBottom32 => const EdgeInsets.only(bottom: 32.0); //
  static EdgeInsets get insetBottom40 => const EdgeInsets.only(bottom: 40.0); //
  static EdgeInsets get insetBottom56 => const EdgeInsets.only(bottom: 56.0); //
  static EdgeInsets get insetBottom64 => const EdgeInsets.only(bottom: 64.0); //
  static EdgeInsets get insetBottom72 => const EdgeInsets.only(bottom: 72.0); //

  static EdgeInsetsGeometry get insetGeometryBottomZero =>
      const EdgeInsetsGeometry.directional(bottom: 0.0); //
  static EdgeInsetsGeometry get insetGeometryBottom1 =>
      const EdgeInsetsGeometry.directional(bottom: 1.0); //
  static EdgeInsetsGeometry get insetGeometryBottom2 =>
      const EdgeInsetsGeometry.directional(bottom: 2.0); //
  static EdgeInsetsGeometry get insetGeometryBottom4 =>
      const EdgeInsetsGeometry.directional(bottom: 4.0); //
  static EdgeInsetsGeometry get insetGeometryBottom6 =>
      const EdgeInsetsGeometry.directional(bottom: 6.0); //
  static EdgeInsetsGeometry get insetGeometryBottom8 =>
      const EdgeInsetsGeometry.directional(bottom: 8.0); //
  static EdgeInsetsGeometry get insetGeometryBottom10 =>
      const EdgeInsetsGeometry.directional(bottom: 10.0); //
  static EdgeInsetsGeometry get insetGeometryBottom12 =>
      const EdgeInsetsGeometry.directional(bottom: 12.0); //
  static EdgeInsetsGeometry get insetGeometryBottom14 =>
      const EdgeInsetsGeometry.directional(bottom: 14.0); //
  static EdgeInsetsGeometry get insetGeometryBottom16 =>
      const EdgeInsetsGeometry.directional(bottom: 16.0); //
  static EdgeInsetsGeometry get insetGeometryBottom18 =>
      const EdgeInsetsGeometry.directional(bottom: 18.0); //
  static EdgeInsetsGeometry get insetGeometryBottom20 =>
      const EdgeInsetsGeometry.directional(bottom: 20.0); //
  static EdgeInsetsGeometry get insetGeometryBottom24 =>
      const EdgeInsetsGeometry.directional(bottom: 24.0); //
  static EdgeInsetsGeometry get insetGeometryBottom32 =>
      const EdgeInsetsGeometry.directional(bottom: 32.0); //
  static EdgeInsetsGeometry get insetGeometryBottom40 =>
      const EdgeInsetsGeometry.directional(bottom: 40.0); //
  static EdgeInsetsGeometry get insetGeometryBottom56 =>
      const EdgeInsetsGeometry.directional(bottom: 56.0); //
  static EdgeInsetsGeometry get insetGeometryBottom64 =>
      const EdgeInsetsGeometry.directional(bottom: 64.0); //
  static EdgeInsetsGeometry get insetGeometryBottom72 =>
      const EdgeInsetsGeometry.directional(bottom: 72.0); //
}
