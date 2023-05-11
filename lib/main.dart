import 'package:elred/core/route_generator.dart';
import 'package:elred/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'elRed',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: SplashScreen.id,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
