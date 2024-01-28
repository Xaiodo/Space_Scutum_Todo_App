import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_todo_app/src/helpers/hive_helper.dart';
import 'package:space_scutum_todo_app/src/pages/home/home.dart';
import 'package:space_scutum_todo_app/src/pages/home/home_page.dart';
import 'package:space_scutum_todo_app/src/providers/dependecies_provider.dart';

import 'src/services/weather_service.dart';

Future<void> main() async {
  // Ensure that all the widgets are initialized then initialize Hive and other things.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await HiveHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => DependeciesProvider(
        // Injected the HomeCubit here to ensure the availability of context when adding a task page.
        child: BlocProvider(
          create: (context) => HomeCubit(
            taskDao: context.read<TaskDAOHiveImpl>(),
            weatherService: context.read<WeatherService>(),
          ),
          child: MaterialApp(
            title: 'Space Scutum Todo App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          ),
        ),
      );
}
