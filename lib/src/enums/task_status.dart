import '../pages/home/home.dart';

// This enum is used to filter tasks by completion status
enum TaskStatus {
  all,
  completed,
  uncompleted;

  // These getters are used to check the status of the tasks
  bool get isCompleted => this == TaskStatus.completed;
  bool get isUncompleted => this == TaskStatus.uncompleted;
  bool get isAll => this == TaskStatus.all;

  // This method is used to check if the task passes the condition
  bool isPassesCondition(Task task) {
    switch (this) {
      case TaskStatus.all:
        return true;
      case TaskStatus.completed:
        return task.isCompleted;
      case TaskStatus.uncompleted:
        return !task.isCompleted;
      default:
        return false;
    }
  }
}
