import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? userId;

  DatabaseServices(this.userId);

  // reference for the collections in firestore database
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  //updating user data
  Future updateUserData(String userName, String email) async {
    try {
      return await userCollection.doc(userId).set(
        {
          "userId": userId,
          "userName": userName,
          "email": email,
          "profilePic": "",
          "posts": [],
        },
      );
    } catch (e) {
      print(e);
    }
  }

  //getting user data
  Future getUserData(String email) async {
    try {
      QuerySnapshot snapshot = await userCollection.where("email", isEqualTo: email).get();
      return snapshot;
      // List userData = [];

      // await userCollection.where("email", isEqualTo: email).get().then((value) {
      //   value.docs.forEach((element) {
      //     userData.add(element.data());
      //   });
      // });
    } catch (e) {
      print(e);
    }
  }

  Future getUsersList() async {
    List usersList = [];
    try {
      log("getting users");
      await userCollection.get().then((value) {
        value.docs.forEach((element) {
          usersList.add(element.data());
        });
      });
      // log("List ${list.body}");
      log("List of users are ${usersList}");
      log("User name :${usersList[0]["userName"]}");

      return usersList;
    } catch (e) {
      print(e);
      return;
    }
  }

  Future getUserWithName(String searchKey) async {
    List usersList = [];
    List searchResult = [];
    try {
      log("getting users");
      await userCollection.get().then((value) {
        value.docs.forEach((element) {
          usersList.add(element.data());
        });
      });
      for (var user in usersList) {
        // print("name : ${user["userName"]}");
        final userName = user["userName"].toString().toLowerCase();
        if (userName.contains(searchKey)) {
          log("found user $userName");
          searchResult.add(user);
        }
      }

      // log("List of users are ${usersList}");
      // log("User names :$searchResult");

      return searchResult;
    } catch (e) {
      print(e);
      return;
    }
  }
}
