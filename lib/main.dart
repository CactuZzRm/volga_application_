import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'response.dart';
import 'models/stock.dart';
import 'widgets/stock_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  Stocks test = Stocks();
  test.getInfo();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Stocks()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List<Stock> stocksTest = [Stock(name: 'A', price: 100.0)];
  

  List<int> ints = <int>[1, 2, 3];

  @override
  Widget build(BuildContext context) {
    List<Stock> stocksTest = Provider.of<Stocks>(context).stocks;

    

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: stocksTest.length,
        itemBuilder: (BuildContext context, int index) {
          return StockCard(stocksTest[0]);
        },
      ),
    );
  }
}
