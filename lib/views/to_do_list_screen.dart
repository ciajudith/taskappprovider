import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskappprovider/models/task.dart';
import 'package:taskappprovider/providers/task_provider.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Add a new task',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  todoProvider.addTask(Task(title: value));
                  _controller.clear();
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.tasks.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.tasks[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {
                      todoProvider.toggleTask(todo);
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      todoProvider.removeTask(todo);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
