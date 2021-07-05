import 'dart:convert';
import 'package:crypto_alert/pages/detailScreen.dart';
import 'package:crypto_alert/pages/drawerScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'classes/Coin.dart';
import 'package:crypto_alert/classes/NavBar.dart';

import 'classes/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DataFromAPI(),
    );
  }
}

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  late Future<List<Coin>> futureCoins;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    futureCoins = getCoinData(); // TODO: later set coinName with TextBox value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              color: Colors.grey[50],
            ),
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDrawerOpen
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                              });
                            },
                            icon: Icon(Icons.arrow_back_ios))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                xOffset = 230;
                                yOffset = 150;
                                scaleFactor = 0.6;
                                isDrawerOpen = true;
                              });
                            },
                            icon: Icon(Icons.menu)),
                    Column(
                      children: [
                        Text('data'),
                        Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.green,
                            ),
                            Text('Home')
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar()
                  ],
                ),
              ),
              Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menuList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: shadowList,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                menuList[index]['iconPath'],
                                height: 50,
                                width: 50,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(menuList[index]['name'])
                          ],
                        ),
                      );
                    },
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(color: Colors.cyan)),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Search coin'),
                  ],
                ),
              ),
              Container(
                child: FutureBuilder<List<Coin>>(
                  future: futureCoins,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, int index) {
                              return Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/crypto_icon.png'),
                                    ),
                                    title: Text(snapshot.data![index].name),
                                    subtitle: Text('Price: ' +
                                        snapshot.data![index].price.toString() +
                                        '\n' +
                                        '24h Volume: ' +
                                        snapshot.data![index].volume_24h
                                            .toString() +
                                        '\n' +
                                        'Timestamp: ' +
                                        snapshot.data![index].timestamp
                                            .toString()),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                      snapshot.data![index])));
                                    },
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // show a loading spinner by default
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ])));
  }
}

// class DetailPage extends StatelessWidget {
//   final Coin coin;

//   const DetailPage(this.coin);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(coin.name),
//       ),
//     );
//   }
// }

// TODO: figure out why offline debugging doesn't work
Future<List<Coin>> getCoinData() async {
  const fiat = 'usd';
  const API_KEY = 'sOTtNQeUlgGRpaKESGI4iEHPXpZBgvb1agP';
  const API_URL =
      'https://www.worldcoinindex.com/apiservice/v2getmarkets?key=' +
          API_KEY +
          '&fiat=' +
          fiat;

  // TODO: add offline function -> if no connection, previous data is loaded (that is stored with cookies)
  // and if first time use -> show message saying no connection
  final response = await http.get(Uri.parse(API_URL));
  final jsonData = json.decode(response.body);

  List<Coin> coins = [];
  var coinData = jsonData['Markets'][0];

  for (int i = 0; i < coinData.length; i++) {
    Coin coin = Coin(
        coinData[i]['Label'],
        coinData[i]['Name'],
        coinData[i]['Price'],
        coinData[i]['Volume_24h'],
        coinData[i]['Timestamp']);
    coins.add(coin);
  }
  return coins;
}
