import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/view/Signup.dart';

class EmployeeIdSignIn extends StatelessWidget {
  final RxBool rememberMe = false.obs; // Observable for the checkbox

  EmployeeIdSignIn({super.key});

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
                            "Employee ID Sign In",
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
                            "Sign in with your Employee ID",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Employee ID Input Field
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Employee ID",
                            prefixIcon: Icon(Icons.badge),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Password Input Field
                        TextField(
                          obscureText: true, // For password input
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              
                            ),
                            
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Remember Me and Forgot Password Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Remember Me Checkbox
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      value: rememberMe.value,
                                      onChanged: (value) {
                                        rememberMe.value = value!;
                                      },
                                    ),
                                    const Text(
                                      "Remember Me",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),

                            // Forgot Password Button
                            TextButton(
                              onPressed: () {
                                // Handle forgot password logic
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.purple),
                              ),
                            ),
                          ],
                        ),

                        // Gradient Sign In Button
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
                              // Handle sign-in logic with Employee ID
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
                              "Sign In",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Back to Sign Up Screen Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(() => Signup()); // Navigate back to Signup screen
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
