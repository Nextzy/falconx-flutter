import 'dart:async';

import 'package:faltool/lib.dart';

extension FalconToolListExtensions<V> on List<V> {
  List<V> removeNulls() => removeNullsFromList(this);

  Future<List<T>> mapAsync<T>(Future<T> Function(V e) toElement) async =>
      await Future.wait(map((e) async => await toElement(e)));

  List<V> copy() => toList();

  bool edit(
      bool Function(V element) toElement, V Function(V oldData) editData) {
    final index = indexWhere(toElement);
    if (index != -1) {
      this[index] = editData(this[index]);
      return true;
    }
    return false;
  }
}

extension FalconToolListNullableExtensions<V> on List<V>? {
  bool get isEmptyOrNull => this == null || this?.isEmpty == true;

  bool get isNotEmptyOrNull => !isEmptyOrNull;

  bool get isNull => this == null;
  
  bool get isNotNull => this != null;

  Future<List<T>> futureAsyncMap<T>(
      FutureOr<T> Function(V element) toElement) async {
    return this != null
        ? await Stream.fromIterable(this!)
            .asyncMap((event) => toElement(event))
            .toList()
        : [];
  }
}
