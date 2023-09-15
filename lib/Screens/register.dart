import 'package:flutter/material.dart';
import 'package:untitled001/Screens/login.dart';
import 'package:untitled001/Services/auth_services.dart';
import 'package:untitled001/Utilities/constants.dart';
import 'package:untitled001/Components/elevated_button.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController studentNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final AuthServices authServices = AuthServices();

  void signupUser() {
    authServices.signUpUser(
      context: context,
      studentNumber: studentNumberController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/top1.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Student Number',
                    ),
                    controller: studentNumberController,
                  ),
                  SizedBox(height: 30),
                  TextField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Password',
                      )),
                  SizedBox(height: 30),
                  TextField(
                      controller: confirmPasswordController,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Confirm Password',
                      )),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedElevatedButton(
                        buttonStyle: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue, // Background color
                          elevation: 10.0, // Elevation/shadow
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(7.0), // Rounded corners
                          ),
                          minimumSize:
                              Size(200.0, 42.0), // Minimum size of the button
                        ),
                        title: 'Register',
                        onPressed: signupUser,
                        
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
