import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/home/home_screen.dart';
import 'package:connect_u/presentation/authentication/signup_screen.dart';
import 'package:connect_u/presentation/authentication/widgets/custom_icon_text_field.dart';
import 'package:connect_u/presentation/authentication/widgets/custom_password_text_field.dart';
import 'package:connect_u/presentation/main_page/main_page_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _validationKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("lib/core/assets/login-background.png"), fit: BoxFit.cover),
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
                      icon: Icons.email_outlined,
                      hintText: "EMAIL",
                      controller: _emailController,
                      activateErrorText: true,
                    ),

                    const SizedBox(
                      height: kTextfieldGap,
                    ),

                    // Password

                    CustomPasswordTextField(
                      hintText: "PASSWORD",
                      controller: _passwordController,
                      activateErrorText: false,
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
                        onPressed: () async {
                          // _validationKey.currentState?.validate();
                          if (await validLogin()) {
                            print("Login success");
                            final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                            sharedPreferences.setBool(LOGIN_STATUS, true);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => MainPageScreen(),
                              ),
                            );
                          } else {
                            const snackBar = SnackBar(
                              content: Text('Please check your Username and Password!'),
                              backgroundColor: kRedColor,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(20),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                      style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 16),
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

  Future<bool> validLogin() async {
    if (_emailController.text == "abc@gmail.com" && _passwordController.text == "1234") {
      final _sharedPref = await SharedPreferences.getInstance();
      _sharedPref.setBool(LOGIN_STATUS, true);
      print("saved sh value = ${_sharedPref.getBool(LOGIN_STATUS)}");
      return true;
    } else {
      return false;
    }
  }
}
