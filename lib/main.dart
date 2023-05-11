import 'package:elred/features/screens.dart';
import 'package:elred/features/todo/providers/todo_provider.dart';
import 'package:elred/features/todo/repository/todo_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'elred.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  dependencyInjection();

  String initialRoute = LoginScreen.id;

  if (isUserSignedIn) {
    initialRoute = HomeScreen.id;
  }

  runApp(MyApp(initialRoute: initialRoute));
}

bool get isUserSignedIn {
  final user = FirebaseAuth.instance.currentUser;
  return user != null;
}

void dependencyInjection() {
  final di = GetIt.I;

  di.registerFactory<TodoRepository>(() => TodoRepository());

  di.registerFactory<TodoProvider>(() => TodoProvider(di<TodoRepository>()));
}
