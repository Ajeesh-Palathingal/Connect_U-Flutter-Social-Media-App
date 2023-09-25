import 'package:connect_u/core/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size = 15,
    this.color = kBlackColor,
    this.fontweight = FontWeight.normal,
  });

  final String text;
  final double size;
  final Color color;
  final FontWeight fontweight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontweight,
      ),
    );
  }
}
