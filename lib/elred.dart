import 'package:elred/features/todo/providers/todo_provider.dart';
import 'package:elred/shared/theme/app_theme.dart';
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
        builder: (context, child) {
          return MaterialApp(
            title: 'elRed',
            onGenerateRoute: RouteGenerator.onGenerateRoute,
            initialRoute: initialRoute,
            theme: AppTheme.theme,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
