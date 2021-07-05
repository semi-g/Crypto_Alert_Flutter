import 'package:crypto_alert_drawer/pages/aboutPage.dart';
import 'package:flutter/material.dart';

import 'drawerScreen.dart';
import 'homeScreen.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    routes: {'/about': (_) => AboutPage()},
  ));
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(), HomeScreen()],
      ),
    );
  }
}
