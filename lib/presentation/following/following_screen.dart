import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/profile/others_profile.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';

import 'package:connect_u/presentation/widgets/person_list_tile.dart';
import 'package:connect_u/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class FollowingScreen extends StatelessWidget {
  FollowingScreen({super.key});

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back,
                    color: primaryColor,
                  ),
                ),
                SizedBox(width: 15),
                CustomText(
                  text: "Followings",
                  size: kHeadingSize,
                  fontweight: FontWeight.bold,
                )
              ],
            ),
            const SizedBox(height: 10),
            SearchBar(searchController: _searchController),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (BuildContext, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OthersProfileScreen(
                              userName: "Person ${index + 1}",
                              profileImageUrl: "https://i.pinimg.com/originals/cf/db/91/cfdb91284fd14307e9f70c56065ff0fc.jpg",
                            ))),
                    child: PersonListTile(
                      image: "https://i.pinimg.com/originals/cf/db/91/cfdb91284fd14307e9f70c56065ff0fc.jpg",
                      name: "Person ${index + 1}",
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
