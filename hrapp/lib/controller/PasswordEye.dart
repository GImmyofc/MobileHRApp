import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool isObscured = true.obs; // Reactive state to toggle password visibility

  void toggleVisibility() {
    isObscured.value = !isObscured.value; // Toggle visibility
  }
}
