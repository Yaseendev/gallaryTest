import 'package:dio/dio.dart';
import '../constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>?> login(
      {required String email, required String password}) async {
    Response response = await _dio.post(Urls.LOGIN, data: {
      'email': email,
      'password': password,
    });
    return response.data;
  }

  }