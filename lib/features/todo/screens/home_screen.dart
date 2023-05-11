import 'package:elred/features/todo/providers/todo_provider.dart';
import 'package:elred/shared/extensions/list_todo.dart';
import 'package:elred/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens.dart';
import '../widgets/home_header.dart';
import '../widgets/todo_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.lightBlue,
        onPressed: () async {
          Navigator.of(context).pushNamed(AddTodoScreen.id);
        },
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 0, 0),
              child: Text(
                "TODOS",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                final todos = todoProvider.todos.pending.sorted;
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todos.length,
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.grey[300],
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  ),
                  itemBuilder: (context, index) {
                    return TodoTile(todo: todos[index]);
                  },
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 0, 0),
              child: Text(
                "COMPLETED",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                final todos = todoProvider.todos.completed.sorted;

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todos.length,
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.grey[300],
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  ),
                  itemBuilder: (context, index) {
                    return TodoTile(todo: todos[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
