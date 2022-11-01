import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gallary_test/Account/data/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  DatabaseService(){
    Hive.registerAdapter(UserAdapter());
  }

  Future<void> setToken(String token) async {
    await secureStorage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }
}
