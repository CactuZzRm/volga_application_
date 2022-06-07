import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/stock.dart';
import '../providers/response.dart';
import '../variables/colors.dart';
import '../widgets/general_widgets/drawer.dart';
import '../widgets/stock_card/stock_card.dart';

  class FavoriteScreen extends StatelessWidget {
    const FavoriteScreen({Key? key}) : super(key: key);
    

    @override
    Widget build(BuildContext context) {
      Provider.of<Stocks>(context).getStartingPrice();
      List<Stock> favorites = Provider.of<Stocks>(context, listen: true)
          .stocks
        .where((stock) => stock.favorite)
        .toList();
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text('Избранные', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 28))),
        elevation: 0,
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      drawer: CustomDrawer('Главная', 'homePage'),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return StockCard(favorites[index]);
        },
      ),
    );
  }
}
