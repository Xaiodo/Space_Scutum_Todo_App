import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

// This annotation tells Hive to generate a TypeAdapter
@HiveType(typeId: 1, adapterName: 'TaskAdapter')
class Task extends Equatable {
  const Task({
    required this.id,
    required this.title,
    this.description,
    this.completed = false,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final bool completed;

  // copyWith is used to create a new Task object with updated values from the original
  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
        completed: json['completed'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'completed': completed,
      };

  // props is used by Equatable to compare objects for equality (==)
  @override
  List<Object?> get props => [id, title, description, completed];
}
