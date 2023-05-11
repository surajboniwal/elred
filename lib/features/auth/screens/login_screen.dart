import 'package:flutter/material.dart';

import '../../screens.dart';
import '../helpers/auth_helper.dart';

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
              onPressed: () async {
                final status = await AuthHelper.loginWithGoogle();

                if (!status) return;

                Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
              },
              child: const Text("Sign in with Google"),
            ),
          ],
        ),
      ),
    );
  }
}
