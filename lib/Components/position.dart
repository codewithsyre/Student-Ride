import 'package:flutter/material.dart';

class Position extends StatelessWidget {
  const Position({
    Key? key,
    required this.title,
    required this.top,
    required this.left,
  }) : super(key: key);
  final String title;
  final double top;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          letterSpacing: 0.51,
        ),
      ),
    );
  }
}
