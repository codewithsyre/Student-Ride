import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/elevated_button.dart';
import '../Components/position.dart';
import '../Components/positioned_container.dart';
import '../Models/user_location_model.dart';
import '../Utilities/time.dart';
import 'booking.dart';

class Schedule extends StatefulWidget {
  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  var selectedDate;
  var selectedTime;
  final List<String> gateItems = [
    'Gate 1',
    'Gate 2',
    'Gate 3',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
  }

  // Time method
  _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Date method

  _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
    return pickedTime;
  }

  @override
  Widget build(BuildContext context) {
    final scheduleModel = Provider.of<ScheduleModel>(context);
    return Scaffold(
      body: Container(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color.fromARGB(255, 248, 248, 248),
              Color.fromARGB(255, 248, 249, 250),
              Color.fromARGB(255, 255, 255, 255)
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage('assets/image4.jpg'),
            fit: BoxFit.cover,
            scale: 0.1,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 88,
              padding: EdgeInsets.only(top: 18, left: 12),
            ),
            Spacer(),
            Expanded(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        '${selectedTime.hour} : ${selectedTime.minute}',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      RoundedElevatedButton(
                        buttonStyle: ElevatedButton.styleFrom(
                          foregroundColor: Colors.lightBlueAccent,
                          backgroundColor: Color.fromARGB(255, 250, 228, 182),
                          // Background color
                          elevation: 10.0, // Elevation/shadow
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(7.0), // Rounded corners
                          ),
                          minimumSize:
                              Size(100.0, 40.0), // Minimum size of the button
                        ),
                        title: 'Select Time',
                        onPressed: () async {
                          final newTime = await _selectTime(context);
                          if (newTime != null) {
                            scheduleModel.updateTime(newTime);
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      RoundedElevatedButton(
                        buttonStyle: ElevatedButton.styleFrom(
                          foregroundColor: Colors.lightBlueAccent,
                          backgroundColor: Color.fromARGB(255, 250, 228, 182),
                          // Background color
                          elevation: 10.0, // Elevation/shadow
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(7.0), // Rounded corners
                          ),
                          minimumSize:
                              Size(100.0, 40.0), // Minimum size of the button
                        ),
                        title: 'Select Date',
                        onPressed: () {
                          _selectDate(context).then((newDate) {
                            if (newDate != null) {
                              scheduleModel.updateDate(newDate);
                            }
                          });
                        },
                      ),
                      //  const SizedBox(height: 15),
                      Center(
                        child: SizedBox(
                          width: 300,
                          child: DropdownButtonFormField2<String>(
                            isExpanded: false,
                            decoration: InputDecoration(
                              // Add Horizontal padding using menuItemStyleData.padding so it matches
                              // the menu padding when button's width is not specified.
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // Add more decoration..
                            ),
                            hint: const Text(
                              'Select the Gate',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            items: gateItems
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select  the gate.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              scheduleModel.updateGate(value!);
                            },
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      RoundedElevatedButton(
                        buttonStyle: ElevatedButton.styleFrom(
                          foregroundColor: Colors.lightBlueAccent,
                          backgroundColor: Color.fromARGB(255, 139, 220, 253),
                          // Background color
                          elevation: 10.0, // Elevation/shadow
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(7.0), // Rounded corners
                          ),
                          minimumSize:
                              Size(100.0, 30.0), // Minimum size of the button
                        ),
                        title: 'Submit',
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Booking();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
