import 'package:crypto_alert_drawer/classes/drawerItem.dart';
import 'package:crypto_alert_drawer/classes/drawerItems.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;

  const DrawerWidget({Key? key, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          16, 32, MediaQuery.of(context).size.width - 220, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [buildDrawerItems(context)],
        ),
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
        children: DrawerItems.drawerItemList
            .map((item) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  onTap: () => onSelectedItem(item),
                ))
            .toList());
  }
}
