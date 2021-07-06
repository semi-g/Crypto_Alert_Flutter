import 'package:crypto_alert_drawer/data/menu.dart';
import 'package:crypto_alert_drawer/widgets/drawerMenuWidget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final VoidCallback openDrawer;

  const AboutPage({Key? key, required this.openDrawer}) : super(key: key);

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
              'About',
              style: TextStyle(color: Colors.grey, fontSize: 25),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 25),
            height: MediaQuery.of(context).size.height - 140,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/plants_bg.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.dstATop)),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      topRight: Radius.circular(70)),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0xFF363f94).withOpacity(0.3),
                      offset: new Offset(-8, 0),
                      blurRadius: 25,
                      spreadRadius: 2,
                    )
                  ]),
              padding:
                  EdgeInsets.only(left: 20, top: 30, bottom: 30, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        getTextAbout(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
