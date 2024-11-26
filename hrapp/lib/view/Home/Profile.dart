import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/controller/task_controller.dart';

class Profile extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileInfo(),
            const SizedBox(height: 30),
            _buildLevelProgress(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    final int completedTasks = taskController.tasks
        .where((task) => task.status == "Completed")
        .length;

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "User Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text("Name: Faker League"),
          const SizedBox(height: 5),
          Text("Completed Tasks: $completedTasks"),
        ],
      ),
    );
  }

  Widget _buildLevelProgress() {
    // Calculate total points
    final int totalPoints = taskController.tasks
        .where((task) => task.status == "Completed")
        .fold(0, (sum, task) => sum + task.points);

    // Determine user level
    int level = 1;
    if (totalPoints > 10) level = 2;
    if (totalPoints > 50) level = 3;
    if (totalPoints > 70) level = 4;
    if (totalPoints > 100) level = 5;

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Level Progress",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Level: $level",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$totalPoints Points",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: (totalPoints % 100) / 100,
            backgroundColor: Colors.grey[300],
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
