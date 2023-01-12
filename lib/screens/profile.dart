import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Profile name',
        home: Scaffold(
            body: ListView(children: <Widget>[
          Container(
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 194, 16, 218),
                  Color.fromARGB(255, 181, 17, 214)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 50.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/images/me.jpeg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Rym CHAOUCH',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Ariana',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Edit profil'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 181, 17, 214),
                    padding: const EdgeInsets.only(
                        left: 40, top: 20, right: 40, bottom: 20)),
              )),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(children: <Widget>[
                Column(
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Color.fromARGB(255, 230, 22, 202),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 25, left: 10),
                          child: const Icon(
                            Icons.email,
                            size: 30,
                          )),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                          ),
                        ),
                      )
                    ]),
                    const Text(
                      'Phone number',
                      style: TextStyle(
                        color: Color.fromARGB(255, 230, 22, 202),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 25, left: 10),
                          child: const Icon(
                            Icons.phone,
                            size: 30,
                          )),
                      const Expanded(
                        child: Text(
                          '95177198',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ]),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 0.5,
                      indent: 20,
                      endIndent: 0,
                    ),
                    const Text(
                      'houses',
                      style: TextStyle(
                        color: Color.fromARGB(255, 230, 22, 202),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 25, left: 10),
                          child: const Icon(
                            Icons.numbers,
                            size: 30,
                          )),
                      const Expanded(
                        child: Text(
                          '95',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ]),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 0.5,
                      indent: 20,
                      endIndent: 0,
                    ),
                  ],
                ),
              ]))
        ])));
  }
}
