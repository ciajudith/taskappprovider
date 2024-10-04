class Task {
  String title;
  bool completed;

  Task({required this.title, this.completed = false});

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'completed': completed,
      };
  void toggleCompleted() {
    completed = !completed;
  }
}
