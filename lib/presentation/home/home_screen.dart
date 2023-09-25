import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/home/widgets/post_tile.dart';
import 'package:connect_u/presentation/profile/user_profile_screen.dart';
import 'package:connect_u/presentation/profile/widgets/profile__screen.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          child: Center(
              child: CustomText(
            text: "POSTS",
            size: kHeadingSize,
            fontweight: FontWeight.bold,
          )),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: ((context, index) => PostTile(
                    profileImageUrl: sampleImages[(3 - index)],
                    name: "Person ${index + 1}",
                    postImageUrl: sampleImages[index],
                    numberOfLikes: (index + 120).toString(),
                  )),
              separatorBuilder: (context, index) => Divider(
                    thickness: 2,
                  ),
              itemCount: 4),
        )
      ],
    );
  }
}
