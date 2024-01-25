import 'package:hive/hive.dart';
import 'task_dao.dart';
import '../models/task.dart';

class TaskDAOHiveImpl extends TaskDAO {
  TaskDAOHiveImpl();

  // Get the previously opened tasks box from Hive
  final Box<Task> _tasksBox = Hive.box<Task>('tasks_box');

  // Add a task to the tasks box
  @override
  Future<void> addTask(Task task) => _tasksBox.add(task);

  // Clear all tasks from the tasks box
  @override
  Future<void> clearTasks() => _tasksBox.clear();

  // Delete a task from the tasks box
  @override
  Future<void> deleteTask(String id) => _tasksBox.delete(id);

  // Get all tasks from the tasks box
  @override
  List<Task> getAllTasks() => _tasksBox.values.toList();

  // Update a task in the tasks box via replacing it with a new task
  @override
  Future<void> updateTask(Task task) {
    final index = _tasksBox.values
        .toList()
        .indexWhere((element) => element.id == task.id);
    return _tasksBox.putAt(index, task);
  }
}
