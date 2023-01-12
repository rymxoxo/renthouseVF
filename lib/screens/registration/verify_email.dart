import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:developer' as devtools show log;

import 'package:house_rent/constants/routes.dart';
import 'package:house_rent/services/auth/auth_service.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images/email.png',
              height: 250,
              width: 250,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          ),
          const Text(
              "We've send an Email verification. Please open it in order to verify your account "),
          const Text(
              "If you haven't received a verification email yet, Press the button below  "),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // background
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(25) // foreground
                  ),
              onPressed: (() async {
                AuthService.firebase().sendEmailVerification();
              }),
              child: const Text('Send Email Verification'),
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white, // background
              onPrimary: Colors.purple, // foreground
            ),
            onPressed: () async {
              AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
