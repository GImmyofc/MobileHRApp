class EmailModel {
  String? validateEmail(String email) {
    const emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);

    if (!regex.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }
}
