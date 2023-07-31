import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/home/home_screen.dart';
import 'package:connect_u/presentation/login&signup/login_screen.dart';
import 'package:connect_u/presentation/login&signup/widgets/custom_icon_text_field.dart';
import 'package:connect_u/presentation/login&signup/widgets/custom_password_text_field.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();

  ValueNotifier validPasswordNotifier = ValueNotifier(true);
  final _validationKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
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
                          errorText: "Password must contain atleast 4 characters",
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
                            onPressed: () {
                              // _validationKey.currentState?.validate();
                              if (validSignup()) {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const HomeScreen()));
                              } else {
                                print("Not valid signup");
                              }
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

                  //signup

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
                              debugPrint('The button is clicked!');
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
            ),
          ),
        ),
      ),
    );
  }

  bool validSignup() {
    if (_userNameController.text.length > 2 &&
        _emailController.text.length > 2 &&
        passwordController.text.length > 3 &&
        passwordController.text == confirmPasswordController.text) {
      return true;
    } else {
      return false;
    }
  }
}
