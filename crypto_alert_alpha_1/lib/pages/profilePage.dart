import 'package:crypto_alert_drawer/widgets/drawerMenuWidget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback openDrawer;

  const ProfilePage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.only(top: 20),
          child: DrawerMenuWidget(
            onClicked: openDrawer,
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(right: 50, top: 20),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Profile',
              style: TextStyle(color: Colors.grey, fontSize: 25),
            ),
          ),
        ),
      ),
      body: Column(),
    );
  }
}
