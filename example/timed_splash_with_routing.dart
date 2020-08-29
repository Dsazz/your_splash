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
      initialRoute: Routers.SPLASH_SCREEN,
      routes: Routers.init(context),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Routers {
  static const String SPLASH_SCREEN = '/';
  static const String HOME = '/after-splash';

  static Map<String, WidgetBuilder> init(BuildContext context) {
    return {
      SPLASH_SCREEN: (context) => SplashScreen.timed(
            seconds: 5,
            navigate: HOME,
            body: DefaultBody(),
          ),
      HOME: (context) => Home(),
    };
  }
}
