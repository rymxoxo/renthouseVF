import 'package:flutter/material.dart';
import 'package:house_rent/constants/routes.dart';

import 'package:house_rent/models/house.dart';
import 'package:house_rent/widgets/about.dart';
import 'package:house_rent/widgets/content_intro.dart';
import 'package:house_rent/widgets/details_app_bar.dart';
import 'package:house_rent/widgets/house_info.dart';

class Details extends StatelessWidget {
  final House house;
  const Details({
    Key? key,
    required this.house,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsAppBar(house: house),
            const SizedBox(height: 20),
            ContentIntro(house: house),
            const SizedBox(height: 20),
            const HouseInfo(),
            const SizedBox(height: 20),
            const About(),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Appatment Marsa'),
                        content: const Text(
                            "You can find attached the information of the owner of ths house ,Don't  hesitate to contact him and make a visit to this house."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamedAndRemoveUntil(
                              bookRoute,
                              (route) => false,
                            ),
                            child: const Text('Consult information'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
