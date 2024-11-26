import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/controller/PasswordEye.dart';
import 'package:hrapp/controller/signup_controller.dart';
import 'package:hrapp/view/SignIn_with_employeeid.dart';
import 'package:hrapp/view/signin.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final PasswordController controller = Get.put(PasswordController());
  final EmailController _controller = Get.put(EmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "media/First2.png", // Replace with your image path
              fit: BoxFit.cover, // Ensures the image covers the entire background
            ),
          ),

          // Semi-transparent Overlay (Optional for better readability)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
            ),
          ),

          // Foreground Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Main Card for Form
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Card background
                      borderRadius: BorderRadius.circular(20), // Rounded corners
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
                            "Sign Up",
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
                            "Sign up for a new account",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Name Input Field
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Name",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Email Input Field
// Email Input Field with Validation
Obx(() => TextField(
      onChanged: (value) {
        _controller.email.value = value; // Update email in the controller
        _controller.validateEmail(value); // Trigger validation
      },
      decoration: InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorText: _controller.errorMessage.value.isEmpty
            ? null
            : _controller.errorMessage.value, // Show validation error
      ),
    )),

                        const SizedBox(height: 15),

                        // Password Input Field
                        Obx(() => TextField(
                              obscureText: controller.isObscured.value, // Toggle visibility
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
                        const SizedBox(height: 15),

                        // Confirm Password Input Field
                        Obx(() => TextField(
                              obscureText: controller.isObscured.value,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                prefixIcon: const Icon(Icons.lock_outline),
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
                        const SizedBox(height: 15),

                        // Gradient Sign Up Button
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF8862F2), // Purple gradient start
                                Color(0xFF7544FC), // Purple gradient middle
                                Color(0xFF5B2ED4), // Purple gradient end
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle sign-up logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // OR Divider
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "OR",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),

                        // Sign In With Employee ID Button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.purple),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {
Get.off(EmployeeIdSignIn())    ;                 },
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

                  // Already Have an Account Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(() => SignIn()); // Navigate to Sign In screen
                        },
                        child: const Text(
                          "Sign In",
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
