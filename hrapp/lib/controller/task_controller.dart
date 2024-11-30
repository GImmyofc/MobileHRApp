import 'package:get/get.dart';

import '../models/task_model.dart';


class TaskController extends GetxController {
  var tasks = <Task>[
   Task(
      title: "Review Team Scrim Performance",
      status: "Completed",
      priority: "High",
      progress: 1.0,
      date: "27 April",
      comments: 2,
      points: 50,
      icon: "🔥",
    ),
    Task(
      title: "Plan Champion Select Strategy",
      status: "Pending",
      priority: "Medium",
      progress: 0.0,
      date: "28 April",
      comments: 1,
      points: 30,
      icon: "📜",
    ),
    Task(
      title: "Analyze Opponent's Match History",
      status: "Completed",
      priority: "Low",
      progress: 1.0,
      date: "26 April",
      comments: 5,
      points: 70,
      icon: "📊",
    ),
    Task(
      title: "Update Roster Information",
      status: "Completed",
      priority: "High",
      progress: 1.0,
      date: "29 April",
      comments: 3,
      points: 40,
      icon: "👥",
    ),
  ].obs;

  var selectedFilter = "All".obs; // Filter: All, In Progress, Completed

  void markTaskAsFinished(int index) {
    if (tasks[index].status != "Completed") {
      tasks[index].status = "Completed";
      tasks[index].progress = 1.0;
      update();
    }
  }

  int countByStatus(String status) {
    return tasks.where((task) => task.status == status).length;
  }
}
