import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/helper/helper_function.dart';
import 'package:connect_u/presentation/home/home_screen.dart';
import 'package:connect_u/presentation/authentication/login_screen.dart';
import 'package:connect_u/presentation/authentication/widgets/custom_icon_text_field.dart';
import 'package:connect_u/presentation/authentication/widgets/custom_password_text_field.dart';
import 'package:connect_u/presentation/main_page/main_page_screen.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:connect_u/service/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
RegExp validMail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  ValueNotifier<bool> _isLoading = new ValueNotifier(false);
  AuthServices authServices = AuthServices();

  final _validationKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("is loading ${_isLoading}");
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/core/assets/login-background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: ValueListenableBuilder(
                valueListenable: _isLoading,
                builder: (BuildContext context, bool value, _) {
                  if (value == true) {
                    return LoadingAnimationWidget.discreteCircle(
                        color: kWhiteColor, size: 50);
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Form(
                            key: _validationKey,
                            child: Column(
                              children: [
                                const CustomText(
                                  text: "Create Account",
                                  color: kWhiteColor,
                                  size: 25,
                                  fontweight: FontWeight.bold,
                                ),

                                const SizedBox(
                                  height: kTextfieldGap,
                                ),

                                //Username

                                CustomIconTextField(
                                  icon: Icons.person_2_outlined,
                                  hintText: "USERNAME",
                                  controller: _userNameController,
                                  activateErrorText: true,
                                  errorText:
                                      "Username must contain atleast 3 characters",
                                ),

                                const SizedBox(
                                  height: kTextfieldGap,
                                ),

                                //Email

                                CustomIconTextField(
                                  icon: Icons.email_outlined,
                                  hintText: "EMAIL",
                                  controller: _emailController,
                                ),

                                const SizedBox(
                                  height: kTextfieldGap,
                                ),

                                //Password

                                CustomPasswordTextField(
                                  hintText: "PASSWORD",
                                  errorText:
                                      "Password must contain atleast 6 characters",
                                  controller: passwordController,
                                ),

                                const SizedBox(
                                  height: kTextfieldGap,
                                ),

                                //Confirm password

                                CustomPasswordTextField(
                                  hintText: "CONFIRM PASSWORD",
                                  errorText: "Password doesn't match!",
                                  controller: confirmPasswordController,
                                ),

                                const SizedBox(
                                  height: kTextfieldGap,
                                ),

                                //Signup button

                                SizedBox(
                                  height: 55,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kWhiteColor,
                                    ),
                                    onPressed: () async {
                                      await validateSignupAndRegisterUser(
                                          context);
                                    },
                                    child: const CustomText(
                                      text: "SIGNUP",
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

                          //already a user (login option)

                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: "Already a user? ",
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                                TextSpan(
                                  text: "Login",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pop();
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
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }

  Future<bool> validateSignupAndRegisterUser(BuildContext context) async {
    if (_userNameController.text.length > 2 &&
        validMail.hasMatch(_emailController.text) &&
        passwordController.text.length > 5 &&
        passwordController.text == confirmPasswordController.text) {
      _isLoading.value = true;
      await authServices
          .registerUser(_userNameController.text, _emailController.text,
              passwordController.text)
          .then((value) async {
        if (value == true) {
          await HelperFunction.saveUserDataInSharedPref(
              true, _userNameController.text, _emailController.text);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPageScreen()));
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
      return true;
    } else {
      var snackBar = const SnackBar(
        content: Text('Please enter valid details!'),
        backgroundColor: kRedColor,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
  }
}
