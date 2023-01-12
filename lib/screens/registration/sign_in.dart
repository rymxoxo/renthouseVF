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
      body: FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/welcome.png',
                      height: 250,
                      width: 250,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  ),
                  Container(
                    child: const Text(
                      'Welcome among the community of Best Rent/Sell House ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Aleo',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.black),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 16),
                    child: TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 16),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Password'),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple, // background
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(25) // foreground
                          ),
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
                      child: const Text('Log In'),
                    ),
                  ),

                  // // begin container
                  // Container(
                  //   padding: const EdgeInsets.only(top: 222.0),
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     child: Text('Login'),
                  //     style: ElevatedButton.styleFrom(
                  //       padding: EdgeInsets.all(50),
                  //     ),
                  //   ),
                  // ),
                  // //end container(test)
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                      onPrimary: Colors.purple, // foreground
                    ),
                    onPressed: () {
                      devtools.log('Login button is pressed');

                      Navigator.of(context).pushNamedAndRemoveUntil(
                        registerRoute,
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'No registered yet? Register here !',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
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
