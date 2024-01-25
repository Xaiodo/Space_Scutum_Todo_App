import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:space_scutum_todo_app/src/enums/task_category.dart';

part 'task.g.dart';

// This annotation tells Hive to generate a TypeAdapter
@HiveType(typeId: 1, adapterName: 'TaskAdapter')
class Task extends Equatable {
  const Task({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.category = TaskCategory.all,
  });

  // This annotation tells Hive to generate fields for these values
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final bool isCompleted;
  @HiveField(4)
  final TaskCategory category;

  // copyWith is used to create a new Task object with updated values from the original
  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    TaskCategory? category,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      category: category ?? this.category,
    );
  }

  // props is used by Equatable to compare objects for equality (==)
  @override
  List<Object?> get props => [id, title, description, isCompleted, category];
}
