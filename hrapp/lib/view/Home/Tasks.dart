
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/controller/task_controller.dart';
import 'package:hrapp/models/task_model.dart';
import 'package:hrapp/view/Home/Payroll.dart';


class Tasks extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();

  Tasks({super.key});

  @override
  Widget _buildSummarySection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Payroll());
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
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             _buildSummarySection(context),
                const SizedBox(height: 20),
            _buildBurnoutStats(),
            const SizedBox(height: 20),
            _buildTaskFilters(),
            const SizedBox(height: 20),
            _buildTaskList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        backgroundColor: const Color(0xFF7544FC),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBurnoutStats() {
    final int completedTasks = taskController.tasks
        .where((task) => task.status == "Completed")
        .length;
    final int totalTasks = taskController.tasks.length;

    double burnoutPercentage = completedTasks / totalTasks;
    burnoutPercentage = burnoutPercentage.clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
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
          Row(
            children: [
              const Text(
                "Sprint 20 - Burnout Stats",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: burnoutPercentage > 0.8
                      ? const Color.fromARGB(255, 54, 244, 149).withOpacity(0.2)
                      : Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  burnoutPercentage > 0.8 ? "Poor" : "Moderate",
                  style: TextStyle(
                    color: burnoutPercentage > 0.8 ? Colors.red : Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "You've completed $completedTasks out of $totalTasks tasks. Keep up the work!",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 15),
          LinearProgressIndicator(
            value: burnoutPercentage,
            backgroundColor: Colors.grey[300],
            color: burnoutPercentage > 0.8 ? Colors.red : Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildTaskFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFilterButton("All"),
        _buildFilterButton("In Progress"),
        _buildFilterButton("Completed"),
      ],
    );
  }

  Widget _buildFilterButton(String filter) {
    return Obx(() {
      final isSelected = taskController.selectedFilter.value == filter;
      return GestureDetector(
        onTap: () {
          taskController.selectedFilter.value = filter;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF7544FC) : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected ? const Color(0xFF7544FC) : Colors.grey,
            ),
          ),
          child: Text(
            filter,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTaskList() {
    return Expanded(
      child: Obx(() {
        final filter = taskController.selectedFilter.value;
        final filteredTasks = taskController.tasks.where((task) {
          if (filter == "All") return true;
          return task.status == filter;
        }).toList();

        if (filteredTasks.isEmpty) {
          return const Center(
            child: Text(
              "No tasks available.",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: filteredTasks.length,
          itemBuilder: (context, index) {
            final task = filteredTasks[index];
            return buildTaskCard(task);
          },
        );
      }),
    );
  }

  Widget buildTaskCard(Task task) {
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

  void _showAddTaskDialog(BuildContext context) {
    final titleController = TextEditingController();
    final pointsController = TextEditingController();

    Get.defaultDialog(
      title: "Add New Task",
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: "Task Title",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: pointsController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Points",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      textCancel: "Cancel",
      textConfirm: "Add Task",
      onConfirm: () {
        final String title = titleController.text.trim();
        final int points = int.tryParse(pointsController.text.trim()) ?? 10;

        if (title.isNotEmpty) {
          taskController.tasks.add(Task(
            title: title,
            date: "Today",
            points: points,
          ));
          Get.back();
        }
      },
    );
  }
}
