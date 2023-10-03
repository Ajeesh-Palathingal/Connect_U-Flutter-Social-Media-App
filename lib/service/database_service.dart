import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? userId;

  DatabaseServices( this.userId);

  // reference for the collections in firestore database
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  //updating user data
  Future updateUserData(String userName, String email) async {
    return userCollection.doc(userId).set(
      {
        "userId": userId,
        "userName": userName,
        "email": email,
        "profilePic": "",
        "posts": [],
      },
    );
  }

  //getting user data
  Future getUserData(String email) async {
    QuerySnapshot snapshot = await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
