

import '../../injector_container.dart';
import 'data/datasources/schedule_events_data_source.dart';
import 'data/repositories/schedule_events_repo_impl.dart';
import 'domain/repositories/schedule_events_repo.dart';
import 'domain/usecases/schedule_events_use_case_impl.dart';
import 'presentation/cubit/schedule_events_cubit.dart';

void scheduleEventsInjection() {
  ///Blocs
  getIt.registerFactory(
      () => ScheduleEventsCubit(scheduleEventsUseCaseImpl: getIt()));

  ///usecases
  getIt.registerLazySingleton<ScheduleEventsUseCaseImpl>(
      () => ScheduleEventsUseCaseImpl(scheduleEventsRepo: getIt()));

  ///Repositories
  getIt.registerLazySingleton<ScheduleEventsRepo>(
      () => ScheduleEventsRepoImpl(scheduleEventsDataSource: getIt()));

  ///DataSources
  getIt.registerLazySingleton<ScheduleEventsDataSource>(
      () => ScheduleEventsDataSourceImpl(dioConsumer: getIt()));
}
