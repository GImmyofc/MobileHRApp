class Task {
  String title;
  String status; // "Pending", "In Progress", "Completed"
  String priority; // "High", "Medium", "Low"
  double progress;
  String date;
  int comments;
  int points; // Difficulty level points
  String icon; // Task category icon or emoji

  Task({
    required this.title,
    this.status = "Pending", // Default to "Pending"
    this.priority = "Medium", // Default to "Medium"
    this.progress = 0.0, // Default progress
    required this.date,
    this.comments = 0, // Default to no comments
    this.points = 10, // Default points
    this.icon = "📌",
    //  required Task task, // Default icon
  });
}
