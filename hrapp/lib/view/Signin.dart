import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/controller/PasswordEye.dart';
import 'package:hrapp/controller/signup_controller.dart';
import 'package:hrapp/view/SignIn_with_employeeid.dart';
import 'package:hrapp/view/Signup.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final PasswordController controller = Get.put(PasswordController());
  final EmailController _controller = Get.put(EmailController());

  // Login function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "media/First2.png",
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // Foreground Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Main Card for Form
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Title and Subtitle
                        Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            "Log in to your account",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Email Input Field
                        Obx(() => TextField(
                              onChanged: (value) {
                                _controller.email.value = value;
                                _controller.validateEmail(value);
                              },
                              decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorText:
                                    _controller.errorMessage.value.isEmpty
                                        ? null
                                        : _controller.errorMessage.value,
                              ),
                            )),

                        const SizedBox(height: 15),

                        // Password Input Field
                        Obx(() => TextField(
                              obscureText: controller.isObscured.value,
                              onChanged: (value) {
                                controller.password.value = value;
                              },
                              decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isObscured.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: controller.toggleVisibility,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )),
                        const SizedBox(height: 10),

                        // Forgot Password Link
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle Forgot Password navigation
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Gradient Sign In Button
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF8862F2),
                                Color(0xFF7544FC),
                                Color(0xFF5B2ED4),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Error Message

                        const SizedBox(height: 15),

                        // Sign In With Employee ID Button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.purple),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.off(EmployeeIdSignIn());
                            },
                            icon: Icon(Icons.badge, color: Colors.purple),
                            label: Text(
                              "Sign In With Employee ID",
                              style: TextStyle(color: Colors.purple),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Don't Have an Account Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(() => Signup());
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
