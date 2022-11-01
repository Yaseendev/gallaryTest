import 'package:gallary_test/Utils/services/api_service.dart';
import 'package:gallary_test/Utils/services/database_service.dart';
import '../models/user.dart';

class UserRepository {
  late final ApiService _networkApiService;
  late final DatabaseService _databaseService;

  UserRepository({
    required ApiService? networkApiService,
    required DatabaseService? databaseService,
  }) {
    this._networkApiService = networkApiService!;
    this._databaseService = databaseService!;
  }
  
Future<User?> loginUser(
      {required String email, required String password}) async {
    late final User user;
    final result = await _networkApiService.loginUser(
        userNameOrPhone: userNameOrPhone, password: password);
    user = User.fromJson(result!['user']);
    user.language = _languageCubit.state!.languageCode;
    await _databaseService.setToken(result[kTokenString]);
    await _databaseService.setUser(user);
    return user;
  }
}
