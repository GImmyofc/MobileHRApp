import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/controller/task_controller.dart';

class Payroll extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();

  Payroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Payroll Summary"),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTotalPoints(),
            const SizedBox(height: 20),
            _buildTaskBreakdown(),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPoints() {
    final int totalPoints = taskController.tasks
        .where((task) => task.status == "Completed")
        .fold(0, (sum, task) => sum + task.points);

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
            "Total Points Earned",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
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
    );
  }

  Widget _buildTaskBreakdown() {
    // Count completed tasks by level
    final levelCounts = {
      1: taskController.tasks
          .where((task) => task.status == "Completed" && task.points <= 10)
          .length,
      2: taskController.tasks
          .where((task) => task.status == "Completed" && task.points <= 50)
          .length,
      3: taskController.tasks
          .where((task) => task.status == "Completed" && task.points <= 70)
          .length,
      4: taskController.tasks
          .where((task) => task.status == "Completed" && task.points <= 100)
          .length,
      5: taskController.tasks
          .where((task) => task.status == "Completed" && task.points > 100)
          .length,
    };

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
            "Completed Tasks Breakdown",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...levelCounts.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Level ${entry.key} Tasks",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "${entry.value} Completed",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
