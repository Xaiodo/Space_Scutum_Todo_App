import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_todo_app/src/models/task.dart';
import 'package:space_scutum_todo_app/src/pages/home/state/home_cubit.dart';

class HomeStateLoaded extends StatelessWidget {
  const HomeStateLoaded({required this.tasks, super.key});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) => tasks.isEmpty
      ? SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: const Center(
            child: Text('Create your first task!'),
          ),
        )
      : Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(tasks[index].title),
              subtitle: Text(tasks[index].description ?? ''),
              trailing: Checkbox(
                value: tasks[index].isCompleted,
                onChanged: (value) => context.read<HomeCubit>().taskToggled(
                      tasks[index].copyWith(isCompleted: value),
                    ),
              ),
            ),
            itemCount: tasks.length,
          ),
        );
}
