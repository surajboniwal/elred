import 'package:flutter/material.dart';

import '../../auth/helpers/auth_helper.dart';
import '../../screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final status = await AuthHelper.logout();
            if (!status) return;

            Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
          },
          child: const Text("Sign out"),
        ),
      ),
    );
  }
}
