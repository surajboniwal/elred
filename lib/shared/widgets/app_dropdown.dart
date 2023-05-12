import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.notifier,
    required this.hint,
  });

  final ValueNotifier<String?> notifier;
  final String hint;

  static const items = ["Work", "Travel", "Shopping"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, child) {
          return DropdownButtonFormField(
            selectedItemBuilder: (context) => items
                .map(
                  (e) => Text(
                    e,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 16.0,
                    ),
                  ),
                )
                .toList(),
            items: items
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(
                      e,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              notifier.value = value;
            },
            value: value,
            style: const TextStyle(
              color: Colors.black87,
              fontFamily: "Poppins",
              fontSize: 16.0,
            ),
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
              focusedErrorBorder: const UnderlineInputBorder(
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
              suffix: GestureDetector(
                onTap: () {
                  notifier.value = null;
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.4),
                  radius: 10,
                  child: const Icon(
                    Icons.close,
                    size: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return "$hint is required";

              return null;
            },
          );
        });
  }
}
