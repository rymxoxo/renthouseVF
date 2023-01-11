import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:house_rent/constants/routes.dart';
import 'package:house_rent/screens/home/home.dart';
import 'package:house_rent/screens/registration/verify_email.dart';
import 'package:house_rent/services/auth/auth_exception.dart';
import 'package:house_rent/services/auth/auth_provider.dart';
import 'package:house_rent/services/auth/auth_service.dart';
import 'package:house_rent/utilities/show_error_dialog.dart';
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
        future: AuthService.firebase().initialize(),
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
                          await AuthService.firebase().logIn(
                            email: email,
                            password: password,
                          );

                          devtools.log('done');
                          final user = AuthService.firebase().currentUser;
                          if (user?.isEmailVerified ?? false) {
                            //user is verified
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              homeRoute,
                              (route) => false,
                            );
                          } else {
                            //users's email is NOT verifed
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              verifyEmailRoute,
                              (route) => false,
                            );
                          }

                          //handling firebase exception

                        } on UserNotFoundAuthException catch (e) {
                          showErrorDialog(
                            context,
                            'User not found',
                          );
                          devtools.log('No user found for that email.');
                        } on WrongPasswordAuthException {
                          showErrorDialog(
                            context,
                            'Wrong Password',
                          );
                          devtools
                              .log('Wrong password provided for that user.');
                        } on GenericAuthException {
                          showErrorDialog(
                            context,
                            'Authentification Error',
                          );
                        }
                        //
                      },
                      child: const Text('Log In')),
                  TextButton(
                      onPressed: () {
                        devtools.log('Login button is pressed');

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
