import 'package:elred/features/todo/providers/todo_provider.dart';
import 'package:elred/shared/extensions/date_time.dart';
import 'package:elred/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens.dart';
import '../models/todo.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id ?? ""),
      direction:
          !todo.completed ? DismissDirection.endToStart : DismissDirection.none,
      onDismissed: (_) {
        context.read<TodoProvider>().updateTodo(
              todo.copyWith(
                completed: !todo.completed,
              ),
            );
      },
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(AddTodoScreen.id, arguments: {
            "todo": todo,
          });
        },
        trailing: Text(
          todo.date.formatted,
          style: const TextStyle(color: Colors.grey, fontSize: 12.0),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  "assets/images/${todo.category.toLowerCase()}.png",
                ),
              ),
            ),
          ),
        ),
        title: Text(
          todo.task,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: todo.description.isEmpty
            ? null
            : Text(
                todo.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration:
                      todo.completed ? TextDecoration.lineThrough : null,
                ),
              ),
      ),
    );
  }
}

class TodoTileCheckbox extends StatelessWidget {
  const TodoTileCheckbox({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TodoProvider>().updateTodo(
              todo.copyWith(
                completed: !todo.completed,
              ),
            );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 12.0,
            backgroundColor: todo.completed ? AppColors.primary : Colors.grey,
            child: CircleAvatar(
              radius: 11.0,
              backgroundColor:
                  todo.completed ? AppColors.primary : Colors.white,
              child: const Icon(
                Icons.done,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
