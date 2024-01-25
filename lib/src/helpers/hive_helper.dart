import 'package:hive_flutter/adapters.dart';

import '../models/task.dart';

abstract class HiveHelper {
  static const String _boxName = 'tasks_box';

  static Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Register the adapter for Task
    Hive.registerAdapter<Task>(TaskAdapter());
  }

  // Get the tasks box from Hive
  static Box<Task> get tasksBox => Hive.box<Task>(_boxName);
}
