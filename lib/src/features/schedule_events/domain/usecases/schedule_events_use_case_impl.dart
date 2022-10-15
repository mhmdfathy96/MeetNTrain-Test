import 'package:test_project/src/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/useCases/usecase.dart';
import '../entities/event.dart';
import '../repositories/schedule_events_repo.dart';

class ScheduleEventsUseCaseImpl implements UseCase<List<Event>, int> {
  final ScheduleEventsRepo scheduleEventsRepo;

  ScheduleEventsUseCaseImpl({required this.scheduleEventsRepo});
  @override
  Future<Either<Failure, List<Event>>> call(int pageNumber) {
    return scheduleEventsRepo.fetchEvents(pageNumber: pageNumber);
  }
}
