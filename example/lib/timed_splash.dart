import 'package:flutter/material.dart';
import 'package:your_splash/your_splash.dart';

import '_default_body.dart';
import '_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.timed(
        seconds: 3,
        route: MaterialPageRoute(builder: (_) => Home()),
        body: DefaultBody(),
      ),
    );
  }
}
