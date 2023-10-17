import 'package:connect_u/core/colors.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> bottomNavbarIndexNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: bottomNavbarIndexNotifier,
        builder: (BuildContext context, int newIndex, _) {
          return BottomNavigationBar(
            currentIndex: bottomNavbarIndexNotifier.value,
            onTap: (index) {
              bottomNavbarIndexNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            selectedItemColor: kWhiteColor,
            unselectedItemColor: Colors.black54,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_a_photo_outlined), label: "Add Post"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.messenger_outline), label: "Chats"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: "Profile"),
            ],
          );
        });
  }
}
