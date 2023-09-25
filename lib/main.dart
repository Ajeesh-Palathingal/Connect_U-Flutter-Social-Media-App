import 'package:connect_u/application/chats/chats_bloc.dart';
import 'package:connect_u/core/colors.dart';
import 'package:connect_u/presentation/authentication/login_screen.dart';
import 'package:connect_u/presentation/main_page/main_page_screen.dart';
import 'package:connect_u/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatsBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
