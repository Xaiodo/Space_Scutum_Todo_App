import '../../../models/task.dart';

// Callback function to refresh the task list on the home page after adding a new task.
abstract class AddTaskCallback {
  // Add task method is implemented within the Home Cubit
  void addTask(Task task);
}
