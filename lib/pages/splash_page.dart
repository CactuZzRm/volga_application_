import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:volga_application_/widgets/stock_card/loading_indicator.dart';

import '../providers/response.dart';
import '../variables/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<Stocks>(context, listen: false)
        .getStartingPrice()
        .then((_) => Navigator.of(context).pushReplacementNamed('homePage'));

    return Material(
      child: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Stocks App',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 48, color: Colors.white))),
                    Text('При поддержке finnhub.com',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 14, color: Color.fromRGBO(140, 142, 157, 1)))),
                  ],
                ),
                const SizedBox(height: 280),
                LoadingIndicator(boxWidth: 45, boxHeight: 45),
                const SizedBox(height: 10),
                Text('Загружаем актуальную информацию с биржи',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(140, 142, 157, 1))))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
