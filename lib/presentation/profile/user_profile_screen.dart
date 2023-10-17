import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/following/following_screen.dart';
import 'package:connect_u/presentation/profile/widgets/poster_image.dart';
import 'package:connect_u/presentation/profile/widgets/profile__screen.dart';

import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:connect_u/presentation/widgets/person_list_tile.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      profileMode: ProfileModes.userProfile,
      profileImageUrl: "https://tinyurl.com/5xmbz9k4",
      name: "ME NEWBEI",
      profileName: "@mr.nobody",
      numberOfFollowing: "300",
      posts: sampleImages,
    );
  }
}

// CustomScrollView(
//           slivers: [
//             SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   const CustomText(text: "PROFILE"),
//                   const SizedBox(height: 15),
//                   CircleAvatar(
//                     radius: 110,
//                     backgroundImage: NetworkImage("url"),
//                   ),
//                   SizedBox(height: 10),
//                   CustomText(
//                     text: "ME NEWBIE",
//                     color: kBlackColor,
//                     size: 20,
//                   ),
//                   SizedBox(height: 5),
//                   CustomText(
//                     text: "@mr.nobody",
//                     color: kGreyColor,
//                     size: 13,
//                   ),
//                   SizedBox(height: 5),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text("EDIT PROFILE"),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 60,
//                         width: 120,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.grey[350],
//                           ),
//                           onPressed: () {},
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               CustomText(text: "50"),
//                               CustomText(text: "POSTS", color: kBlackColor)
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       SizedBox(
//                         height: 60,
//                         width: 120,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.grey[350],
//                           ),
//                           onPressed: () {},
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               CustomText(text: "500"),
//                               CustomText(text: "FOLLOWING", color: kBlackColor)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   const Divider(
//                     indent: 20,
//                     endIndent: 20,
//                     // thickness: 2,
//                     color: kBlackColor,
//                   ),
//                 ],
//               ),
//             ),
//             SliverGrid(
//               delegate: SliverChildListDelegate(List.generate(
//                   sampleImages.length, (index) => PostTile(imageUrl: sampleImages[index]))),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             )
//           ],
//         )
