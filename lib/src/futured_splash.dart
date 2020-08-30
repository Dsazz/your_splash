import 'package:flutter/material.dart';

import 'base_splash.dart';

typedef FuturedSplashScreenCallback = Future<dynamic> Function();

class FuturedSplashScreen extends SplashScreen {
  final FuturedSplashScreenCallback future;

  FuturedSplashScreen({
    @required this.future,
    @required dynamic navigate,
    @required Widget body,
  })  : assert(future != null),
        super(navigate: navigate, body: body);

  @override
  FuturedSplashScreenState createState() => FuturedSplashScreenState();
}

class FuturedSplashScreenState extends SplashScreenState<FuturedSplashScreen> {
  @override
  void initState() {
    super.initState();
    _execFuture();
  }

  void _execFuture() async {
    try {
      await widget.future();
    } catch (err) {
      print('An error occurred while executing Future: $err');
    } finally {
      navigateTo(widget.navigate);
    }
  }
}
