import 'package:connect_u/core/colors.dart';
import 'package:connect_u/presentation/login&signup/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(primaryColor),
      ),
      home:  LoginScreen(),
    );
  }
}
