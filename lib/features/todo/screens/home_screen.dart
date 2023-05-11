import 'package:elred/features/todo/models/todo.dart';
import 'package:elred/features/todo/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<TodoProvider>().addTodo(
                Todo(task: "task", date: DateTime.now(), completed: false),
              );
        },
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          return ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoProvider.todos[index].task),
              );
            },
          );
        },
      ),
    );
  }
}
