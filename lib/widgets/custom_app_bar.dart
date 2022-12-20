import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:house_rent/constants/routes.dart';
import 'package:house_rent/screens/registration/sign_in.dart';
import 'dart:developer' as devtools show log;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: (() async {
                final showLogout = await showLogOutDialog(context);
                showLogOutDialog(context);
                if (showLogout) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (_) => false,
                  );
                }
                devtools.log(showLogout.toString());
              }),
              icon: SvgPicture.asset('assets/icons/logout.svg'),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/me.jpeg'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you you want to sign out ? '),
        actions: [
          TextButton(
              onPressed: (() {
                Navigator.of(context).pop(
                  false,
                );
              }),
              child: Text('Cancel')),
          TextButton(
              onPressed: (() {
                Navigator.of(context).pop(true);
              }),
              child: Text('Log Out')),
        ],
      );
    },
  ).then((value) => value ?? false);
}
