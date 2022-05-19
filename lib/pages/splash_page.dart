import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volga_application_/pages/my_home_page.dart';
import 'package:volga_application_/widgets/stock_card/loading_indicator.dart';

import '../providers/response.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.wait([
      Provider.of<Stocks>(context, listen: false)
          .getInfo()
          .then((_) => Navigator.of(context).pushNamed('homePage'))
    ]);

    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 36, 36, 36),
        ),
        Align(
          alignment: Alignment.center,
          child: LoadingIndicator(boxWidth: 50, boxHeight: 50),
        ),
      ],
    );
  }
}
