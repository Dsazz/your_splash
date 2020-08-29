library your_splash;

import 'package:flutter/material.dart';
import 'package:your_splash/your_splash.dart';

abstract class SplashScreen extends StatefulWidget {
  final dynamic navigate;
  final Widget body;

  SplashScreen({
    @required this.navigate,
    @required this.body,
  })  : assert(navigate != null),
        assert(navigate is String || navigate is PageRoute,
            "widget.navigate must either be a String or instance of PageRoute"),
        assert(body != null);

  factory SplashScreen.futured({
    FuturedSplashScreenCallback future,
    dynamic navigate,
    Widget body,
  }) =>
      FuturedSplashScreen(
        future: future,
        navigate: navigate,
        body: body,
      );

  factory SplashScreen.timed({
    int seconds,
    dynamic navigate,
    Widget body,
  }) =>
      TimedSplashScreen(
        seconds: seconds,
        navigate: navigate,
        body: body,
      );
}

abstract class SplashScreenState<Page extends SplashScreen>
    extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return widget.body;
  }

  void navigateTo(navigate) {
    if (navigate is String) {
      Navigator.of(context).pushReplacementNamed(navigate);
    } else if (navigate is PageRoute) {
      Navigator.of(context).pushReplacement(navigate);
    } else {
      throw new ArgumentError(
        'widget.navigate must either be a String or instance of PageRoute',
      );
    }
  }
}
