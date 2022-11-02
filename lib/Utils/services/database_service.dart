import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gallary_test/Account/data/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  DatabaseService() {
    Hive.registerAdapter(UserAdapter());
  }

  Future<void> setToken(String token) async {
    await secureStorage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  Future<void> setUser(User user) async {
    final userBox = await getUserBox();
    userBox.put('CurrentUser', user);
  }

  Future<User?> getUser() async {
    final userBox = await getUserBox();
    return userBox.get('CurrentUser');
  }

  static Future<Box<User>> getUserBox() async {
    const String userBoxKey = 'UserBox';
    if (Hive.isBoxOpen(userBoxKey))
      return Hive.box(userBoxKey);
    else
      return await Hive.openBox(userBoxKey);
  }
}
