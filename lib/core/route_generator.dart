import 'package:elred/features/screens.dart';
import 'package:flutter/material.dart';

import '../features/todo/models/todo.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Widget child;

    final args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case LoginScreen.id:
        child = const LoginScreen();
        break;
      case HomeScreen.id:
        child = const HomeScreen();
        break;
      case AddTodoScreen.id:
        Todo? todo;
        if (args != null && args['todo'] != null) {
          todo = args['todo'] as Todo?;
        }
        child = AddTodoScreen(todo: todo);
        break;
      default:
        child = const Scaffold(
          body: Center(
            child: Text("404"),
          ),
        );
    }

    return MaterialPageRoute(builder: (context) => child);
  }
}
