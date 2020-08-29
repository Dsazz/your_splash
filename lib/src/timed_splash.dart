import 'dart:async';

import 'package:flutter/material.dart';

import 'base_splash.dart';

class TimedSplashScreen extends SplashScreen {
  final int seconds;
  TimedSplashScreen({
    @required this.seconds,
    Widget body,
    dynamic navigate,
  })  : assert(seconds is int && seconds > 0),
        super(navigate: navigate, body: body);

  @override
  _TimedSplashScreenState createState() => _TimedSplashScreenState();
}

class _TimedSplashScreenState extends SplashScreenState<TimedSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: widget.seconds), () => navigateTo(widget.navigate));
  }
}
