import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/view/Home/Home.dart';
import 'package:hrapp/view/Home/Leave.dart';
import 'package:hrapp/view/Home/Payroll.dart';
import 'package:hrapp/view/Home/Profile.dart';
import 'package:hrapp/view/Home/Tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
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
      bottomNavigationBar: BottomNavigationBar(fixedColor: Colors.black,
      unselectedItemColor: Colors.grey,
      backgroundColor: Color.fromARGB(0, 186, 71, 222),
      
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Payroll",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: "Leave",
          ),
        ],
      ),
    );
  }
}
