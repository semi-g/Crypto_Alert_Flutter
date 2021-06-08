class Coin {
  final String label;
  final String name;
  final double price;
  final num volume_24h;
  final int timestamp;
  //final String errorMessage;

  Coin(this.label, this.name, this.price, this.volume_24h, this.timestamp);

  // Coin(
  //     {required this.label,
  //     required this.name,
  //     required this.price,
  //     required this.volume_24h,
  //     required this.timestamp,
  //     required this.errorMessage});

  // factory Coin.fromJson(Map<String, dynamic> json, String coinName) {
  //   for (int i = 0; i < json['Markets'][0].length; i++) {
  //     if (json['Markets'][0][i]['Name'] == coinName) {
  //       // String coinLabel = json['Markets'][0][i]['Label'];
  //       // String coinName = json['Markets'][0][i]['Name'];
  //       // double coinPrice = json['Markets'][0][i]['Price'];
  //       // double coinVolume_24h = json['Markets'][0][i]['Volume_24h'];
  //       // int coinTimestamp = json['Markets'][0][i]['Timestamp'];
  //       return Coin(
  //         label: json['Markets'][0][i]['Label'],
  //         name: json['Markets'][0][i]['Name'],
  //         price: json['Markets'][0][i]['Price'],
  //         volume_24h: json['Markets'][0][i]['Volume_24h'],
  //         timestamp: json['Markets'][0][i]['Timestamp'],
  //         errorMessage: '',
  //       );
  //     }
  //   }
  //   return Coin(
  //       label: '',
  //       name: '',
  //       price: 0,
  //       volume_24h: 0,
  //       timestamp: 0,
  //       errorMessage: 'Coin not found.');
  // }
}
