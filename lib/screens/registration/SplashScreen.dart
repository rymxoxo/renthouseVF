import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:house_rent/screens/registration/sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('/intro.json'),

      // Column(
      //   children: [
      ///TODO Add your image under assets folder
      //     Image.asset('assets/logo_icon.png'),
      //     const Text('Cake app', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),)
      //   ],
      // ),
      backgroundColor: Colors.white,
      nextScreen: const SignIn(),
      splashIconSize: 450,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
