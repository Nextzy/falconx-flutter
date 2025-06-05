import 'package:faltool/lib.dart';

extension FalconToolMapExtension<K, V> on Map<K, V> {
  /// Returns a new map with null values and empty strings removed
  Map<K, V> removeNullOrEmptyString() => Map<K, V>.fromEntries(
    entries
        .where((entry) =>
    !_isNullOrEmptyString(entry.key) &&
        !_isNullOrEmptyString(entry.value))
        .map((entry) => MapEntry(
      entry.key,
      _removeNullsDeep(entry.value),
    )),
  );
}

/// Checks if a value is null or an empty string
bool _isNullOrEmptyString(dynamic value) {
  if (value == null) return true;
  if (value is String) return value.isEmpty;
  return false;
}

/// Recursively removes nulls and empty strings from collections
T _removeNullsDeep<T>(T value) {
  if (value is List) {
    return removeNullsFromList(value) as T;
  } else if (value is Map) {
    return removeNullsFromMap(value) as T;
  }
  return value;
}

/// Removes nulls and empty strings from a list
List<T> removeNullsFromList<T>(List<T> list) {
  if (list.isEmpty) return <T>[];

  return list
      .where((item) => !_isNullOrEmptyString(item))
      .map(_removeNullsDeep)
      .toList();
}

/// Removes nulls and empty strings from a map
Map<K, V> removeNullsFromMap<K, V>(Map<K, V> map) {
  if (map.isEmpty) return <K, V>{};

  return Map<K, V>.fromEntries(
    map.entries
        .where((entry) =>
    !_isNullOrEmptyString(entry.key) &&
        !_isNullOrEmptyString(entry.value))
        .map((entry) => MapEntry(
      entry.key,
      _removeNullsDeep(entry.value),
    )),
  );
}

/// Public API for removing nulls and empty strings from any data structure
T removeNullsAndEmptyStrings<T>(T data) => _removeNullsDeep(data);
