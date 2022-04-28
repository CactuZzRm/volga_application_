import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import '../models/stock.dart';

class Stocks with ChangeNotifier {
  List<Stock> stocks = [
    Stock(name: "AAPL"),
    Stock(name: "AMZN"),
    Stock(name: "BINANCE:BTCUSDT"),
    Stock(name: "IC MARKETS:1"),
    Stock(name: "MSFT"),
    Stock(name: 'BYND'),
  ];

  Future<dynamic> getInfo() async {
    stocks.forEach(
      (stock) async {
        final url = Uri.parse(
            'https://finnhub.io/api/v1/quote?symbol=${stock.name}&token=c8v07u2ad3iaocnjog70');
        try {
          final response = await http.get(url);
          if (response.body != null) {
            stock.price = jsonDecode(response.body)['o'];
            print(stock.name + " " + stock.price.toString());
            notifyListeners();
          }
        } catch (err) {
          print('error');
        }
      },
    );
  }

  void listenerFlow(WebSocketChannel channel) {
    stocks.forEach((stock) {
      channel.sink.add(jsonEncode({"type": "subscribe", "symbol": stock.name}));
    });
  }

  void listener() {
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://ws.finnhub.io?token=c8v07u2ad3iaocnjog70'),
    );
    
    listenerFlow(channel);

    channel.stream.listen((event) {
      //print('Слежу--------------------------------------');
      final List<dynamic> data = jsonDecode(event)['data'];
      
      data.forEach((element) {
        stocks.firstWhere((stock) => stock.name == element['s']).lastPrice = element['p'];
        notifyListeners();
       });
    });
  }
}
