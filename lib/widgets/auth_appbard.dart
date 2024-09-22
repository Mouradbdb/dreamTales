import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget {
  final String text;
  const AuthAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiaryContainer,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/app_icon.png", height: 110),
            Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
