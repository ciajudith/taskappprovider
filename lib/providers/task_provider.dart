import 'package:flutter/material.dart';
import 'package:taskappprovider/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggleCompleted();
    notifyListeners();
  }
}
