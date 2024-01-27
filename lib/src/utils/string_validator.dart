// Implemented a StringValidator interface for form usage.
abstract class StringValidator {
  // Added a new title validation method for tasks.
  static String? getErrorMessageForTitle(String value) =>
      value.isNotEmpty ? null : 'Title can\'t be empty';
}
