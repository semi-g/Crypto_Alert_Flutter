import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('@username'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'profile_pic_2.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage('abstract_bg_2.jpg'), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.help_outline_rounded),
            title: Text('Help'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
