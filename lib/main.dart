import 'package:flutter/material.dart';
import 'package:login_screen/screens/loginscreen.dart';

void main(List<String> args) {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
