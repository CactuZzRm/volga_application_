import 'package:flutter/material.dart';
import '../models/stock.dart';

class StockCard extends StatelessWidget {
  final Stock stock;

  const StockCard(this.stock);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            stock.name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Column(
            children: [
              Text(
                stock.price.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                stock.lastPrice.toString(),
                style: TextStyle(
                  backgroundColor: stock.lastPrice < 0 ? Colors.red : Colors.green,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
