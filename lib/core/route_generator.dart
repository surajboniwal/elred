import 'package:elred/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Widget child;

    switch (settings.name) {
      case LoginScreen.id:
        child = const LoginScreen();
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
