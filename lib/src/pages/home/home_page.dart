import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_task/add_task_page.dart';
import 'home.dart';

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
            appBar: AppBar(
              title: const Text('Here are gonna be weather widget here'),
            ),
            body: Column(
              children: [
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
