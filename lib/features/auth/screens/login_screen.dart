import 'package:elred/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../todo/screens/home_screen.dart';
import '../helpers/auth_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String id = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 44.0,
                  ),
                  children: [
                    const TextSpan(
                      text: "el",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: "Red",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent.withOpacity(0.7),
                      ),
                    ),
                    const TextSpan(
                      text: " ",
                    ),
                    const TextSpan(
                      text: "TODO",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              GestureDetector(
                onTap: () async {
                  final status = await AuthHelper.loginWithGoogle();

                  if (!status) return;

                  Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 12.0,
                        spreadRadius: -8,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Sign in with Google",
                      ),
                      const SizedBox(width: 12.0),
                      Image.asset(
                        "assets/images/google.png",
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
