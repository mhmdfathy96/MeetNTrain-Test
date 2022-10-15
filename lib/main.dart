import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/src/injector_container.dart' as di;
import 'app.dart';
import 'src/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  BlocOverrides.runZoned(
      () => runApp(
            const MyApp(),
          ),
      blocObserver: AppBlocObserver());
}
