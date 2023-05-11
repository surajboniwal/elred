import 'package:elred/presentation/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'elred.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
