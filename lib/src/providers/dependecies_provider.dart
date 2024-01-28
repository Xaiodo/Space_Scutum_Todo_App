import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_todo_app/src/services/weather_service.dart';
import 'package:space_scutum_todo_app/src/utils/rest_client.dart';

import '../dao/task_dao_hive_impl.dart';

// This widget is used to provide dependencies to the app widget tree via MultiRepositoryProvider
class DependeciesProvider extends StatelessWidget {
  const DependeciesProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => TaskDAOHiveImpl(),
          ),
          RepositoryProvider(create: (context) => Dio()),
          RepositoryProvider(
            create: (context) => RestClient(
              dio: context.read(),
            ),
          ),
          RepositoryProvider(
            create: (context) => WeatherService(
              restClient: context.read(),
            ),
          )
        ],
        child: child,
      );
}
