import 'package:connect_u/core/constants.dart';
import 'package:connect_u/domain/core/debounds/debounce.dart';
import 'package:connect_u/presentation/chats/chatting_screen.dart';
import 'package:connect_u/presentation/profile/others_profile.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:connect_u/presentation/widgets/person_list_tile.dart';
import 'package:connect_u/presentation/widgets/search_bar.dart';
import 'package:connect_u/presentation/widgets/user_not_found.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final _debouncer = Debouncer(milliseconds: 1 * 1000);
  ValueNotifier<bool> _userFound = ValueNotifier(true);

  final _searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomText(
            text: "SEARCH",
            size: kHeadingSize,
            fontweight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          CupertinoTextField(
            prefix: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.search,
                color: Colors.grey[700],
              ),
            ),
            controller: _searchControler,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            onChanged: (value) {
              _debouncer.run(() {
                if (value.isEmpty) {
                  return;
                }
                //
                // Change this code for activating the bloc of corresponding searching
                //
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserNotFound()));
                _userFound.value = false;
              });
            },
          ),
          ValueListenableBuilder(
              valueListenable: _userFound,
              builder: (context, userFound, _) {
                return Expanded(
                  child: userFound
                      ? ListView.separated(
                          itemCount: 20,
                          itemBuilder: (BuildContext, int index) {
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => OthersProfileScreen(
                                      userName: "Person ${index + 1}",
                                      profileImageUrl: "https://i.pinimg.com/originals/cf/db/91/cfdb91284fd14307e9f70c56065ff0fc.jpg"),
                                ),
                              ),
                              child: PersonListTile(
                                image: "https://i.pinimg.com/originals/cf/db/91/cfdb91284fd14307e9f70c56065ff0fc.jpg",
                                name: "Person ${index + 1}",
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                        )
                      : UserNotFound(),
                );
              })
        ],
      ),
    );
  }
}
