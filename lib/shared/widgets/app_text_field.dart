import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.editingEnabled = true,
    this.onTap,
    this.isRequired = true,
  });

  final TextEditingController controller;
  final String hint;
  final bool editingEnabled;
  final VoidCallback? onTap;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: TextFormField(
        controller: controller,
        enabled: editingEnabled,
        validator: (value) {
          if (!isRequired) return null;

          if (value == null || value.isEmpty) return "$hint is required";

          return null;
        },
        decoration: InputDecoration(
          hintText: hint,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.4),
          ),
          errorStyle: const TextStyle(
            color: Colors.amber,
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
