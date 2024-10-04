import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskappprovider/providers/task_provider.dart';
import 'package:taskappprovider/views/to_do_list_screen.dart';

void main() {
  runApp(TaskProviderApp());
}

class TaskProviderApp extends StatelessWidget {
  const TaskProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Provider App',
      home: ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: ToDoListScreen(),
      ),
    );
  }
}
