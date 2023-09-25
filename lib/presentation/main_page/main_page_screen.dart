import 'package:connect_u/presentation/add_post/add_post_screen.dart';
import 'package:connect_u/presentation/add_post/posting_screen.dart';
import 'package:connect_u/presentation/home/home_screen.dart';
import 'package:connect_u/presentation/main_page/widgets/bottom_navigation.dart';
import 'package:connect_u/presentation/chats/chats_screen.dart';
import 'package:connect_u/presentation/profile/user_profile_screen.dart';
import 'package:connect_u/presentation/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPageScreen extends StatelessWidget {
  MainPageScreen({Key? key}) : super(key: key);

  final pages = [
    HomeScreen(),
    SearchScreen(),
    AddPostScreen(),
    ChatsScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: bottomNavbarIndexNotifier,
            builder: (BuildContext context, int newIndex, _) {
              return pages[newIndex];
            }),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
