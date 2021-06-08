import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'classes/Coin.dart';

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
  late Future<Coin> futureCoin;

  @override
  void initState() {
    super.initState();
    futureCoin =
        getCoinData('Ethereum'); // TODO: later set coinName with TextBox value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Data'),
      ),
      body: Center(
        child: FutureBuilder<Coin>(
          future: futureCoin,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text(
                          snapshot.data!.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.label,
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  snapshot.data!.price.toString(),
                                ),
                                Text(
                                  snapshot.data!.volume_24h.toString(),
                                ),
                                Text(
                                  snapshot.data!.timestamp.toString(),
                                ),
                              ]),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            textColor: const Color(0xFF6200EE),
                            onPressed: () {
                              // Perform some action
                            },
                            child: const Text('ACTION 1'),
                          ),
                          FlatButton(
                            textColor: const Color(0xFF6200EE),
                            onPressed: () {
                              // Perform some action
                            },
                            child: const Text('ACTION 2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
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

Future<Coin> getCoinData(String coinName) async {
  const fiat = 'usd';
  const API_KEY = 'sOTtNQeUlgGRpaKESGI4iEHPXpZBgvb1agP';
  const API_URL =
      'https://www.worldcoinindex.com/apiservice/v2getmarkets?key=' +
          API_KEY +
          '&fiat=' +
          fiat;

  final response = await http.get(Uri.parse(API_URL));
  if (response.statusCode == 200) {
    return Coin.fromJson(jsonDecode(response.body), coinName);
  } else {
    throw Exception('Failed to load album');
  }

  // var response = await http.get(Uri.https(API_URL_HEADER, API_URL_PATH));
  // var jsonData = jsonDecode(response.);
  // var coinName = jsonData['Markets'][0][0]['Name'];
  // List<Coin> coins = [];
  // print(coinName);

  // for (var c in jsonData){
  //   Coin coin = Coin(c['Markets'])
  // }
}
