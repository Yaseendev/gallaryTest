import 'package:gallary_test/Utils/locator.dart';
import 'package:gallary_test/Utils/services/api_service.dart';
import 'package:gallary_test/Utils/services/database_service.dart';
import '../models/user.dart';

class UserRepository {
  late final ApiService _networkApiService;
  late final DatabaseService _databaseService;

  UserRepository() {
    this._networkApiService = locator.get<ApiService>();
    this._databaseService = locator.get<DatabaseService>();
    ;
  }

  Future<User?> loginUser(
      {required String email, required String password}) async {
    late final User user;
    final result =
        await _networkApiService.login(email: email, password: password);
    user = User.fromJson(result!['user']);
    await _databaseService.setToken(result['token']);
    await _databaseService.setUser(user);
    return user;
  }

  Future<bool> isUserLoggedIn() async {
    return await _databaseService.getToken() != null;
  }
}
