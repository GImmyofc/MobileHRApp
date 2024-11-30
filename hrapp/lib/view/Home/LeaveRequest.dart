import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestLeavePage extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  RxString selectedCategory = 'Annual'.obs;
  RxInt leaveDuration = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Leave", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Leave Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Obx(() {
              return Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.category,
                      color: Color(0xFF9C27B0),
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedCategory.value,
                        onChanged: (String? newValue) {
                          selectedCategory.value = newValue!;
                        },
                        items: <String>['Annual', 'Sick', 'Personal']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          );
                        }).toList(),
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xFF9C27B0),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            SizedBox(height: 20),
            Text(
              'Leave Duration (in days)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Obx(() {
              return Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xFF9C27B0),
                      size: 30,
                    ),
                    Text(
                      '${leaveDuration.value} days',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (leaveDuration.value > 1) {
                              leaveDuration.value--;
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            leaveDuration.value++;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
            SizedBox(height: 20),
            Text(
              'Leave Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter Leave Description',
                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Submit Request Button Pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9C27B0),
                padding: EdgeInsets.symmetric(vertical: 14.0),
                minimumSize: Size(double.infinity, 56),
              ),
              child: Text(
                'Submit Request',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
