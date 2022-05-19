import 'package:flutter/material.dart';

import '../../models/stock.dart';

// class FavoriteDialog extends StatelessWidget {
//   String text;
//   Stock stock;

//   FavoriteDialog({
//     required this.text,
//     required this.stock,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(
//         '$text в избранное акцию \n${stock.name}?',
//         style: const TextStyle(fontSize: 18),
//       ),
//       actions: [
//         TextButton(
//           child: const Text(
//             'Закрыть окно',
//             style: TextStyle(
//               color: Color.fromARGB(255, 34, 34, 34),
//               fontSize: 16,
//             ),
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         TextButton(
//           child: Text(
//             '$text',
//             style: const TextStyle(
//               color: Color.fromARGB(255, 34, 34, 34),
//               fontSize: 16,
//             ),
//           ),
//           onPressed: () {
//             stock.isFavorite();
//             print("${stock.name} ${stock.favorite}");

//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }

Future<dynamic> favoriteDialog(BuildContext context, String text, Stock stock) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          '$text в избранное акцию \n${stock.name}?',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            child: const Text(
              'Закрыть окно',
              style: TextStyle(
                color: Color.fromARGB(255, 34, 34, 34),
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              '$text',
              style: const TextStyle(
                color: Color.fromARGB(255, 34, 34, 34),
                fontSize: 16,
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
