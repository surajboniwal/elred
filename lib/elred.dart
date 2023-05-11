import 'package:elred/features/todo/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'core/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (context) => GetIt.I(),
      child: MaterialApp(
        title: 'elRed',
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        initialRoute: initialRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
