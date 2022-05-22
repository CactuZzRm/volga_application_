import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../variables/colors.dart';

class CustomDrawer extends StatelessWidget {
  String textOfPageButton;
  String routeOfPageButton;
  CustomDrawer(this.textOfPageButton, this.routeOfPageButton);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mainColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            ListView(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(mainColor),
                      elevation: MaterialStateProperty.all(0),
                      // shape: MaterialStateProperty.all(
                      //   RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(50),
                      //     side: const BorderSide(color: Colors.white, width: 2),
                      //   ),
                      // ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(routeOfPageButton);
                    },
                    child: Text(
                      textOfPageButton,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )),
                const Divider(color: Colors.white),
                // ElevatedButton(
                //     style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(mainColor),
                //       elevation: MaterialStateProperty.all(0),
                //       // shape: MaterialStateProperty.all(
                //       //   RoundedRectangleBorder(
                //       //     borderRadius: BorderRadius.circular(50),
                //       //     side: const BorderSide(color: Colors.white, width: 2),
                //       //   ),
                //       // ),
                //     ),
                //     onPressed: () {
                //       showDialog(
                //         context: context,
                //         builder: (BuildContext context) {
                //           return AlertDialog(
                //             title: const Text(
                //               'Мини-справочник',
                //               style: TextStyle(fontSize: 18),
                //             ),
                //             content: const Text(
                //               'Для отображения детальной информации о изменении цены акции нажмите на карточку акции! \n В карточке на верхней позиции отображается актуальная цена, ниже - предыдущая!',
                //               style: TextStyle(fontSize: 16),
                //             ),
                //             actions: [
                //               TextButton(
                //                 child: const Text(
                //                   'Закрыть окно',
                //                   style: TextStyle(
                //                     color: Color.fromARGB(255, 34, 34, 34),
                //                     fontSize: 16,
                //                   ),
                //                 ),
                //                 onPressed: () {
                //                   Navigator.of(context).pop();
                //                 },
                //               ),
                //             ],
                //           );
                //         },
                //       );
                //     },
                //     child: const Text('Мини-справочник', style: TextStyle(fontSize: 18))),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                  child: Icon(Icons.menu, color: Colors.white, size: 120),
                  alignment: Alignment.bottomLeft),
            ),
          ],
        ),
      ),
    );
  }
}
