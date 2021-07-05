import 'package:crypto_alert_drawer/pages/aboutPage.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              image: AssetImage('assets/abstract_bg_2.jpg'),
              fit: BoxFit.cover)),
      padding: EdgeInsets.only(top: 50, left: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
          Column(
            children: [
              GestureDetector(
                onTap: () => null,
                child: Row(
                  children: [
                    Icon(Icons.home, color: Colors.white, size: 30),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => null,
                child: Row(
                  children: [
                    Icon(Icons.face, color: Colors.white, size: 30),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/about'),
                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.white, size: 30),
                    Text(
                      'About',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  width: 100,
                  height: 2,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => null,
                child: Row(
                  children: [
                    Icon(Icons.help, color: Colors.white, size: 30),
                    Text(
                      'Help',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Logout',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
