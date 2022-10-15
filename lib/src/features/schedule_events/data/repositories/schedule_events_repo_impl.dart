import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/event.dart';
import '../../domain/repositories/schedule_events_repo.dart';
import '../datasources/schedule_events_data_source.dart';
import '../models/event_model.dart';

class ScheduleEventsRepoImpl implements ScheduleEventsRepo {
  final ScheduleEventsDataSource scheduleEventsDataSource;

  ScheduleEventsRepoImpl({required this.scheduleEventsDataSource});
  @override
  Future<Either<Failure, List<Event>>> fetchEvents(
      {required int pageNumber}) async {
    try {
      final List<EventModel> res =
          await scheduleEventsDataSource.fetchEvents(pageNumber: pageNumber);
      return Right(res);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
