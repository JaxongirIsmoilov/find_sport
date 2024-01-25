import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/data_sources/remote/api_service.dart';
import '../data/repository/app_repository_impl.dart';
import '../domain/repository/app_repository.dart';

final getIt = GetIt.instance;
Alice alice = Alice(showNotification: true, showInspectorOnShake: true);
final dio = Dio(BaseOptions(
    baseUrl: 'https://qutb.uz/api/',
    receiveDataWhenStatusError: true,
    contentType: 'application/json'));

void setup() {
  dio.interceptors.add(alice.getDioInterceptor());
  getIt.registerSingleton<ApiService>(ApiService(dio));
  getIt.registerSingleton<AppRepository>(AppRepositoryImpl());
}
