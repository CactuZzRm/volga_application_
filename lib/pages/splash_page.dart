import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volga_application_/pages/my_home_page.dart';

import '../providers/response.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.wait([
      // Provider.of<Stocks>(context, listen: false).getInfo().then(
      //   (_) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()))),
      Provider.of<Stocks>(context, listen: false)
          .getInfo()
          .then((_) => Navigator.of(context).pushNamed('homePage'))
    ]);

    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 36, 36, 36),
        ),
        const Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(70, 255, 255, 255),
              color: Color.fromARGB(255, 255, 255, 255),
              strokeWidth: 5,
            ),
          ),
        ),
      ],
    );
  }
}
