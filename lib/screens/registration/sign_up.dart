import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_rent/constants/routes.dart';
import 'package:house_rent/services/auth/auth_exception.dart';
import 'package:house_rent/services/auth/auth_service.dart';
import 'package:house_rent/utilities/show_error_dialog.dart';

import '../../firebase_options.dart';
import 'dart:developer' as devtools show log;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        title: const Text('Register'),
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
                          await AuthService.firebase().createUser(
                            email: email,
                            password: password,
                          );

                          // final UserCredential = await FirebaseAuth.instance
                          //     .createUserWithEmailAndPassword(
                          //   email: email,
                          //   password: password,
                          // );
                          AuthService.firebase().sendEmailVerification();
                          Navigator.of(context).pushNamed(verifyEmailRoute);
                          //print(UserCredential);
                        } on WeakPasswordAuthException {
                          await showErrorDialog(
                            context,
                            'Weak Password',
                          );
                          devtools.log('The password provided is too weak.');
                        } on EmailAlreadyInUseAuthException {
                          await showErrorDialog(
                            context,
                            'Email is already in use',
                          );
                          devtools.log(
                              'The account already exists for that email.');
                        } on InvalidEmailAuthException {
                          await showErrorDialog(
                            context,
                            'Invalid email',
                          );
                          devtools.log('invalid email entered');
                        } on GenericAuthException {
                          await showErrorDialog(
                            context,
                            'Failed to register',
                          );
                        }
                      },
                      child: const Text('Register')),
                  TextButton(
                      onPressed: (() {
                        devtools.log('register button is pressed');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          loginRoute,
                          (route) => false,
                        );
                      }),
                      child: const Text('Already Registered ? Login here!'))
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
