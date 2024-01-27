import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/home.dart';
import 'ask_task.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => AddTaskCubit(
          addTaskCallback: context.read<HomeCubit>(),
        ),
        child: const AddTaskPageView(),
      );
}

class AddTaskPageView extends StatelessWidget {
  const AddTaskPageView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              BlocBuilder<AddTaskCubit, AddTaskState>(
                builder: (context, state) {
                  switch (state.status) {
                    case AddTaskStates.loading:
                      return const AddTaskStateLoading();
                    case AddTaskStates.error:
                      return const AddTaskStateError();
                    case AddTaskStates.loaded:
                      return AddTaskStateLoaded(
                        titleErrorText: state.title.errorMessage,
                        selectedCategory: state.category,
                        isButtonEnabled:
                            context.read<AddTaskCubit>().isButtonEnabled,
                        addTask: context.read<AddTaskCubit>().addTask,
                        onTitleChanged:
                            context.read<AddTaskCubit>().titleChanged,
                        onDescriptionChanged:
                            context.read<AddTaskCubit>().descriptionChanged,
                        onCategoryChanged:
                            context.read<AddTaskCubit>().categoryChanged,
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      );
}
