import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class Welcome extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(children: <Widget>[
      Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/building.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              margin: EdgeInsets.only(
                  left: 0.0, top: 150.0, right: 0.0, bottom: 0.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.all(5), //apply padding to all four sides
                    child: Container(
                      child: Text(
                        "Email address",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      margin: EdgeInsets.only(
                          left: .0, top: 40, right: 0.0, bottom: 0.0),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 0.0, top: 40.0, right: 0.0, bottom: 0.0),
                      child: TextFormField(
                        maxLength: 25,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3, //<-- SEE HERE
                              color: Color.fromARGB(255, 97, 97, 97),
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          labelText: 'Email address',
                          hintText: 'Entrer du texte',
                        ),
                      )),
                  Padding(
                    padding:
                        EdgeInsets.all(5), //apply padding to all four sides
                    child: Container(
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      margin: EdgeInsets.only(
                          left: .0, top: 10, right: 0.0, bottom: 0.0),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 0.0, top: 40.0, right: 0.0, bottom: 0.0),
                      child: TextFormField(
                        maxLength: 25,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3, //<-- SEE HERE
                              color: Color.fromARGB(255, 97, 97, 97),
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          labelText: 'Password',
                          hintText: 'Entrer du texte',
                        ),
                      )),
                ],
              ))),
      Container(
          child: Column(children: <Widget>[
        TextButton(
          onPressed: () {
            //forgot password screen
          },
          child: const Text(
            'Forgot Password',
            style: TextStyle(
                color: Color.fromARGB(168, 245, 188, 2), fontSize: 15),
          ),
        ),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: 350,
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                devtools.log(nameController.text);
                devtools.log(passwordController.text);
              },
            )),
        Row(
          children: <Widget>[
            const Text('Does not have account?'),
            TextButton(
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                //signup screen
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.white,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.ac_unit,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.white,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.ac_unit,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.white,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.inbox,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.white,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.facebook,
                    color: Color.fromARGB(255, 38, 0, 253),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]))
    ])));
  }
}
