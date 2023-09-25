import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/following/following_screen.dart';
import 'package:connect_u/presentation/profile/widgets/poster_image.dart';
import 'package:connect_u/presentation/profile/widgets/profile__screen.dart';

import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:connect_u/presentation/widgets/person_list_tile.dart';
import 'package:flutter/material.dart';

class OthersProfileScreen extends StatelessWidget {
  const OthersProfileScreen({
    super.key,
    required this.userName,
    required this.profileImageUrl,
  });

  final String userName;
  final String profileImageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProfileScreen(
          profileMode: ProfileModes.othersProfile,
          profileImageUrl: profileImageUrl,
          name: userName,
          profileName: "@mr.nobody",
          numberOfFollowing: "300",
          posts: sampleImages2,
        ),
      ),
    );
  }
}
