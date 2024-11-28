import 'package:faltool/lib.dart';

extension FalconToolMapExtension<K, V> on Map<K, V> {
  Map<K, V> removeNullOrEmptyString() => removeNullsFromMap(this);
}

List<V> removeNullsFromList<V>(List<V> list) => list.isEmpty ? [] : list
  ..removeWhere(
      (value) => value is String ? value.isNullOrEmpty : value == null)
  ..map((e) => removeNulls(e)).toList();

Map<K, V> removeNullsFromMap<K, V>(Map<K, V> json) => json
  ..removeWhere((K key, V value) =>
      (key is String ? key.isNullOrEmpty : key == null) ||
      (value is String ? value.isNullOrEmpty : value == null))
  ..map<K, V>((key, value) => MapEntry(key, removeNulls(value)));

dynamic removeNulls(dynamic e) => (e is List)
    ? removeNullsFromList(e)
    : (e is Map ? removeNullsFromMap(e) : e);
