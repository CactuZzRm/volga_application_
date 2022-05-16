import 'package:flutter/material.dart';
import 'pages/my_home_page.dart';
import 'pages/splash_page.dart';
import 'providers/response.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Stocks()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        //themeMode: ThemeMode.system,
        //theme: MyThemes.lightTheme,
        home: SplashScreen(),
        routes: {
          'homePage': (context) {return MyHomePage();}
        },
      ),
    );
  }
}

