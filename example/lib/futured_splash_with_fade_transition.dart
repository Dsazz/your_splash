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
        route: PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Home(),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (_, animation, secAnim, child) {
            var tween = Tween(begin: 0.0, end: 1.0).chain(
              CurveTween(curve: Curves.easeInOutCirc),
            );
            return FadeTransition(
                opacity: animation.drive(tween), child: child);
          },
        ),
        body: DefaultBody(),
      ),
    );
  }
}
