import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/helper/helper_function.dart';
import 'package:connect_u/presentation/home/home_screen.dart';
import 'package:connect_u/presentation/authentication/signup_screen.dart';
import 'package:connect_u/presentation/authentication/widgets/custom_icon_text_field.dart';
import 'package:connect_u/presentation/authentication/widgets/custom_password_text_field.dart';
import 'package:connect_u/presentation/main_page/main_page_screen.dart';
import 'package:connect_u/service/auth_service.dart';
import 'package:connect_u/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _validationKey = GlobalKey<FormState>();
  ValueNotifier<bool> _isLoading = new ValueNotifier(false);
  AuthServices authServices = AuthServices();

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

              ValueListenableBuilder(
                  valueListenable: _isLoading,
                  builder: (context, value, _) {
                    if (value == true) {
                      return LoadingAnimationWidget.discreteCircle(color: kWhiteColor, size: 50);
                    } else {
                      return Form(
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
                                  await validLogin(context);
                                  // if (_isValidLogin) {
                                  //   log("valid login");

                                  // print("Login success");
                                  // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                  // sharedPreferences.setBool(LOGIN_STATUS, true);
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => MainPageScreen(),
                                  //   ),
                                  // );
                                  // }
                                  // else {
                                  //   const snackBar = SnackBar(
                                  //     content: Text('Please check your Username and Password!'),
                                  //     backgroundColor: kRedColor,
                                  //     behavior: SnackBarBehavior.floating,
                                  //     margin: EdgeInsets.all(10),
                                  //     padding: EdgeInsets.all(20),
                                  //   );
                                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  // }
                                },
                                child: const CustomText(
                                  text: "LOGIN",
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),

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

  Future validLogin(BuildContext context) async {
    _isLoading.value = true;
    await authServices.loginUser(_emailController.text, _passwordController.text).then((value) async {
      print(_emailController.text);
      if (value == true) {
        log("value is $value");
        QuerySnapshot snapshot = await DatabaseServices(FirebaseAuth.instance.currentUser!.uid).getUserData(_emailController.text);
        log(snapshot.docs.toString());
        await HelperFunction.saveUserDataInSharedPref(true, snapshot.docs[0]["userName"], _emailController.text);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPageScreen()));
        _isLoading.value = false;
        return true;
      } else {
        _isLoading.value = false;
        var snackBar = SnackBar(
          content: Text(value),
          backgroundColor: kRedColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      }
    });
  }
}
