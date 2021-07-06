import 'dart:convert';

import 'package:crypto_alert_drawer/classes/drawerItem.dart';
import 'package:crypto_alert_drawer/pages/aboutPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'classes/Coin.dart';
import 'classes/drawerItems.dart';
import 'detailScreen.dart';
import 'drawerScreen.dart';
import 'pages/homePage.dart';
import 'pages/homeScreen.dart';
import 'data/menu.dart';
import 'pages/helpPage.dart';
import 'pages/profilePage.dart';
import 'pages/settingsPage.dart';
import 'widgets/drawerWidget.dart';

void main() {
  runApp(MaterialApp(
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;
  late Future<List<Coin>> futureCoins;
  // double xOffset = 0;
  // double yOffset = 0;
  // double scaleFactor = 1;
  // bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    //futureCoins = getCoinData();
    closeDrawer();
  }

  void openDrawer() => setState(() {
        xOffset = 220;
        yOffset = 140;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SizedBox.expand(
          child: Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/abstract_bg_2.jpg'),
                        fit: BoxFit.cover)),
                child: buildDrawer()),
            buildPage()
          ]),
        ));
  }

  Widget buildDrawer() {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 35, top: 20, bottom: 20),
            child: Row(
              children: [
                CircleAvatar(
                  child: ClipOval(
                      child: Image.asset(
                    'assets/profile_pic_2.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  )),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'John Wick',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: DrawerWidget(
              onSelectedItem: (item) {
                switch (item) {
                  case DrawerItems.logout:
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Logged out')));
                    return;
                  default:
                    setState(() => this.item = item);
                    closeDrawer();
                }
              },
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            child: AbsorbPointer(
                absorbing: isDrawerOpen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                  child: Container(
                      color: isDrawerOpen ? Colors.white70 : Colors.grey[50],
                      child: getDrawerPage()),
                ))),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.home:
        return HomePage(openDrawer: openDrawer);
      case DrawerItems.profile:
        return ProfilePage(openDrawer: openDrawer);
      case DrawerItems.about:
        return AboutPage(openDrawer: openDrawer);
      case DrawerItems.help:
        return HelpPage(openDrawer: openDrawer);
      case DrawerItems.settings:
        return SettingsPage(openDrawer: openDrawer);
      default:
        return HomePage(openDrawer: openDrawer);
    }
  }
}
