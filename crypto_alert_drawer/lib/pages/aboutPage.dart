import 'package:crypto_alert_drawer/detailScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../menu.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
        color: Colors.grey[50],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                        icon: Icon(Icons.arrow_back_ios))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        },
                        icon: Icon(Icons.menu)),
                Column(
                  children: [
                    Text('data'),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.green,
                        ),
                        Text('Home')
                      ],
                    ),
                  ],
                ),
                CircleAvatar()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
