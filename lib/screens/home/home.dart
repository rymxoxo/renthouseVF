import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_rent/screens/registration/verify_email.dart';
import 'package:house_rent/services/auth/auth_service.dart';

import 'package:house_rent/widgets/custom_bottom_navigation_bar.dart';
import 'package:house_rent/widgets/recommended_house.dart';
import 'package:house_rent/widgets/custom_app_bar.dart';
import 'package:house_rent/widgets/search_input.dart';
import 'package:house_rent/widgets/welcome_text.dart';
import 'package:house_rent/widgets/categories.dart';
import 'package:house_rent/widgets/best_offer.dart';

import '../../firebase_options.dart';
import 'dart:developer' as devtools show log;
import 'dart:developer' as devtools show log;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(),
      body: FutureBuilder(
          future: AuthService.firebase().initialize(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                AuthService.firebase().currentUser;
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  if (user?.emailVerified ?? false) {
                    //u need to put bol in if statement so il first is true then take false
                    devtools.log('the user is verified');
                  }
                } else {
                  return const VerifyEmail();
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WelcomeText(),
                      const SearchInput(),
                      const Categories(),
                      RecommendedHouse(),
                      BestOffer(),
                    ],
                  ),
                );
              default:
                return const CircularProgressIndicator();
            }
          }),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
