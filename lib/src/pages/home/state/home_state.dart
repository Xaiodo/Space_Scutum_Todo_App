import 'package:equatable/equatable.dart';
import '../../../enums/task_status.dart';
import '../../../models/task.dart';

import '../../../enums/task_category.dart';

// This enum is used to indicate the status of the HomeState
enum HomeStates {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    this.tasks = const [],
    this.status = HomeStates.initial,
    this.taskCategory = TaskCategory.all,
    this.tasksStatus = TaskStatus.all,
  });

  final List<Task> tasks;
  final HomeStates status;
  final TaskCategory taskCategory;
  final TaskStatus tasksStatus;

  // copyWith is used to create a new HomeState object with updated values from the original
  HomeState copyWith({
    List<Task>? tasks,
    HomeStates? status,
    TaskCategory? taskCategory,
    TaskStatus? tasksStatus,
  }) {
    return HomeState(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
      taskCategory: taskCategory ?? this.taskCategory,
      tasksStatus: tasksStatus ?? this.tasksStatus,
    );
  }

  // This getter is used to filter tasks by completion status and category from the state
  List<Task> get getSortedTasks => tasks.where(
        (element) {
          if (taskCategory == TaskCategory.all) {
            return tasksStatus.isPassesCondition(element);
          }
          return tasksStatus.isPassesCondition(element) &&
              element.category == taskCategory;
        },
      ).toList();

  // props is used by Equatable to compare objects for equality (==)
  @override
  List<Object?> get props => [tasks, taskCategory, status, tasksStatus];
}
