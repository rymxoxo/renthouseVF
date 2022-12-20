import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:house_rent/constants/routes.dart';
import 'package:house_rent/screens/home/home.dart';
import 'dart:developer' as devtools show log;

import '../../firebase_options.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration:
                        const InputDecoration(hintText: 'Enter your Email'),
                  ),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration:
                        const InputDecoration(hintText: 'Enter your Password'),
                  ),
                  TextButton(
                      onPressed: () async {
                        final email = _email.text;
                        final password = _password.text;
                        try {
                          final UserCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);

                          devtools.log('done');
                          devtools.log(UserCredential.toString());
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            homeRoute,
                            (route) => false,
                          );
                        } on FirebaseAuthException catch (e) {
                          devtools.log(e.code);
                          if (e.code == 'user-not-found') {
                            devtools.log('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            devtools
                                .log('Wrong password provided for that user.');
                          }
                        }
                      },
                      child: const Text('Log In')),
                  TextButton(
                      onPressed: () {
                        devtools.log('tesssst');

                        Navigator.of(context).pushNamedAndRemoveUntil(
                          registerRoute,
                          (route) => false,
                        );
                      },
                      child: Text('No registered yet? Register here !'))
                ],
              );
            default:
              return const Text('Loading...');
          }
        },
      ),
    );
  }
}
