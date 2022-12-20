import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:developer' as devtools show log;

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email Verfication')),
      body: Column(
        children: [
          const Text('Please Verify your Email Address'),
          TextButton(
            onPressed: (() async {
              final user = FirebaseAuth.instance.currentUser;
              if (user != null && !user.emailVerified) {
                await user.sendEmailVerification();
                devtools.log('email verified');
              } else {}
            }),
            child: const Text('Send Email Verification'),
          )
        ],
      ),
    );
  }
}
