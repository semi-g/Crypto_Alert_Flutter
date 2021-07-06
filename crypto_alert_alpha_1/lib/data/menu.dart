import 'package:flutter/material.dart';

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey.shade300, blurRadius: 15, offset: Offset(0, 10))
];

List<Map> menuList = [
  {
    'name': 'All Coins',
    'iconPath': 'assets/coins.png'
  }, // add attribution: Icons made by "https://www.flaticon.com/authors/smashicons"
  {
    'name': 'Portfolio',
    'iconPath': 'assets/portfolio.png'
  }, // Icons made by "https://www.flaticon.com/authors/dimitry-miroliubov"
  {
    'name': 'Alerts',
    'iconPath': 'assets/alert.png'
  }, // Icons made by "https://www.flaticon.com/authors/pixel-perfect"
  {
    'name': 'Watchlists',
    'iconPath': 'assets/watchlist.png'
  }, // Icons made by "https://www.freepik.com"
];

String textAbout =
    """Cryptline/ Cryptonite is a simple application that can notify its user about the current trends in cryptocurrencies. The purpose of this application is to automate the process of looking for cryptocurrencies that have recently seen large moves in their prices. This can help the user to identify potential opportunities or just learn about certain cryptocurrencies. This application can also potentially be used to spot pump and dump schemes early on. 
    
Cryptline is under full development by me, Sem Gabelko. I am the founder, CEO, CTO, CIO, CFO, COO, Chief Engineer, Tech Lead, Head of Design and much more... If you have any questions, contact my assistant.""";

String getTextAbout() {
  return textAbout;
}
