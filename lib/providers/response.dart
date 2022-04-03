import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/stock.dart';

class Stocks with ChangeNotifier {
  List<Stock> stocks = [
    Stock(name: "AAPL", price: 0.0),
    Stock(name: "AMZN", price: 0.0),
    Stock(name: "BINANCE:BTCUSDT", price: 0.0),
    Stock(name: "IC MARKETS:1", price: 0.0),
    Stock(name: "MSFT", price: 0.0),
    Stock(name: 'BYND', price: 0.0),
  ];

  Future<dynamic> getInfo() async {
    stocks.forEach(
      (stock) async {
        final url = Uri.parse(
            'https://finnhub.io/api/v1/quote?symbol=${stock.name}&token=c8v07u2ad3iaocnjog70');
        final response = await http.get(url);
        stock.price = jsonDecode(response.body)['o'];
        //print(stock.name + " " + stock.price.toString(),);
        notifyListeners();
        
      },
    );
  }
}
