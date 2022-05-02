import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/stock.dart';
import '../providers/response.dart';
import '../widgets/stock_card.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  void initState() {
    Provider.of<Stocks>(context, listen: false).getInfo().then(
        (value) => Provider.of<Stocks>(context, listen: false).listener());
    super.initState();
  }

  Widget build(BuildContext context) {
    List<Stock> stocks = Provider.of<Stocks>(context).stocks;
    //Provider.of<Stocks>(context, listen: false).listener();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 36, 36),
      appBar: AppBar(
        title: const Text('Stocks'),
        backgroundColor: Color.fromARGB(255, 54, 54, 54),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                //print(stocksTest[index].name);
                return StockCard(stocks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
