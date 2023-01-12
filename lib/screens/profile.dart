import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:house_rent/widgets/custom_app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  _handleNavigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile ',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: ListView(children: <Widget>[
          Container(
            child: Image.asset(
              'assets/images/setting.png',
              height: 300,
              width: 300,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: Container(
                          margin: const EdgeInsets.only(right: 25, left: 10),
                          child: const Icon(
                            Icons.email,
                            size: 30,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Edit your Email',
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      )
                    ]),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: Container(
                          margin: const EdgeInsets.only(right: 25, left: 10),
                          child: const Icon(
                            Icons.phone,
                            size: 30,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Edit your Phone number',
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 50),
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 184, 10, 219),
                                  padding: EdgeInsets.only(
                                      top: 40, bottom: 40, left: 35, right: 35),
                                  minimumSize: Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              child: const Text('Cancel',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 196, 194, 195),
                                  )),
                              onPressed: null,
                            )),
                        Container(
                            margin: const EdgeInsets.only(left: 20),
                            padding: const EdgeInsets.all(40),
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 184, 10, 219),
                                  padding: const EdgeInsets.only(
                                      top: 40, bottom: 40, left: 50, right: 50),
                                  minimumSize: Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              child: const Text('Save',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 196, 194, 195),
                                  )),
                              onPressed: null,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
