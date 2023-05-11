import 'package:elred/features/todo/providers/todo_provider.dart';
import 'package:elred/shared/extensions/list_todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top) +
          const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/mountain.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.srcOver),
        ),
      ),
      child: Center(
        child: Row(
          children: [
            const Text(
              "Your\nTodos",
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Spacer(),
            Consumer<TodoProvider>(
              builder: (context, provider, child) {
                final todos = provider.todos;
                final completedCount = todos.completed.length;
                final pendingCount = todos.pending.length;
                return Row(
                  children: [
                    HeaderCountBanner(
                      label: pendingCount.toString(),
                      sublabel: "Pending",
                    ),
                    const SizedBox(width: 12.0),
                    HeaderCountBanner(
                      label: completedCount.toString(),
                      sublabel: "Completed",
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderCountBanner extends StatelessWidget {
  const HeaderCountBanner({
    super.key,
    required this.label,
    required this.sublabel,
  });

  final String label;
  final String sublabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 22.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          sublabel,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}