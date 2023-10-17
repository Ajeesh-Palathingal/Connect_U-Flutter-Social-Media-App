import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_u/application/search/search_bloc.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/domain/core/debounds/debounce.dart';
import 'package:connect_u/presentation/chats/chatting_screen.dart';
import 'package:connect_u/presentation/profile/others_profile.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:connect_u/presentation/widgets/person_list_tile.dart';
import 'package:connect_u/presentation/widgets/search_bar.dart';
import 'package:connect_u/presentation/widgets/user_not_found.dart';
import 'package:connect_u/service/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final _debouncer = Debouncer(milliseconds: 1 * 1000);
  ValueNotifier<bool> _userFound = ValueNotifier(true);

  final _searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    var snapshot = DatabaseServices("").getUsersList();
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
                // if (value.isEmpty) {
                //   return;
                // }
                BlocProvider.of<SearchBloc>(context).add(SearchUser(searchKey: value));
                //
                // Change this code for activating the bloc of corresponding searching
                //
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserNotFound()));
                _userFound.value = false;
              });
            },
          ),
          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            log("$state");
            if (state.isLoading == true) {
              return Expanded(child: Center(child: CircularProgressIndicator()));
            }
            if (state.userNotFound == true) {
              log("User not found:::::::::::::::::::::::");
              return Expanded(child: UserNotFound());
            } else if (state.searchResultList.isNotEmpty) {
              log("search results are:::::::::");
              return Expanded(
                child: ListView.separated(
                  itemCount: state.searchResultList.length,
                  itemBuilder: (BuildContext, int index) {
                    print("search list empty.............");
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OthersProfileScreen(userName: "${state.searchResultList[index]["userName"]}", profileImageUrl: "${state.searchResultList[index]["profilePic"]}"),
                        ),
                      ),
                      child: PersonListTile(
                        image: "${state.searchResultList[index]["profilePic"]}",
                        name: "${state.searchResultList[index]["userName"]}",
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              );
            } else {
              log("Idle list are:::::::::::::::::::");
              log("${state.idleList}S");
              return Expanded(
                child: ListView.separated(
                  itemCount: state.idleList.length,
                  itemBuilder: (BuildContext, int index) {
                    print("search list empty.............");
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OthersProfileScreen(userName: "${state.idleList[index]["userName"]}", profileImageUrl: "${state.idleList[index]["profilePic"]}"),
                        ),
                      ),
                      child: PersonListTile(
                        image: "${state.idleList[index]["profilePic"]}",
                        name: "${state.idleList[index]["userName"]}",
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              );
            }
          })
        ],
      ),
    );
  }

  // groupList() {
  //   return StreamBuilder(builder: (content, AsyncSnapshot snapshot) {
  //     if (snapshot.hasData) {
  //       print(snapshot.data);
  //       return Text("User");
  //     } else {
  //       print("no data");
  //       return Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     }
  //   });
  // }
}
