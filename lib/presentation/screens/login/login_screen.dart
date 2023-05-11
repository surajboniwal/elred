import 'package:elred/presentation/screens/login/helpers/auth_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String id = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                AuthHelper.loginWithGoogle();
              },
              child: const Text("Sign in with Google"),
            ),
            ElevatedButton(
              onPressed: () {
                // AuthHelper.logout();
              },
              child: const Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
