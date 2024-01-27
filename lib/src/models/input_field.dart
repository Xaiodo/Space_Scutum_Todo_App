import 'package:equatable/equatable.dart';

// The InputField class is used to represent the not nullable input fields in the add task page.
class InputField extends Equatable {
  const InputField({
    required this.value,
    this.errorMessage,
  });

  final String value;
  final String? errorMessage;

  InputField copyWith({
    String? value,
    String? errorMessage,
  }) =>
      InputField(
        value: value ?? this.value,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [
        value,
        errorMessage,
      ];
}
