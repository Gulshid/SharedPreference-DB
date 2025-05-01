import 'package:flutter/material.dart';

class InputFieldTitle extends StatelessWidget {
  final String title;
  const InputFieldTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}