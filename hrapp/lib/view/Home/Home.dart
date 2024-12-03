import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/controller/custom_bottom_navigation.dart';
import 'package:hrapp/controller/task_controller.dart';

import 'package:hrapp/models/task_model.dart';
import 'package:hrapp/view/Home/Leave.dart';
import 'package:hrapp/view/Home/Payroll.dart';
import 'package:hrapp/view/Home/Profile.dart';
import 'package:hrapp/view/Home/Tasks.dart';

class HomeScreen extends StatefulWidget {
  final TaskController taskController = Get.put(TaskController(Tasks));

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
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
                _buildCard(),
                const SizedBox(height: 20),
                _buildTaskList(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: taskController.currentIndex.value,
          onTap: (index) {
            taskController.currentIndex.value = index;
          },
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
          icon: const Icon(Icons.notifications_rounded),
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "media/Banner.png", // Background image
            fit: BoxFit.cover, // Ensures the image covers the area
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

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Tracks the selected index

  final List<Widget> _screens = [
    Home(),
    Payroll(),
    Profile(),
    Tasks(),
    Leave(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[
          _currentIndex], // Shows the corresponding screen based on index
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap, // Callback when a tab is selected
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Payroll(),
    Profile(),
    Tasks(),
    Leave()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}
