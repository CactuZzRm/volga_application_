import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/stock.dart';

class Stocks with ChangeNotifier {
  List<Stock> stocks = [
    Stock(name: "AAPL"),
    Stock(name: "AMZN"),
    Stock(name: "BINANCE:BTCUSDT"),
    Stock(name: "IC MARKETS:1"),
    Stock(name: "MSFT"),
  ];

  Future<dynamic> getInfo() async {
    stocks.forEach(
      (stock) async {
        final url = Uri.parse(
            'https://finnhub.io/api/v1/quote?symbol=${stock.name}&token=c8v07u2ad3iaocnjog70');
        final response = await http.get(url);
        stock.price = jsonDecode(response.body)['o'];
        notifyListeners();
        print(
          stock.name + " " + stock.price.toString(),
        );
      },
    );

    // final url = Uri.parse(
    //     'https://finnhub.io/api/v1/quote?symbol=AAPL&token=c8v07u2ad3iaocnjog70');
    // final response = await http.get(url);
    // print(jsonDecode(response.body)['o']);
  }
}
