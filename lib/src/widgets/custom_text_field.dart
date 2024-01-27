import 'package:flutter/material.dart';

import '../values/theme.dart';

// Created a custom text field widget with unique styling.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.title,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.errorText,
    this.hintText,
    super.key,
  });

  final TextEditingController? controller;
  final String title;
  final String? hintText;
  final String? errorText;
  final Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: errorText == null ? Colors.grey : Colors.red,
                ),
                gapPadding: 0,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              hintText: hintText,
            ),
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
          if (errorText != null && errorText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: Text(
                errorText!,
                style: Theme.of(context).textTheme.errorText,
              ),
            ),
        ],
      );
}
