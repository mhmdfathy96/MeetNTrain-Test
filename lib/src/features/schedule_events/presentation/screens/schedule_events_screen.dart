import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/src/core/utils/media_query_values.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dialogs.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import 'dart:math' as math;
import '../../../../core/widgets/reloading_widget.dart';
import '../../domain/entities/event.dart';
import '../cubit/schedule_events_cubit.dart';
import '../widgets/date_widget.dart';
import '../widgets/end_widget.dart';
import '../widgets/event_widget.dart';

class ScheduleEventsScreen extends StatefulWidget {
  const ScheduleEventsScreen({super.key});

  @override
  State<ScheduleEventsScreen> createState() => _ScheduleEventsScreenState();
}

class _ScheduleEventsScreenState extends State<ScheduleEventsScreen> {
  late ScheduleEventsCubit scheduleEventsCubit;
  final ScrollController scrollController = ScrollController();

  Future _fetchEvents({bool firstFetch = false}) async {
    if (!isAllFetched || firstFetch) {
      await scheduleEventsCubit.fetchEvents(firstFetch: firstFetch);
    }
  }

  bool get isAllFetched {
    return scheduleEventsCubit.isAllFetched;
  }

  @override
  void didChangeDependencies() {
    scheduleEventsCubit = BlocProvider.of<ScheduleEventsCubit>(context);
    _fetchEvents(firstFetch: true);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent &&
            scheduleEventsCubit.state is! ScheduleEventsLoading) {
          _fetchEvents();
          debugPrint("new Data");
        }
      }
    });
  }

  bool get loadingMoreEvents {
    if (scrollController.hasClients) {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          scheduleEventsCubit.state is ScheduleEventsLoading) return true;
    }
    return false;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: context.height * 0.18,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.horizontalPadding,
            ),
            child: Column(
              children: [
                AppBar(
                  leading: Transform(
                    transform: Matrix4.rotationY(math.pi),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InkWell(
                        child: SvgPicture.asset(IconAssets.arrowRightCircle),
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(Routes.initialRoute),
                      ),
                    ),
                  ),
                  title: const Text(
                    AppStrings.schedule,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.iconColor,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: AppColors.iconColor,
                        size: context.width * .07,
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.03,
                    ),
                    DateWidget(dateTime: DateTime.now()),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async => await _fetchEvents(firstFetch: true),
          child: BlocConsumer<ScheduleEventsCubit, ScheduleEventsState>(
            listener: (context, state) async {
              if (state is ScheduleEventsFailure) {
                await AppDialogs.showToast(
                    message: AppStrings.somethingWentWrong);
              }
            },
            builder: (context, state) {
              if (state is ScheduleEventsLoading && state.isFirstFetch) {
                return const ReloadingWidget();
              } else if (state is ScheduleEventsSuccess ||
                  (state is ScheduleEventsLoading && !state.isFirstFetch)) {
                final events = state.props[0] as List<Event>;
                return Stack(
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) {
                        if (index < events.length) {
                          return EventWidget(event: events[index]);
                        } else {
                          return const EndWidget();
                        }
                      },
                      itemCount: events.length + ((isAllFetched) ? 1 : 0),
                      controller: scrollController,
                    ),
                    if (loadingMoreEvents)
                      Positioned(
                        bottom: 8,
                        left: context.width * .5,
                        child: const ReloadingWidget(),
                      )
                  ],
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.noEventsAvailable),
                      IconButton(
                        onPressed: () async =>
                            await _fetchEvents(firstFetch: true),
                        icon: const Icon(
                          Icons.refresh_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}
