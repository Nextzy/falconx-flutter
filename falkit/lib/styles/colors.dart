import 'package:falkit/lib.dart';

abstract class PaletteColor {
  const PaletteColor({
    required this.c25,
    required this.c50,
    required this.c100,
    required this.c200,
    required this.c300,
    required this.c400,
    required this.c500,
    required this.c600,
    required this.c700,
    required this.c800,
    required this.c900,
    required this.c950,
    required this.c975,
    required this.transparent,
  });

  final Color c25;
  final Color c50;
  final Color c100;
  final Color c200;
  final Color c300;
  final Color c400;
  final Color c500;
  final Color c600;
  final Color c700;
  final Color c800;
  final Color c900;
  final Color c950;
  final Color c975;
  final TransparentPalette transparent;
}

class TransparentPalette {
  const TransparentPalette(this.color);

  final Color color;

  Color get p1 => color.withOpacity(0.01);

  Color get p2 => color.withOpacity(0.02);

  Color get p3 => color.withOpacity(0.03);

  Color get p4 => color.withOpacity(0.04);

  Color get p5 => color.withOpacity(0.05);

  Color get p6 => color.withOpacity(0.06);

  Color get p8 => color.withOpacity(0.08);

  Color get p10 => color.withOpacity(0.10);

  Color get p12 => color.withOpacity(0.12);

  Color get p14 => color.withOpacity(0.14);

  Color get p16 => color.withOpacity(0.16);

  Color get p18 => color.withOpacity(0.18);

  Color get p20 => color.withOpacity(0.20);

  Color get p24 => color.withOpacity(0.24);

  Color get p30 => color.withOpacity(0.30);

  Color get p40 => color.withOpacity(0.40);

  Color get p50 => color.withOpacity(0.50);

  Color get p60 => color.withOpacity(0.60);

  Color get p70 => color.withOpacity(0.70);

  Color get p80 => color.withOpacity(0.80);

  Color get p90 => color.withOpacity(0.90);

  Color get p96 => color.withOpacity(0.96);

  Color get p98 => color.withOpacity(0.98);

  Color get p99 => color.withOpacity(0.99);
}
