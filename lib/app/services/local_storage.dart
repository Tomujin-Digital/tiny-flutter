import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

enum LocalStorageKey { theme, language, token, refrshToken }

class LocalStorageService extends GetxService {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  /// write value
  write(LocalStorageKey key, String? value) async {
    await _storage.write(key: key.name, value: value);
    print('LocalStorageService: save $key: $value');
  }

  void delete(LocalStorageKey key) async {
    await _storage.delete(key: key.name);
  }

  Future<String?> read(LocalStorageKey key) async {
    final value = await _storage.read(key: key.name);
    print('LocalStorageService: read $key');
    return value;
  }
}
