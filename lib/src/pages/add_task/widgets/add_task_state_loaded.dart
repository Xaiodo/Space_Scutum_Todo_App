import 'package:flutter/material.dart';

import '../../../enums/task_category.dart';
import '../../../widgets/custom_text_field.dart';

// LoadedStateWidget for the AddTask page.
class AddTaskStateLoaded extends StatelessWidget {
  const AddTaskStateLoaded({
    super.key,
    this.titleErrorText,
    required this.selectedCategory,
    required this.isButtonEnabled,
    required this.addTask,
    required this.onTitleChanged,
    required this.onDescriptionChanged,
    required this.onCategoryChanged,
  });

  final String? titleErrorText;
  final TaskCategory selectedCategory;
  final bool isButtonEnabled;
  final VoidCallback addTask;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onDescriptionChanged;
  final ValueChanged<TaskCategory> onCategoryChanged;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              title: 'Title',
              hintText: 'Do the laundry',
              errorText: titleErrorText,
              onChanged: onTitleChanged,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Description',
              hintText: 'Do the laundry at 6pm today or tomorrow morning',
              onChanged: onDescriptionChanged,
            ),
            const SizedBox(height: 16),
            Text(
              'Category',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final category = TaskCategory.values[index];
                return ListTile(
                  title: Text(
                    category.name,
                  ),
                  leading: Radio<TaskCategory>(
                    value: category,
                    groupValue: selectedCategory,
                    onChanged: (value) => onCategoryChanged(value!),
                  ),
                  onTap: () => onCategoryChanged(category),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: TaskCategory.values.length,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isButtonEnabled ? addTask : null,
              child: const Text('Add Task'),
            ),
          ],
        ),
      );
}
