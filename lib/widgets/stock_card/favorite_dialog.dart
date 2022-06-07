import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/stock.dart';
import '../../variables/colors.dart';

Future<dynamic> favoriteDialog(BuildContext context, String text, Stock stock) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: mainColor,
        title: Text(
          '$text в избранное акцию: ${stock.name}?',
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
        actions: [
          TextButton(
            child: const Text(
              'Закрыть окно', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              '$text',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            onPressed: () {
              stock.isFavorite();
              print("${stock.name} ${stock.favorite}");

              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
