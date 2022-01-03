class ValidationMixin {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Enter a password, longer than 8 characters';
    }
    return null;
  }
}
