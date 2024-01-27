import 'package:hive_flutter/hive_flutter.dart';

part 'task_category.g.dart';

// This enum is used to filter tasks by category
@HiveType(typeId: 1, adapterName: 'TaskCategoryAdapter')
enum TaskCategory {
  @HiveField(0)
  all,
  @HiveField(1)
  home,
  @HiveField(2)
  work,
  @HiveField(3)
  personal,
}
