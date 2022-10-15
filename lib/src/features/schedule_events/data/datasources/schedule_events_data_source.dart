import 'package:dio/dio.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/event_model.dart';

abstract class ScheduleEventsDataSource {
  Future<List<EventModel>> fetchEvents({required int pageNumber});
}

class ScheduleEventsDataSourceImpl implements ScheduleEventsDataSource {
  final DioConsumer dioConsumer;

  ScheduleEventsDataSourceImpl({required this.dioConsumer});
  @override
  Future<List<EventModel>> fetchEvents({required int pageNumber}) async {
    final res =
        await dioConsumer.get(EndPoints.upComingEvents, queryParameters: {
      "page": pageNumber,
      "date_gte": DateTime.now().toUtc(),
    });
      return List<EventModel>.from(
          res.map((json) => EventModel.fromJson(json)));
  }
}
