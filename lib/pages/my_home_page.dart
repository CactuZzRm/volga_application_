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
  String routeName = '/MyHomePage';
  @override
  void initState() {
    Provider.of<Stocks>(context, listen: false)
        .getInfo()
        .then((_) => Provider.of<Stocks>(context, listen: false).listener());
    super.initState();
  }

  Widget build(BuildContext context) {
    var isWhite = false;
    List<Stock> stocks = Provider.of<Stocks>(context).stocks;
    //Provider.of<Stocks>(context, listen: false).listener();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 36, 36),
      appBar: AppBar(
        title: const Text('Stocks'),
        backgroundColor: Color.fromARGB(255, 54, 54, 54),
        automaticallyImplyLeading: true,
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 54, 54, 54),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              ListView(
                children: [
                  SwitchListTile(
                      value: isWhite,
                      title: Text('Светлая тема?'),
                      activeColor: Colors.black,
                      onChanged: (_) {
                        setState(() {
                          isWhite = !isWhite;
                        });
                      }),
                  const Divider(color: Colors.white),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 107, 107, 107),
                      )),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Мини-справочник',
                                style: TextStyle(fontSize: 18),
                              ),
                              content: const Text(
                                'Для отображения детальной информации о изменении цены акции нажмите на карточку акции! \n В карточке на верхней позиции отображается актуальная цена, ниже - предыдущая!',
                                style: TextStyle(fontSize: 16),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    'Закрыть окно',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 34, 34, 34),
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('Мини-справочник')),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                    child: Icon(Icons.menu, color: Colors.white, size: 120),
                    alignment: Alignment.bottomLeft),
              ),
            ],
          ),
        ),
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
