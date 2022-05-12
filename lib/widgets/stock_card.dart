import 'package:flutter/material.dart';
import '../models/stock.dart';

class StockCard extends StatefulWidget {
  final Stock stock;

  StockCard(this.stock);

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  bool details = false;

  @override
  Widget build(BuildContext context) {
    var priceDirection = widget.stock.price - widget.stock.lastPrice;
    var priceDirPercent = widget.stock.price > widget.stock.lastPrice
        ? (widget.stock.lastPrice - widget.stock.price) /
            widget.stock.lastPrice *
            100 *
            -1.0
        : (widget.stock.price - widget.stock.lastPrice) /
            widget.stock.lastPrice *
            100;
    return GestureDetector(
      onTap: () {
        setState(() {
          details = !details;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom:
                BorderSide(width: 1, color: Color.fromARGB(255, 166, 166, 166)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.stock.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(width: 40, height: 10),
            widget.stock.lastPrice != 0.0
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.stock.price.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.stock.lastPrice
                                  .toString(), // + ' ' + (priceDirectionPer / stock.lastPrice * 100).toStringAsFixed(2) + '%',
                              style: TextStyle(
                                color: priceDirection > 0
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                              height: 0,
                            ),
                            Icon(
                                priceDirection > 0
                                    ? Icons.arrow_circle_up
                                    : Icons.arrow_circle_down,
                                color: priceDirection > 0
                                    ? Colors.green
                                    : Colors.red),
                          ],
                        ),
                        Visibility(
                          visible: details == false ? false : true,
                          child: Text(
                            priceDirection.toString() +
                                ' ' +
                                priceDirPercent.toStringAsFixed(4) +
                                '%'.toString(),
                            style: TextStyle(
                              color: priceDirection > 0
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(
                    width: 50,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Color.fromARGB(70, 255, 255, 255),
                        color: Color.fromARGB(255, 255, 255, 255),
                        strokeWidth: 3,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
