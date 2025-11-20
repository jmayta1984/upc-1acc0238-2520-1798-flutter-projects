import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();
  final String key = 'token';
  
  Future<void> save(String token) async {
    await storage.write(key: key, value: token);
  }

  Future<String?> read() async {
    return await storage.read(key: key);
  }
  Future<void> delete() async {
    await storage.delete(key: key);
  }
}