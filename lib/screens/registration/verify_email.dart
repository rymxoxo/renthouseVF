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
      appBar: AppBar(title: const Text('Email Verfication')),
      body: Column(
        children: [
          const Text(
              "We've send an Emai lverification. Please open it in order to verify your account "),
          const Text(
              "If you haven't received a verification email yet, Press the button below  "),
          TextButton(
            onPressed: (() async {
              AuthService.firebase().sendEmailVerification();
            }),
            child: const Text('Send Email Verification'),
          ),
          TextButton(
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
