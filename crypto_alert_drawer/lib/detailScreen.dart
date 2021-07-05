import 'package:crypto_alert_drawer/menu.dart';
import 'package:flutter/material.dart';

import 'classes/Coin.dart';

class DetailScreen extends StatelessWidget {
  final Coin coin;
  const DetailScreen(this.coin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 40),
                color: Colors.blueGrey[200],
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/crypto_icon.png'),
                ),
              )),
              Expanded(
                  child: Container(
                color: Colors.white,
              ))
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share))
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                height: 120,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    boxShadow: shadowList,
                    color: Colors
                        .white, // important to set color inside box decoration -> else error screen
                    borderRadius: BorderRadius.circular(20))),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Add to Portfolio',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Set Alert',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Add to Watchlist',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
