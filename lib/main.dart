import 'dart:developer' as devtools show log;
import 'package:house_rent/constants/routes.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:house_rent/providers/user_provider.dart';
import 'package:house_rent/responsive/mobile_screen_layout.dart';
import 'package:house_rent/responsive/responsive_layout.dart';
import 'package:house_rent/responsive/web_screen_layout.dart';
import 'package:house_rent/screens/add_post_screen.dart';
import 'package:house_rent/screens/example.dart';
import 'package:house_rent/screens/registration/SplashScreen.dart';
import 'package:house_rent/screens/registration/sign_in.dart';
import 'package:house_rent/screens/registration/sign_up.dart';
import 'package:house_rent/screens/registration/verify_email.dart';
import 'package:house_rent/utilities/colors.dart';
import 'package:house_rent/widgets/booknow.dart';
import 'package:provider/provider.dart';
//we used show because developer package gives yu alot of another function
//Since we want only log to be shown we used show
//we have puted the alias because we can have a function named devtools

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyByrKVJNN7RoXFPbw714tygB5pYMEVKCR8",
          appId: "1:92960888139:web:955337b57a6572a1cd04ce",
          messagingSenderId: "92960888139",
          projectId: "project-house-rent",
          storageBucket: 'project-house-rent.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          homeRoute: (context) => Example(),
          loginRoute: (context) => const SignIn(),
          registerRoute: (context) => const SignUp(),
          verifyEmailRoute: (context) => const VerifyEmail(),
          bookRoute: (context) => const Book()
        },
        debugShowCheckedModeBanner: false,
        title: 'Sakkani',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const SplashScreen();
          },
        ),
      ),
    );
  }
}
