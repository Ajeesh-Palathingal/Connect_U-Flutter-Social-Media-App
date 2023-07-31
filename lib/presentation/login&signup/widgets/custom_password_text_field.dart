import 'package:connect_u/presentation/login&signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class CustomPasswordTextField extends StatelessWidget {
  CustomPasswordTextField({
    required this.hintText,
    this.errorText = "",
    required this.controller,
    super.key,
  });

  final String hintText;
  final String errorText;
  final TextEditingController controller;

  ValueNotifier<bool> obscureTextNotifier = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obscureTextNotifier,
      builder: (context, value, child) {
        return TextFormField(
          style: const TextStyle(color: kWhiteColor),
          obscureText: obscureTextNotifier.value,
          controller: controller,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline),
            hintText: hintText,
            hintStyle: const TextStyle(color: kGreyColor),
            prefixIconColor: kWhiteColor,
            suffix: GestureDetector(
              onTap: () {
                obscureTextNotifier.value = !obscureTextNotifier.value;
              },
              child: Icon(
                Icons.remove_red_eye_outlined,
                size: 18,
                color: obscureTextNotifier.value ? kGreyColor : kWhiteColor,
              ),
            ),
            iconColor: kWhiteColor,
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
            if ((value == null || value.length < 4) && hintText == "PASSWORD") {
              return errorText;
            } else if (hintText == "CONFIRM PASSWORD" &&
                passwordController.text != confirmPasswordController.text) {
              return errorText;
            }
          },
        );
      },
    );
  }
}
