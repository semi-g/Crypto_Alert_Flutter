import 'package:crypto_alert_drawer/pages/signUpScreen.dart';
import 'package:crypto_alert_drawer/widgets/drawerMenuWidget.dart';
import 'package:flutter/material.dart';

import 'loginScreen.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback openDrawer;

  const LoginPage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              top: -60,
              left: -60,
              child: Image.asset(
                'assets/circle_purple_rose_transparent.png',
                width: size.width * 0.6,
              )),
          Container(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: DrawerMenuWidget(
              onClicked: openDrawer,
            ),
          ),
          Positioned(
              bottom: -50,
              right: -50,
              child: Image.asset(
                'assets/circle_red_transparent.png',
                width: size.width * 0.6,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 40,
                    color: Colors.cyan,
                  ),
                  Text(
                    'CRYPTONiTE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 29,
                        color: Colors.cyan),
                  ),
                  Container(
                    height: 2,
                    width: 40,
                    color: Colors.cyan,
                  ),
                ],
              ),
              Container(
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.cyan,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Text(
                      'LOGiN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.cyan[50],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpScreen();
                      }));
                    },
                    child: Text(
                      'SiGN UP',
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
