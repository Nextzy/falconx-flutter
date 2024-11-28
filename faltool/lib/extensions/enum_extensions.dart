import 'package:faltool/lib.dart';

extension FalconToolEnumStringExtension on String {
  T toEnum<T extends Enum>(
    List<T> enumValues, {
    T? defaultValue,
    bool caseSensitive = false,
  }) =>
      caseSensitive
          ? enumValues.firstWhere(
              (e) => (e.toValueString() == this) || (e.toString() == this),
              orElse: () => defaultValue!,
            )
          : enumValues.firstWhere(
              (e) =>
                  (e.toValueString().toLowerCase() == toLowerCase()) ||
                  (e.toString().toLowerCase() == toLowerCase()),
              orElse: () => defaultValue!,
            );

  T? toEnumOrNull<T extends Enum>(
    List<T> enumValues, {
    bool caseSensitive = false,
  }) =>
      caseSensitive
          ? enumValues.firstOrNullWhere(
              (e) => (e.toValueString() == this) || (e.toString() == this))
          : enumValues.firstOrNullWhere((e) =>
              (e.toValueString().toLowerCase() == toLowerCase()) ||
              (e.toString().toLowerCase() == toLowerCase()));
}

extension FalconEnumExtension on Enum {
  String toValueString() => EnumToString.convertToString(this);
}
