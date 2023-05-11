import 'package:elred/features/todo/providers/todo_provider.dart';
import 'package:elred/shared/extensions/list_todo.dart';
import 'package:elred/shared/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens.dart';
import '../widgets/home_header.dart';
import '../widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String id = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoProvider>().getTodos();
  }

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
                if (todoProvider.loading) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (todos.isEmpty) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/no_data.png",
                        height: 130,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 24.0),
                        alignment: Alignment.center,
                        child: const Text(
                          "You have no tasks to do\nEnjoy your day!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ],
                  );
                }
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
