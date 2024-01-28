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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Here are gonna be weather widget here'),
        ),
        body: Column(
          children: [
            const TaskFilterCarousel(
              isCategory: true,
            ),
            const SizedBox(height: 16),
            const TaskFilterCarousel(
              isCategory: false,
            ),
            const SizedBox(height: 16),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                switch (state.status) {
                  case HomeStates.loading:
                    return const HomeStateLoading();
                  case HomeStates.error:
                    return const HomeStateError();
                  case HomeStates.loaded:
                    return HomeStateLoaded(tasks: state.getSortedTasks);
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
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
}
