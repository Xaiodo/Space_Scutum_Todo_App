import 'package:equatable/equatable.dart';

import '../ask_task.dart';

// Add task page states enum.
enum AddTaskStates { loading, error, loaded }

class AddTaskState extends Equatable {
  const AddTaskState({
    this.status = AddTaskStates.loaded,
    this.title = const InputField(value: ''),
    this.description,
    this.isCompleted = false,
    this.category = TaskCategory.all,
  });

  final AddTaskStates status;
  final InputField title;
  final String? description;
  final bool isCompleted;
  final TaskCategory category;

  // Copy with method to create a new instance of the state with the updated values.
  AddTaskState copyWith({
    AddTaskStates? status,
    InputField? title,
    String? description,
    bool? isCompleted,
    TaskCategory? category,
    String? errorMessage,
  }) {
    return AddTaskState(
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      category: category ?? this.category,
    );
  }

  String? get getTitleErrorMessage =>
      StringValidator.getErrorMessageForTitle(title.value);

  // Equatable props to determine whether the state has changed.
  @override
  List<Object?> get props => [
        status,
        title,
        description,
        isCompleted,
        category,
      ];
}
