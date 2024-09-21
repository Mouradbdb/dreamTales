import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Future<void> Function()? onTap;
  final bool isLoading;
  const MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.isLoading});

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
        height: 60,
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
