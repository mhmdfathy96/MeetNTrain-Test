import 'package:dartz/dartz.dart';
import 'package:test_project/src/core/error/failures.dart';

import '../entities/event.dart';

abstract class ScheduleEventsRepo{
 Future<Either<Failure,List<Event>>> fetchEvents({required int pageNumber});
}