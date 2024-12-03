import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/controller/task_controller.dart';
import 'package:hrapp/view/Home/Tasks.dart';

Widget _buildTaskList() {
  return Expanded(
    child: Obx(() {
      final filter = Get.find<TaskController>().selectedFilter.value;
      final filteredTasks = Get.find<TaskController>().tasks.where((task) {
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
          return Tasks()
              .buildTaskCard(task); // Ensure this method is accessible
        },
      );
    }),
  );
}
