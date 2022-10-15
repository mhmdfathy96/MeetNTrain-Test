import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/api/dio_consumer.dart';
import 'core/api/dio_interceptors.dart';
import 'features/schedule_events/schedule_events_injection.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //!features
  scheduleEventsInjection();
  
  //!Core

  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(client: getIt()));

  //!External

  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => AppIntercepters());
  getIt.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
}
