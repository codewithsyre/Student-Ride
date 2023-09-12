import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled001/Models/user.dart';
import 'package:http/http.dart' as http;
import 'package:untitled001/Providers/user_providers.dart';
import 'package:untitled001/Screens/booking.dart';
import 'package:untitled001/Utilities/utils.dart';
import 'package:provider/provider.dart';
import '../Utilities/constants.dart';

class AuthServices {
  void signUpUser({
    required BuildContext context,
    required String studentNumber,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      User user = User(
        studentId: '',
        studentNumber: studentNumber,
        token: '',
        password: password,
        confirmPassword: confirmPassword,
      );
      // Django endpoints
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/ api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type':
              'application/json; charset=utf-8', // Corrected charset value
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created , Login with rhe same credentials ',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String studentNumber,
    required String password,
  }) async {
    // TODO: implement signInUser
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/ api/signIn'),
        body:
            jsonEncode({'studentNumber': studentNumber, 'password': password}),
        headers: <String, String>{
          'Content-Type':
              'application/json; charset=utf-8', // Corrected charset value
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            userProvider.setUser(res.body);
            await preferences.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Booking()),
                (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
