import 'package:flutter_bloc/flutter_bloc.dart';

import '../ask_task.dart';

// Add task cubit to handle the state of the add task page.
class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit({
    required AddTaskCallback addTaskCallback,
  })  : _addTaskCallback = addTaskCallback,
        super(
          const AddTaskState(),
        );

  // Callback function to add a task implemented within Home Cubit and refresh the task list on the home page.
  final AddTaskCallback _addTaskCallback;

  // Getter method to determine whether the button should be enabled or disabled.
  get isButtonEnabled => state.title.value.isNotEmpty;

  // Method to manage changes in the title field and validate the error text for the field.
  void titleChanged(String title) {
    emit(
      state.copyWith(
        title: state.title.copyWith(
          value: title,
          errorMessage: state.getTitleErrorMessage,
        ),
      ),
    );
  }

  // Methods to handle the description field is changed.
  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  // Methods to handle the isCompleted field is changed.
  void isCompletedChanged(bool isCompleted) {
    emit(state.copyWith(isCompleted: isCompleted));
  }

  // Methods to handle the category field is changed.
  void categoryChanged(TaskCategory category) {
    emit(state.copyWith(category: category));
  }

  // Method to add a task.
  void addTask() {
    emit(state.copyWith(status: AddTaskStates.loading));

    try {
      // Create a task object from the state.
      final task = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: state.title.value,
        description: state.description,
        isCompleted: state.isCompleted,
        category: state.category,
      );

      // Add the task to the home state and database.
      _addTaskCallback.addTask(task);

      emit(state.copyWith(status: AddTaskStates.popPage));
    } catch (e) {
      emit(
        state.copyWith(
          status: AddTaskStates.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
