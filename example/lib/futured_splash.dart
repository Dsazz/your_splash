import 'dart:async';

import 'package:flutter/material.dart';
import 'package:your_splash/your_splash.dart';

import '_default_body.dart';
import '_home.dart';

void main() {
  runApp(MyApp());
}

Future<void> loadFuture() {
  return Future.delayed(Duration(seconds: 5), () => {print("LOADED!")});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.futured(
        future: loadFuture,
        route: MaterialPageRoute(builder: (_) => Home()),
        body: DefaultBody(),
      ),
    );
  }
}
