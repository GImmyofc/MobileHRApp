
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/controller/SummarySection.dart';
import 'package:hrapp/controller/TaskCard.dart';

import '../models/task_model.dart';
import 'BurnoutStats.dart';
import 'FilterButton.dart';
import 'task_controller.dart';

class Tasks extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();

  Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SummarySection(
              todoCount: taskController.countByStatus("Pending"),
              inProgressCount: taskController.countByStatus("In Progress"),
              completedCount: taskController.countByStatus("Completed"),
            ),
            const SizedBox(height: 20),
            BurnoutStats(
              completedTasks: taskController.tasks
                  .where((task) => task.status == "Completed")
                  .length,
              totalTasks: taskController.tasks.length,
            ),
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

  Widget _buildTaskFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FilterButton(
          filter: "All",
          isSelected: taskController.selectedFilter.value == "All",
          onTap: () => taskController.selectedFilter.value = "All",
        ),
        FilterButton(
          filter: "In Progress",
          isSelected: taskController.selectedFilter.value == "In Progress",
          onTap: () => taskController.selectedFilter.value = "In Progress",
        ),
        FilterButton(
          filter: "Completed",
          isSelected: taskController.selectedFilter.value == "Completed",
          onTap: () => taskController.selectedFilter.value = "Completed",
        ),
      ],
    );
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
            return TaskCard(task: task);
          },
        );
      }),
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
