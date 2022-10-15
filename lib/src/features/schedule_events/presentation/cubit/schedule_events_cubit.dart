import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/event.dart';
import '../../domain/usecases/schedule_events_use_case_impl.dart';

part 'schedule_events_state.dart';

class ScheduleEventsCubit extends Cubit<ScheduleEventsState> {
  final ScheduleEventsUseCaseImpl scheduleEventsUseCaseImpl;
  ScheduleEventsCubit({required this.scheduleEventsUseCaseImpl})
      : super(ScheduleEventsInitial());

  int pageNumber = 1;
  bool isAllFetched = false;
  Future fetchEvents({bool firstFetch = false}) async {
    if (firstFetch) {
      pageNumber = 1;
      isAllFetched=false;
    }
    if (state is ScheduleEventsLoading) return;
    List<Event> oldEvents = [];
    final currentState = state;
    if (currentState is ScheduleEventsSuccess && !firstFetch) {
      oldEvents = currentState.events;
    }
    emit(ScheduleEventsLoading(
        oldEvents: oldEvents, isFirstFetch: pageNumber == 1));
    final res = await scheduleEventsUseCaseImpl.call(pageNumber);
    emit(res.fold(
      (failure) => ScheduleEventsFailure(),
      (events) {
        if (events.isEmpty) {
          isAllFetched = true;
        } else {
          pageNumber++;
        }
        List<Event> allEvents = (state as ScheduleEventsLoading).oldEvents;
        allEvents.addAll(events);
        return ScheduleEventsSuccess(events: allEvents);
      },
    ));
  }
}
