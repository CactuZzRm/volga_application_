import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:volga_application_/variables/colors.dart';
import 'package:volga_application_/widgets/stock_card/loading_indicator.dart';
import 'package:volga_application_/widgets/stock_card/favorite_dialog.dart';
import '../../models/stock.dart';
import '../../providers/response.dart';

class StockCard extends StatefulWidget {
  final Stock stock;

  const StockCard(this.stock);

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  bool details = false;
  var provider;

  @override
  void initState() {
    provider = Provider.of<Stocks>(context, listen: false);
    provider.subscribeStock(widget.stock.name);
    super.initState();
  }

  @override
  void dispose() {
    provider.unsubscribeStock(widget.stock.name);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var priceDirection = (widget.stock.price - widget.stock.lastPrice) > 0;
    var priceDirPercent = (widget.stock.price - widget.stock.lastPrice) /
        widget.stock.lastPrice *
        100;
    return GestureDetector(
      onTap: () {
        !widget.stock.favorite
            ? favoriteDialog(context, 'Добавить', widget.stock)
            : favoriteDialog(context, 'Удалить', widget.stock);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom:
                BorderSide(width: 1, color: Color.fromARGB(44, 166, 166, 166)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(widget.stock.name,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(fontSize: 28), color: Colors.white)),
            ),
            widget.stock.lastPrice != 0.0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.stock.lastPrice.toStringAsFixed(2),
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(fontSize: 26),
                              color: Colors.white)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              (widget.stock.price - widget.stock.lastPrice)
                                      .toStringAsFixed(2) +
                                  '(' +
                                  priceDirPercent.toStringAsFixed(2) +
                                  '%)'.toString(), // + ' ' + (priceDirectionPer / stock.lastPrice * 100).toStringAsFixed(2) + '%',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: priceDirection
                                      ? priceUpColor
                                      : priceDownColor,
                                  fontSize: 20,
                                ),
                              )

                              // TextStyle(
                              //   color: priceDirection
                              //       ? priceUpColor
                              //       : priceDownColor,
                              //   fontSize: 20,
                              // ),
                              ),
                          const SizedBox(
                            width: 3,
                            height: 0,
                          ),
                          Icon(
                            priceDirection
                                ? Icons.arrow_circle_up
                                : Icons.arrow_circle_down,
                            color:
                                priceDirection ? priceUpColor : priceDownColor,
                          ),
                        ],
                      ),
                    ],
                  )
                : LoadingIndicator(boxWidth: 50, boxHeight: 50),
          ],
        ),
      ),
    );
  }
}
