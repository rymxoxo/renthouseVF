import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_rent/screens/add_post_screen.dart';
import 'package:house_rent/screens/feed_screen.dart';
import 'package:house_rent/screens/home/home.dart';
import 'package:house_rent/screens/profile.dart';
import 'package:house_rent/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const Home(),
  const SearchScreen(),
  const AddPostScreen(),
  const FeedScreen(),
  Profile(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ), //Profile(
  // uid: FirebaseAuth.instance.currentUser!.uid,
  //),
];
