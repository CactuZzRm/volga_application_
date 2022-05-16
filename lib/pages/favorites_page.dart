import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../models/stock.dart';
import '../widgets/stock_card.dart';

class FavoriteScreen extends StatelessWidget {
  List<Stock> favorites = [];
  
  FavoriteScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites!')),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return StockCard(favorites[index]);
        },
      ),
    );
  }
}
