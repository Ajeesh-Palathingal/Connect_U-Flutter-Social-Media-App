import 'package:connect_u/core/colors.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class UserNotFound extends StatelessWidget {
  const UserNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_off_outlined,
              color: primaryColor,
              size: screenSize.width * 0.6,
            ),
            CustomText(
              text: "User not found",
              color: kGreyColor,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
