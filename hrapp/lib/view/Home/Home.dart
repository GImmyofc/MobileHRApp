import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/controller/task_controller.dart';
import 'package:hrapp/models/task_model.dart';
import 'package:hrapp/view/Home/TaskSummary.dart';


class HomeScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FB),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileSection(),
                const SizedBox(height: 20),
                _buildSummarySection(context),
                const SizedBox(height: 20),
                _buildTaskList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: const AssetImage("media/Ellipse.png"),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Esports Team Player",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                "League of Legends - Team Lead",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.message_rounded),
          color: Colors.blue,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_rounded),
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TaskSummaryScreen());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color(0xFF7544FC),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Summary of Your Work",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(
                  "To Do",
                  taskController.countByStatus("Pending"),
                  Colors.orange,
                ),
                _buildSummaryItem(
                  "In Progress",
                  taskController.countByStatus("In Progress"),
                  Colors.blue,
                ),
                _buildSummaryItem(
                  "Done",
                  taskController.countByStatus("Completed"),
                  Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String title, int count, Color color) {
    return Column(
      children: [
        Icon(Icons.circle, color: color),
        const SizedBox(height: 5),
        Text(
          "$count",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today Tasks",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: taskController.tasks.length,
              itemBuilder: (context, index) {
                final task = taskController.tasks[index];
                return GestureDetector(
                  onTap: () {
                    if (task.status != "Completed") {
                      _showTaskDialog(index);
                    }
                  },
                  child: _buildTaskCard(task),
                );
              },
            )),
      ],
    );
  }

  Widget _buildTaskCard(Task task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          Row(
            children: [
              Text(
                task.icon,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 8),
              Text(
                task.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Status: ${task.status}",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            "Points: ${task.points}",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _showTaskDialog(int index) {
    Get.defaultDialog(
      title: taskController.tasks[index].title,
      middleText: "Mark this task as finished?",
      textCancel: "Cancel",
      textConfirm: "Finish",
      onConfirm: () {
        taskController.markTaskAsFinished(index);
        Get.back();
      },
    );
  }
}
