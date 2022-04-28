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
  Widget build(BuildContext context) {
    List<Stock> stocksTest = Provider.of<Stocks>(context).stocks;
    //Provider.of<Stocks>(context, listen: false).getInfo();
    //Provider.of<Stocks>(context, listen: false).listener();
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text('Stocks'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Provider.of<Stocks>(context, listen: false).listener(),
            //Provider.of<Stocks>(context, listen: false).getInfo().then((value) => Provider.of<Stocks>(context, listen: false).listner()),
            child: const Text('Сделать запрос'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stocksTest.length,
              itemBuilder: (context, index) {
                //print(stocksTest[index].name);
                return StockCard(stocksTest[index]);
              },
            ),
          ),
        ],
      ),
      //ElevatedButton(onPressed: () => Provider.of<Stocks>(context).getInfo(), child: const Text('Сделать запрос'),),
    );
  }
}
