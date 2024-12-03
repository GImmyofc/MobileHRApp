import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrapp/view/Home/LeaveRequest.dart';

class Leave extends StatefulWidget {
  const Leave({super.key});

  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  int _selectedIndex = 0;
  final List<Widget> _contentWidgets = [
    Text('Review Section: Here you can see the pending leave requests.',
        style: TextStyle(fontSize: 18)),
    Text(
        'Accepted Section: Here you can see the leave requests that were accepted.',
        style: TextStyle(fontSize: 18)),
    Text(
        'Denied Section: Here you can see the leave requests that were denied.',
        style: TextStyle(fontSize: 18)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: Image.asset(
              'media/LeaveSummary.png',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Leave',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Period Between Jan 2025 - 30 Dec 2025',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle, color: Colors.green),
                                Text("Available",
                                    style: TextStyle(fontSize: 20))
                              ],
                            ),
                            Text("30", style: TextStyle(fontSize: 30)),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle, color: Colors.red),
                                Text("Leaves Used",
                                    style: TextStyle(fontSize: 20))
                              ],
                            ),
                            Text("0", style: TextStyle(fontSize: 30)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButton('Review', 0),
                _buildButton('Accepted', 1),
                _buildButton('Denied', 2),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _contentWidgets[_selectedIndex],
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                backgroundColor: Color(0xFF9C27B0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(double.infinity, 56),
              ),
              onPressed: () {
                print("Request Leave Button Pressed");
                Get.to(() => RequestLeavePage());
              },
              child: Text(
                'Request Leave',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String title, int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: _selectedIndex == index ? Colors.white : Colors.black,
        backgroundColor:
            _selectedIndex == index ? Colors.purple : Colors.grey[300],
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
