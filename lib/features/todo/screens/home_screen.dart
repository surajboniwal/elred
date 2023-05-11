import 'package:elred/features/todo/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).pushNamed(AddTodoScreen.id);
        },
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          final todos = todoProvider.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(AddTodoScreen.id, arguments: {
                    "todo": todos[index],
                  });
                },
                title: Text(todos[index].task),
              );
            },
          );
        },
      ),
    );
  }
}
