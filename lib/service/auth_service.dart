import 'dart:developer';

import 'package:connect_u/presentation/main_page/widgets/bottom_navigation.dart';
import 'package:connect_u/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  // login
  Future loginUser(String email, String password) async {
    final FirebaseAuth firebaseAuth = await FirebaseAuth.instance;
    try {
      log("in login email and password :$email  ,$password");
      final userinfo = await firebaseAuth.fetchSignInMethodsForEmail(email);
      log(userinfo.toString());
      User user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user!;
      //error is for signInwithemailand password function

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        return "Please check your Email and Password";
      } else {
        return e.code;
      }
    }
  }

  // register
  Future registerUser(String userName, String email, String password) async {
    final FirebaseAuth firebaseAuth = await FirebaseAuth.instance;
    try {
      log("in signup email and password :$email  ,$password");
      User user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;

      if (user != null) {
        await DatabaseServices(user.uid).updateUserData(userName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  // sign out

  Future signOut() async {
    final FirebaseAuth firebaseAuth = await FirebaseAuth.instance;
    try {
      final _sharedPref = await SharedPreferences.getInstance();
      _sharedPref.clear();
      await firebaseAuth.signOut();
      bottomNavbarIndexNotifier.value = 0;
      print("User logged out");
    } catch (e) {
      print(e);
    }
  }
}
