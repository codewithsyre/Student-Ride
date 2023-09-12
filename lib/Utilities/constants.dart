import 'package:flutter/material.dart';

final kTextFieldDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.white,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.white,
    ),
  ),
  hintText: "Enter a value",
  hintStyle: TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

class Constants {
  static String uri = 'http://localhost:3000';
}
