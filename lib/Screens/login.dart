import 'package:flutter/material.dart';
import 'package:untitled001/Screens/register.dart';
import 'package:untitled001/Screens/schedule.dart';
import 'package:untitled001/Utilities/constants.dart';
import 'package:untitled001/Components/elevated_button.dart';
import '../Services/auth_services.dart';
import 'booking.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController studentNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthServices authServices = AuthServices();

  void loginUser() {
    authServices.signInUser(
        context: context,
        studentNumber: studentNumberController.text,
        password: passwordController.text);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/top2.png'),
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
                'Welcome\nBack',
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
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'username'),
                    controller: studentNumberController,
                  ),
                  SizedBox(height: 30),
                  TextField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'password')),
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
                        title: 'Login',
                        // loginUser
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Schedule();
                              },
                            ),
                          );
                        },
                        // ,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Don't have an account?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Roboto'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Register();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Roboto'),
                        ),
                        style: ButtonStyle(),
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
