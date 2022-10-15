import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';
import 'package:test_project/src/injector_container.dart' as di;

import '../../features/schedule_events/presentation/cubit/schedule_events_cubit.dart';
import '../../features/schedule_events/presentation/screens/home_screen.dart';
import '../../features/schedule_events/presentation/screens/schedule_events_screen.dart';

class Routes {
  static const String initialRoute = "/";
  static const String scheduleEventsScreen = "/scheduleEventsScreen";
}

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.scheduleEventsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => di.getIt<ScheduleEventsCubit>(),
                  child: const ScheduleEventsScreen(),
                ));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
