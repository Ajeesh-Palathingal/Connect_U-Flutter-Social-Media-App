import 'package:connect_u/core/constants.dart';
import 'package:connect_u/helper/helper_function.dart';
import 'package:connect_u/presentation/authentication/login_screen.dart';
import 'package:connect_u/presentation/main_page/main_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:connect_u/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    verifyLoginStatus();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image(image: AssetImage("lib/core/assets/icon&name.png")),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> goToLogin() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  Future<void> verifyLoginStatus() async {
    final helper = HelperFunction();
    final _loggedIn = await helper.checkUserLoginStatus();
    // final _sharedPref = await SharedPreferences.getInstance();
    // final _loggedIn = _sharedPref.getBool("LOGIN_STATUS");
    print("loggin ${_loggedIn}");
    if (_loggedIn == true) {
      await Future.delayed(Duration(seconds: 1));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainPageScreen()));
    } else {
      goToLogin();
    }
  }
}
