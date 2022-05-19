import 'package:flutter/material.dart';
import 'package:volga_application_/widgets/stock_card/loading_indicator.dart';
import 'package:volga_application_/widgets/stock_card/favorite_dialog.dart';
import '../../models/stock.dart';

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
                BorderSide(width: 1, color: Color.fromARGB(255, 166, 166, 166)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.stock.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // : Row(
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           setState(
            //             () {
            //               widget.stock.isFavorite();
            //             },
            //           );
            //         },
            //         icon: Icon(Icons.star,
            //             color: !widget.stock.favorite
            //                 ? Colors.grey
            //                 : Colors.yellow),
            //         iconSize: 16,
            //       ),
            //       Text(
            //         widget.stock.name,
            //         style: const TextStyle(
            //           color: Colors.white,
            //           fontSize: 24,
            //         ),
            //       )
            //     ],
            //   ),
            const SizedBox(width: 40, height: 10),
            widget.stock.lastPrice != 0.0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.stock.price.toStringAsFixed(2),
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
                            priceDirection.toStringAsFixed(3) +
                                '(' +
                                priceDirPercent.toStringAsFixed(3) +
                                '%)'.toString(), // + ' ' + (priceDirectionPer / stock.lastPrice * 100).toStringAsFixed(2) + '%',
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
                      // Visibility(
                      //   visible: details == false ? false : true,
                      //   child: Text(
                      //     priceDirection.toStringAsFixed(3) +
                      //         '(' +
                      //         priceDirPercent.toStringAsFixed(3) +
                      //         '%)'.toString(),
                      //     style: TextStyle(
                      //       color: priceDirection > 0
                      //           ? Colors.green
                      //           : Colors.red,
                      //       fontSize: 18,
                      //     ),
                      //   ),
                      // )
                    ],
                  )
                : LoadingIndicator(boxWidth: 50, boxHeight: 50),
          ],
        ),
      ),
    );
  }
}

//   Future<dynamic> favoriteDialog(BuildContext context, String text) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             '$text в избранное акцию \n${widget.stock.name}?',
//             style: const TextStyle(fontSize: 18),
//           ),
//           actions: [
//             TextButton(
//               child: const Text(
//                 'Закрыть окно',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 34, 34, 34),
//                   fontSize: 16,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text(
//                 '$text',
//                 style: const TextStyle(
//                   color: Color.fromARGB(255, 34, 34, 34),
//                   fontSize: 16,
//                 ),
//               ),
//               onPressed: () {
//                 setState(
//                   () {
//                     widget.stock.isFavorite();
//                     print("${widget.stock.name} ${widget.stock.favorite}");
//                   },
//                 );
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
