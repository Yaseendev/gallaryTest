import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'constants.dart';
import 'services/api_service.dart';
import 'services/database_service.dart';

final locator = GetIt.instance;

Future<void> locatorsSetup() async {
locator.registerLazySingleton<ApiService>(() => ApiService(Dio(BaseOptions(
          connectTimeout: 20000,
          receiveTimeout: 20000,
          contentType: 'application/json',
          baseUrl: Urls.BASE_API,
          headers: {
            "Access-Control-Allow-Origin":
                "*", // Required for CORS support to work
            "Access-Control-Allow-Credentials":
                true, // Required for cookies, authorization headers with HTTPS
            "Access-Control-Allow-Headers":
                "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"
          }))));
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
}