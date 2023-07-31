import 'package:connect_u/core/colors.dart';
import 'package:flutter/material.dart';

class CustomIconTextField extends StatelessWidget {
  const CustomIconTextField({
    required this.icon,
    required this.hintText,
    required this.controller,
    super.key,
  });
  final IconData icon;
  final String hintText;
  final TextEditingController controller;

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
        if (value == null || value.length < 3) {
          return "$hintText must contain atleast 3 characters";
        }
      },
    );
  }
}
