// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:untitled001/Utilities/time.dart';
import 'package:flutter/material.dart';

class ScheduleModel extends ChangeNotifier {
  DateTime selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedGate;

  ScheduleModel({
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedGate,
  });

  void updateDate(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  void updateTime(TimeOfDay newTime) {
    selectedTime = newTime;
    notifyListeners();
  }

  void updateGate(String newGate) {
    selectedGate = newGate;
    notifyListeners();
  }

  void notifyListeners() {}
}
