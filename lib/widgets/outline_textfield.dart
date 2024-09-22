import 'package:flutter/material.dart';

class OutlineTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? obscureText;
  const OutlineTextfield({
    super.key,
    required this.controller,
    required this.labelText, this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      controller: controller,
    );
  }
}
