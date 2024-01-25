import '../models/task.dart';

abstract class TaskDAO {
  // Get all tasks
  List<Task> getAllTasks();

  // Add a task
  void addTask(Task task);

  // Delete a task
  void deleteTask(String id);

  // Update a task
  void updateTask(Task task);

  // Clear all tasks
  void clearTasks();
}
