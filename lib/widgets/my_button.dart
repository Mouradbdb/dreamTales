import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Future<void> Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(5),
        ),
        width: double.infinity,
        height: 40,
        child: Center(child: Text(text)),
      ),
    );
  }
}
