import 'package:desenvolvimento_mobile/Pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.pink[400],
          primaryColorDark: Colors.pink[900],
          accentColor: Colors.green[500]),
      home: SplashPage(),
    );
  }
}
