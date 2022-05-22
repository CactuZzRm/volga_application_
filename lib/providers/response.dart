import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import '../models/stock.dart';

class Stocks with ChangeNotifier {
  var channel = WebSocketChannel.connect(
      Uri.parse('wss://ws.finnhub.io?token=c8v07u2ad3iaocnjog70'));

  List<Stock> stocks = [
    Stock(name: "AAPL"),
    Stock(name: "AMZN"),
    Stock(name: "BINANCE:BTCUSDT"),
    Stock(name: "IC MARKETS:1"),
    Stock(name: "MSFT"),
    Stock(name: 'BYND'),
    Stock(name: "EXCOF"),
    Stock(name: "GOOGL"),
    Stock(name: "TSLA"),
    Stock(name: "NVDA"),
    Stock(name: "V"),
    Stock(name: "WMT"),
    Stock(name: "MA"),
    Stock(name: "BAC"),
  ];

  Future<dynamic> getStocks() async {
    final url = Uri.parse(
        'https://finnhub.io/api/v1/stock/symbol?exchange=US&token=c8v07u2ad3iaocnjog70');
    try {
      final response = await http.get(url);
      if (response.body != null) {
        List<dynamic> data = jsonDecode(response.body);
        data.forEach(
          (stock) {
            stocks.add(Stock(name: stock['symbol']));
          },
        );
        notifyListeners();
      }
    } catch (err) {
      print(' - запрос не выполнен!');
    }
  }

  List<Stock> onSearch(String search) {
    return stocks.where((stock) => stock.name.contains(search)).toList();
  }

  Future<dynamic> getInfo() async {
    stocks.forEach(
      (stock) async {
        final url = Uri.parse(
            'https://finnhub.io/api/v1/quote?symbol=${stock.name}&token=c8v07u2ad3iaocnjog70');
        try {
          final response = await http.get(url);
          if (response.body != null) {
            stock.price = jsonDecode(response.body)['o'];
            stock.lastPrice = jsonDecode(response.body)['c'];
            notifyListeners();
          }
        } catch (err) {
          stock.name + ' - запрос не выполнен!';
        }
      },
    );
  }

  void listenStock(String symbol){
    channel.sink.add(jsonEncode({"type": "subscribe", "symbol": symbol}));
  }

  void closeListenStock(String symbol){
    channel.sink.add(jsonEncode({"type": "unsubscribe", "symbol": symbol}));
  }

  void listener() {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://ws.finnhub.io?token=c8v07u2ad3iaocnjog70'),
    );
    channel.stream.listen(
      (event) {
        try {
          if (jsonDecode(event)['data'] != null) {
            final data = jsonDecode(event)['data'] as List<dynamic>;
            data.forEach(
              (element) {
                var stock = stocks.firstWhere((el) => el.name == element['s']);
                stock.lastPrice = element['p'] * 1.0;
              },
            );
            notifyListeners();
          }
        } catch (err) {
          print('error: $err');
        }
      },
    );
  }
}
