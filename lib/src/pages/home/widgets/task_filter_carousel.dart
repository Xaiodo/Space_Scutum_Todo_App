import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home.dart';

class TaskFilterCarousel extends StatelessWidget {
  const TaskFilterCarousel({
    super.key,
    required this.isCategory,
    this.taskCategory,
    this.tasksStatus,
  });

  final bool isCategory;
  final TaskCategory? taskCategory;
  final TaskStatus? tasksStatus;

  Color? getItemColor(
    bool isCategory,
    int index,
    TaskCategory? taskCategory,
    TaskStatus? tasksStatus,
  ) {
    if (isCategory && taskCategory != null) {
      return TaskCategory.values[index] == taskCategory
          ? Colors.blue
          : Colors.grey[200];
    } else {
      return TaskStatus.values[index] == tasksStatus
          ? Colors.blue
          : Colors.grey[200];
    }
  }

  Color? getTextColor(
    bool isCategory,
    int index,
    TaskCategory? taskCategory,
    TaskStatus? tasksStatus,
  ) {
    if (isCategory && taskCategory != null) {
      return TaskCategory.values[index] == taskCategory
          ? Colors.white
          : Colors.black;
    } else {
      return TaskStatus.values[index] == tasksStatus
          ? Colors.white
          : Colors.black;
    }
  }

  void onTaskFilterChanged(int index, BuildContext context) {
    if (isCategory) {
      context.read<HomeCubit>().taskCategoryChanged(TaskCategory.values[index]);
    } else {
      context.read<HomeCubit>().tasksStatusChanged(TaskStatus.values[index]);
    }
  }

  String getTextForItem(bool isCategory, int index) {
    if (isCategory) {
      return TaskCategory.values[index].name;
    } else {
      return TaskStatus.values[index].name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: isCategory
              ? TaskCategory.values.length
              : TaskStatus.values.length,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => onTaskFilterChanged(index, context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: getItemColor(
                  isCategory,
                  index,
                  taskCategory,
                  tasksStatus,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  getTextForItem(isCategory, index),
                  style: TextStyle(
                    fontSize: 16,
                    color: getTextColor(
                      isCategory,
                      index,
                      taskCategory,
                      tasksStatus,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
