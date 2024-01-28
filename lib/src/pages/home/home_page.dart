import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_task/add_task_page.dart';
import 'home.dart';
import 'widgets/weather_app_bar/weather_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const HomePageView();
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: switch (state.status) {
                HomeStates.initial => const WeatherAppBarLoading(),
                HomeStates.loading => const WeatherAppBarLoading(),
                HomeStates.loaded => WeatherAppBarLoaded(
                    weather: state.weather,
                    imageUrl: state.weather.getImageUrl,
                  ),
                HomeStates.error => const WeatherAppBarError(),
              },
            ),
            body: Column(
              children: [
                const SizedBox(height: 16),
                TaskFilterCarousel(
                  isCategory: true,
                  taskCategory: state.taskCategory,
                ),
                const SizedBox(height: 16),
                TaskFilterCarousel(
                  isCategory: false,
                  tasksStatus: state.tasksStatus,
                ),
                const SizedBox(height: 16),
                switch (state.status) {
                  HomeStates.initial => const HomeStateLoading(),
                  HomeStates.loading => const HomeStateLoading(),
                  HomeStates.loaded => HomeStateLoaded(
                      tasks: state.getSortedTasks,
                    ),
                  HomeStates.error => const HomeStateError(),
                }
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.of(context)
                ..push(
                  MaterialPageRoute(
                    builder: (context) => const AddTaskPage(),
                  ),
                ),
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
          );
        },
      );
}
