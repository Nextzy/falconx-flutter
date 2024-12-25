import 'package:falstore/lib.dart';

/// Singleton
class SecureStorage {
  const SecureStorage._singleton(
      {FlutterSecureStorage storage = const FlutterSecureStorage()})
      : _storage = storage;

  final FlutterSecureStorage _storage;
  static const SecureStorage instance = SecureStorage._singleton();

  Future<void> save(String key, {required String data}) =>
      _storage.write(key: key, value: data).then((value) {
        printInfo('Success save key: $key, data: $data to SecureStorage.');
        return value;
      });

  Future<String?> load(String key) => _storage.read(key: key).then((data) {
        printInfo('Success load key: $key, data: $data from SecureStorage.');
        return data;
      });

  Future<String> loadSafe(
    String key, {
    required String defaultData,
  }) =>
      _storage.read(key: key).then((data) {
        printInfo('Success load key: $key, data: $data from SecureStorage.');
        return data ?? defaultData;
      });

  Future<Map<String, String>> loadAll() => _storage.readAll().then((data) {
        printInfo('Success load all data: $data from SecureStorage.');
        return data;
      });

  Future<void> delete({required String key}) =>
      _storage.delete(key: key).then((value) {
        printInfo('Success delete key: $key from SecureStorage.');
        return value;
      });

  Future<void> deleteAll() => _storage.deleteAll();
}
