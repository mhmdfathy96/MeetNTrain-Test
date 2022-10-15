
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName         
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            AppStrings.getEvents
          ),
          onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.scheduleEventsScreen),
        ),
      ),
    );
  }
}