import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  RoundedElevatedButton({
    required this.buttonStyle,
    required this.title,
    required this.onPressed,
  });

  final ButtonStyle buttonStyle;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
