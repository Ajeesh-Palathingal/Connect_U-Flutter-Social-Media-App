import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/chats/chatting_screen.dart';
import 'package:connect_u/presentation/following/following_screen.dart';
import 'package:connect_u/presentation/profile/widgets/poster_image.dart';

import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:connect_u/presentation/widgets/person_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final postScrollController = ScrollController();

enum ProfileModes {
  userProfile,
  othersProfile,
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.profileMode,
    required this.profileImageUrl,
    required this.name,
    required this.profileName,
    // required this.numberOfPosts,
    required this.numberOfFollowing,
    required this.posts,
  });

  final ProfileModes profileMode;
  final String profileImageUrl;
  final String name;
  final String profileName;
  // final String numberOfPosts;
  final String numberOfFollowing;
  final List<String> posts;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        controller: postScrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            profileMode == ProfileModes.userProfile
                ? Stack(
                    children: [
                      Align(
                        child: const CustomText(
                          text: "PROFILE",
                          size: kHeadingSize,
                          fontweight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            final _sharedPref = await SharedPreferences.getInstance();
                            _sharedPref.clear();
                            print("User logout");
                          },
                          child: Icon(
                            Icons.logout,
                            color: kRedColor,
                          ),
                        ),
                      )
                    ],
                  )
                : Stack(
                    children: [
                      Align(
                        child: const CustomText(
                          text: "PROFILE",
                          size: kHeadingSize,
                          fontweight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: kBlueColor,
                          ),
                        ),
                      )
                    ],
                  ),
            const SizedBox(height: 15),
            CircleAvatar(
              radius: 110,
              child: CircleAvatar(
                radius: 105,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            ),
            const SizedBox(height: 10),
            CustomText(
              text: name,
              color: kBlackColor,
              size: 20,
            ),
            const SizedBox(height: 5),
            CustomText(
              text: profileName,
              color: kGreyColor,
              size: 13,
            ),
            const SizedBox(height: 5),
            profileMode == ProfileModes.userProfile
                ? ElevatedButton(
                    onPressed: () {},
                    child: const Text("EDIT PROFILE"),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => ChattingScreen(name: name, friendAvatarUrl: profileImageUrl)));
                          },
                          child: const Text("MESSAGE"),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("FOLLOW"),
                        ),
                      )
                    ],
                  ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[350],
                    ),
                    onPressed: () async {
                      print("posts");

                      postScrollController.animateTo(
                        // postScrollController.position.maxScrollExtent * 1,
                        screenSize.width * 1.2,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: posts.length.toString()),
                        const CustomText(text: "POSTS", color: kBlackColor),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 60,
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[350],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FollowingScreen()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: numberOfFollowing),
                        const CustomText(
                          text: "FOLLOWING",
                          color: kBlackColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              indent: 20,
              endIndent: 20,
              // thickness: 2,
              color: kBlackColor,
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: (20 / 30),
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: List.generate(
                posts.length,
                (index) => PosterImageCard(
                  imageUrl: posts[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
