import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/stock.dart';
import '../providers/response.dart';
import '../widgets/stock_card/stock_card.dart';

class FavoriteScreen extends StatelessWidget {
  //List<Stock> favorites = [];
  List<Stock> favorites = [];

  FavoriteScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    Provider.of<Stocks>(context).getInfo();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 36, 36),
      appBar: AppBar(
        title: const Text('Favorites!'),
        backgroundColor: const Color.fromARGB(255, 54, 54, 54),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return StockCard(favorites[index]);
        },
      ),
    );
  }
}
