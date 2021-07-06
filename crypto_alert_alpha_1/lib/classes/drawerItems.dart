import 'package:crypto_alert_drawer/classes/drawerItem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItems {
  static const home = DrawerItem(title: 'Home', icon: FontAwesomeIcons.home);
  static const profile =
      DrawerItem(title: 'Profile', icon: FontAwesomeIcons.userAstronaut);
  static const about = DrawerItem(title: 'About', icon: FontAwesomeIcons.info);
  static const help =
      DrawerItem(title: 'Help', icon: FontAwesomeIcons.questionCircle);
  static const settings =
      DrawerItem(title: 'Settings', icon: FontAwesomeIcons.cog);
  static const logout =
      DrawerItem(title: 'Logout', icon: FontAwesomeIcons.signOutAlt);

  static final List<DrawerItem> drawerItemList = [
    home,
    profile,
    about,
    help,
    settings,
    logout
  ];
}
