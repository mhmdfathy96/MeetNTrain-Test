part of 'schedule_events_cubit.dart';

abstract class ScheduleEventsState extends Equatable {
  const ScheduleEventsState();

  @override
  List<Object> get props => [];
}

class ScheduleEventsInitial extends ScheduleEventsState {}

class ScheduleEventsLoading extends ScheduleEventsState {
  final List<Event> oldEvents;
  final bool isFirstFetch;

  const ScheduleEventsLoading({required this.oldEvents, this.isFirstFetch=false});
  @override
  List<Object> get props => [oldEvents,isFirstFetch];
}

class ScheduleEventsSuccess extends ScheduleEventsState {
  final List<Event> events;

  const ScheduleEventsSuccess({required this.events});
  @override
  List<Object> get props => [events];
}

class ScheduleEventsFailure extends ScheduleEventsState {}
