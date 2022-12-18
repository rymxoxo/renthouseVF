import 'package:flutter/material.dart';

import 'package:house_rent/screens/home/home.dart';
import 'package:house_rent/screens/registration/sign_in.dart';
import 'package:house_rent/screens/registration/sign_up.dart';
import 'package:house_rent/screens/registration/verify_email.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building');
    return MaterialApp(
      debugShowCheckedModeBanner: true,
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
        '/home/': (context) => const Home(),
        '/login/': (context) => const SignIn(),
        '/register/': (context) => const SignUp(),
        '/verifyemail': (context) => const VerifyEmail()
      },
    );
  }
}
