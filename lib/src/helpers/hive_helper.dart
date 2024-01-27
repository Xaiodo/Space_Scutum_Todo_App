import 'package:hive_flutter/adapters.dart';

import '../enums/task_category.dart';
import '../models/task.dart';

abstract class HiveHelper {
  static const String _boxName = 'tasks_box';

  static Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Register the adapters for Task
    Hive.registerAdapter<TaskCategory>(TaskCategoryAdapter());
    Hive.registerAdapter<Task>(TaskAdapter());

    // Open the tasks box
    await Hive.openBox<Task>(_boxName);
  }

  // Get the tasks box from Hive
  static Box<Task> get tasksBox => Hive.box<Task>(_boxName);
}
