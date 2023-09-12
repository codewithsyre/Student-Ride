// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String studentId;
  final String studentNumber;
  final String token;
  final String password;
  final String confirmPassword;

  User(
      {required this.studentId,
      required this.studentNumber,
      required this.token,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentId': studentId,
      'studentNumber': studentNumber,
      'token': token,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      studentId: map['studentId'] as String,
      studentNumber: map['studentNumber'] as String,
      token: map['token'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
