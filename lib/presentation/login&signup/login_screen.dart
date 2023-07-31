import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/home/home_screen.dart';
import 'package:connect_u/presentation/login&signup/signup_screen.dart';
import 'package:connect_u/presentation/login&signup/widgets/custom_icon_text_field.dart';
import 'package:connect_u/presentation/login&signup/widgets/custom_password_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _validationKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/core/assets/login-background.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username

              Form(
                key: _validationKey,
                child: Column(
                  children: [
                    CustomIconTextField(
                      icon: Icons.person_2_outlined,
                      hintText: "USERNAME",
                      controller: _userNameController,
                    ),

                    const SizedBox(
                      height: kTextfieldGap,
                    ),

                    // Password

                    CustomPasswordTextField(
                      hintText: "PASSWORD",
                      controller: _passwordController,
                    ),

                    const SizedBox(height: 60),

                    // Login button

                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kWhiteColor,
                        ),
                        onPressed: () {
                          _validationKey.currentState?.validate();
                          if (validLogin()) {
                            print("Login success");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                        },
                        child: const CustomText(
                          text: "LOGIN",
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              //signup

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    TextSpan(
                      text: "Sign up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          passwordController.clear();
                          confirmPasswordController.clear();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignupScreen()),
                          );
                        },
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validLogin() {
    if (_userNameController.text == "user" && _passwordController.text == "1234") {
      return true;
    } else {
      return false;
    }
  }
}
