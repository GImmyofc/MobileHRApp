import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/view/Signup.dart';
import 'package:hrapp/view/signin.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight * (2 / 3);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonwidth = screenWidth*(5/6);

    return Scaffold(
      body: Column(
        children: [
          // Stack for the top portion
          Stack(
            children: [
              // Background Image
              SizedBox(
                width: double.infinity,
                height: imageHeight, // Sets the height to 2/3 of the screen
                child: Image.asset(
                  "media/First2.png", // Background image
                  fit: BoxFit.cover, // Ensures the image covers the area
                ),
              ),

              // Move the second image down
              Positioned(
                bottom: 0, // Adjust this value to move the image lower
                left: 0,
                right: 0,
                child: Image.asset(
                  "media/First.png", // Second image
                  width: double.infinity, // Optional: Set the width of the image
                  fit: BoxFit.contain, // Optional: Adjust how the image scales
                ),
              ),
            ],
          ),

          // Add additional content below the Stack
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Eat, Sleep, Game, and Repeat",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome to Arcane's #1 Esports Team!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
    Container(
      width: buttonwidth,
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
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => Signup());
         },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Background is handled by gradient
          shadowColor: Colors.transparent, // No shadow
          padding: EdgeInsets.symmetric(vertical: 16), // Adjust button height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Matches container radius
          ),
        ),
        child: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text for contrast
          ),
        ),
      ),
    ),
         SizedBox(height: 15,),
         Container(
      width: buttonwidth,
      child: OutlinedButton(
        onPressed: () {
          Get.to(() => SignIn());
        },
        child: Text(
          "Sign In",
          style: TextStyle(
            fontSize: 16, // Adjust the font size as needed
            color: Colors.purple, 
            
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.purple, width: 2), // Purple border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          padding: EdgeInsets.symmetric(vertical: 16), // Adjust padding for height
        ),
      ),
         )
             
              ],
            ),
          ),
        ],
      ),
    );
  }
}
