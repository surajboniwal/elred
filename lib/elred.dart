import 'package:flutter/material.dart';

import 'core/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'elRed',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: initialRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
