import 'package:flutter/material.dart';
import 'package:house_rent/constants/routes.dart';

import 'package:house_rent/screens/home/home.dart';
import 'package:house_rent/screens/registration/SplashScreen.dart';
import 'package:house_rent/screens/registration/sign_in.dart';
import 'package:house_rent/screens/registration/sign_up.dart';
import 'package:house_rent/screens/registration/verify_email.dart';
import 'package:house_rent/widgets/custom_app_bar.dart';
import 'dart:developer' as devtools show log;
//we used show because developer package gives yu alot of another function
//Since we want only log to be shown we used show
//we have puted the alias because we can have a function named devtools

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    devtools.log('building');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: const Color(0xFFF5F6F6),
        primaryColor: const Color(0xFF811B83),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFFA5019),
        ),
        textTheme: TextTheme(
          headline1: const TextStyle(
            color: Color(0xFF100E34),
          ),
          bodyText1: TextStyle(
            color: const Color(0xFF100E34).withOpacity(0.5),
          ),
        ),
      ),
      home: const SignIn(),
      routes: {
        homeRoute: (context) => const Home(),
        loginRoute: (context) => const SignIn(),
        registerRoute: (context) => const SignUp(),
        verifyEmailRoute: (context) => const VerifyEmail()
      },
    );
  }
}
