import 'package:flutter/material.dart';
import 'elevated_button.dart';

class BookingPositioned extends StatelessWidget {
  const BookingPositioned({
    Key? key,
    required this.left,
    required this.top,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final double left;
  final double top;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: RoundedElevatedButton(
        buttonStyle: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white, // Background color
          elevation: 10.0, // Elevation/shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0), // Rounded corners
          ),
          minimumSize: Size(120.0, 30.0), // Minimum size of the button
        ),
        title: title,
        onPressed: onPressed,
      ),
    );
  }
}
