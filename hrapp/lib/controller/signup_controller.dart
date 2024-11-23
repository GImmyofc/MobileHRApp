import 'package:get/get.dart';

class EmailController extends GetxController {
  var email = ''.obs;
  var errorMessage = ''.obs;

  void validateEmail(String input) {
    const emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);

    if (input.isEmpty) {
      errorMessage.value = "Email cannot be empty";
    } else if (!regex.hasMatch(input)) {
      errorMessage.value = "Invalid email format";
    } else {
      errorMessage.value = "";
    }
  }
}
