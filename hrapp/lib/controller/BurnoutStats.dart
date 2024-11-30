import 'package:flutter/material.dart';

class BurnoutStats extends StatelessWidget {
  final int completedTasks;
  final int totalTasks;

  const BurnoutStats({
    required this.completedTasks,
    required this.totalTasks,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double burnoutPercentage = completedTasks / totalTasks;
    burnoutPercentage = burnoutPercentage.clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
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
}
