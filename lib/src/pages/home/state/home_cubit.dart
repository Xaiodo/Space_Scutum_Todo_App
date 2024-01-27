import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../enums/task_category.dart';
import '../home.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(TaskDAO taskDao)
      : _taskDao = taskDao,
        super(const HomeState()) {
    init();
  }

  // The DAO instance to access the database
  final TaskDAO _taskDao;

  // Initialize the state with the tasks from the database
  void init() {
    emit(state.copyWith(status: HomeStates.loading));

    final tasks = _taskDao.getAllTasks();

    try {
      emit(state.copyWith(tasks: tasks, status: HomeStates.loaded));
    } catch (e) {
      emit(state.copyWith(status: HomeStates.error));
    }
  }

  // Get the tasks from the database
  void getTasks() {
    emit(state.copyWith(status: HomeStates.loading));

    try {
      final tasks = _taskDao.getAllTasks();

      emit(state.copyWith(tasks: tasks, status: HomeStates.loaded));
    } catch (e) {
      emit(state.copyWith(status: HomeStates.error));
    }
  }

  // Set the task category filter
  void taskCategoryChanged(TaskCategory taskCategory) {
    emit(state.copyWith(taskCategory: taskCategory));
  }

  // Set the task status filter
  void tasksStatusChanged(TaskStatus tasksStatus) {
    emit(state.copyWith(tasksStatus: tasksStatus));
  }

  // Method to toggle the task completion status
  void taskToggled(Task task) {
    emit(state.copyWith(status: HomeStates.loading));

    try {
      _taskDao.updateTask(task);

      final tasks = state.tasks.map((e) {
        if (e.id == task.id) {
          return task;
        } else {
          return e;
        }
      }).toList();

      emit(state.copyWith(tasks: tasks, status: HomeStates.loaded));
    } catch (e) {
      emit(state.copyWith(status: HomeStates.error));
    }
  }

  // Method to add a new task
  void addTask(Task task) {
    emit(state.copyWith(status: HomeStates.loading));

    try {
      _taskDao.addTask(task);

      final tasks = state.tasks..add(task);

      emit(state.copyWith(tasks: tasks, status: HomeStates.loaded));
    } catch (e) {
      emit(state.copyWith(status: HomeStates.error));
    }
  }

  // Method to delete a task
  void deleteTask(Task task) {
    emit(state.copyWith(status: HomeStates.loading));

    try {
      _taskDao.deleteTask(task.id);

      final tasks = state.tasks..remove(task);

      emit(state.copyWith(tasks: tasks, status: HomeStates.loaded));
    } catch (e) {
      emit(state.copyWith(status: HomeStates.error));
    }
  }
}
