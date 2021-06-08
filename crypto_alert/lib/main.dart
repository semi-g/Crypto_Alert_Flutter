import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'classes/Coin.dart';
import 'package:crypto_alert/classes/NavBar.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
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

  @override
  void initState() {
    super.initState();
    futureCoins = getCoinData(); // TODO: later set coinName with TextBox value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        title: Text('Coin Data'),
      ),
      body: Center(
        child: FutureBuilder<List<Coin>>(
          future: futureCoins,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage('assets/crypto_icon.png'),
                          ),
                          title: Text(snapshot.data![index].name),
                          subtitle: Text('Price: ' +
                              snapshot.data![index].price.toString() +
                              '\n' +
                              '24h Volume: ' +
                              snapshot.data![index].volume_24h.toString() +
                              '\n' +
                              'Timestamp: ' +
                              snapshot.data![index].timestamp.toString()),
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(snapshot.data![index])));
                          },
                        ),
                      ),
                    );
                  });
              // return Container(
              //   padding: const EdgeInsets.all(10),
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     child: Column(
              //       children: [
              //         ListTile(
              //           leading: Icon(Icons.arrow_drop_down_circle),
              //           title: Text(
              //             snapshot.data!.name,
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 70),
              //           child: Align(
              //             alignment: Alignment.centerLeft,
              //             child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     snapshot.data!.label,
              //                     textAlign: TextAlign.left,
              //                   ),
              //                   Text(
              //                     snapshot.data!.price.toString(),
              //                   ),
              //                   Text(
              //                     snapshot.data!.volume_24h.toString(),
              //                   ),
              //                   Text(
              //                     snapshot.data!.timestamp.toString(),
              //                   ),
              //                 ]),
              //           ),
              //         ),
              //         ButtonBar(
              //           alignment: MainAxisAlignment.start,
              //           children: [
              //             FlatButton(
              //               textColor: const Color(0xFF6200EE),
              //               onPressed: () {
              //                 // Perform some action
              //               },
              //               child: const Text('ACTION 1'),
              //             ),
              //             FlatButton(
              //               textColor: const Color(0xFF6200EE),
              //               onPressed: () {
              //                 // Perform some action
              //               },
              //               child: const Text('ACTION 2'),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              //);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // show a loading spinner by default
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Coin coin;

  const DetailPage(this.coin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coin.name),
      ),
    );
  }
}

Future<List<Coin>> getCoinData() async {
  const fiat = 'usd';
  const API_KEY = 'sOTtNQeUlgGRpaKESGI4iEHPXpZBgvb1agP';
  const API_URL =
      'https://www.worldcoinindex.com/apiservice/v2getmarkets?key=' +
          API_KEY +
          '&fiat=' +
          fiat;

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

  // if (response.statusCode == 200) {
  //   return Coin.fromJson(jsonDecode(response.body), coinName);
  // } else {
  //   throw Exception('Failed to load album');
  // }

  // var response = await http.get(Uri.https(API_URL_HEADER, API_URL_PATH));
  // var jsonData = jsonDecode(response.);
  // var coinName = jsonData['Markets'][0][0]['Name'];
  // List<Coin> coins = [];
  // print(coinName);

  // for (var c in jsonData){
  //   Coin coin = Coin(c['Markets'])
  // }
}
