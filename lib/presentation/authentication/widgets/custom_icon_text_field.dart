import 'package:connect_u/core/colors.dart';
import 'package:connect_u/presentation/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

class CustomIconTextField extends StatelessWidget {
  const CustomIconTextField({
    required this.icon,
    required this.hintText,
    required this.controller,
    this.activateErrorText = true,
    this.errorText = "",
    super.key,
  });
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final bool activateErrorText;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: kWhiteColor),
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        hintStyle: const TextStyle(color: kGreyColor),
        prefixIconColor: kWhiteColor,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kBlueColor,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kWhiteColor,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kRedColor,
            width: 2,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        // print("valid mail ${validMail.hasMatch(emailController.text)}");
        if (!validMail.hasMatch(controller.text) && activateErrorText && hintText == "EMAIL") {
          return "Enter a valid Email address!";
        } else if ((value == null || value.length < 3) && activateErrorText) {
          return errorText;
        }
      },
    );
  }
}
