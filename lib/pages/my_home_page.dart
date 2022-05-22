import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/stock.dart';
import '../providers/response.dart';
import '../variables/colors.dart';
import '../widgets/general_widgets/drawer.dart';
import '../widgets/stock_card/stock_card.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String routeName = '/MyHomePage';

  @override
  void initState() {
    Provider.of<Stocks>(context, listen: false).listener();
    super.initState();
  }

  Widget build(BuildContext context) {
    List<Stock> stocks = Provider.of<Stocks>(context).stocks;

    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text(
          'Акции',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      drawer: CustomDrawer('Список избранных акций', 'favoritesPage'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                return StockCard(stocks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
