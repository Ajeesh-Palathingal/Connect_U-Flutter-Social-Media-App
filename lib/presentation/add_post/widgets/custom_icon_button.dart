import 'package:connect_u/core/colors.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: kWhiteColor,
          ),
          SizedBox(width: 15),
          CustomText(
            text: label,
            fontweight: FontWeight.w500,
            color: kWhiteColor,
          )
        ],
      ),
    );
  }
}
