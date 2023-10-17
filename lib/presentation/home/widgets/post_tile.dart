import 'package:connect_u/core/colors.dart';
import 'package:connect_u/presentation/profile/others_profile.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.postImageUrl,
    required this.numberOfLikes,
  });

  final String profileImageUrl;
  final String name;
  final String postImageUrl;
  final String numberOfLikes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => OthersProfileScreen(
                          userName: name, profileImageUrl: profileImageUrl)),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: name,
                            size: 20,
                          ),
                          CustomText(text: "1 hour ago", color: kBlackColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ClipRRect(
              // width: double.infinity,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20),
              // ),
              borderRadius: BorderRadius.circular(5),
              child: Image(
                width: double.infinity,
                image: NetworkImage(
                  postImageUrl,
                ),
                fit: BoxFit.fitWidth,
              ),
              // color: kBlueColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(numberOfLikes),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
