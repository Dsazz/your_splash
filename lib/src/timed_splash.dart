import 'dart:async';

import 'package:flutter/material.dart';

import 'base_splash.dart';

/// A class for providing splash screen based on Timer delaying
class TimedSplashScreen extends SplashScreen {
  /// This is a duration in [seconds] for how long your splash screen will be displayed
  final int? seconds;

  /// Creates a [TimedSplashScreen] widget
  ///
  /// {@tool snippet}
  ///
  /// This example shows a quick start example for [TimedSplashScreen]:
  ///
  /// ```dart
  /// class MyApp extends StatelessWidget {
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return MaterialApp(
  ///       debugShowCheckedModeBanner: false,
  ///       home: TimedSplashScreen(
  ///         seconds: 3,
  ///         route: MaterialPageRoute(builder: (_) => YourAfterSplashScreen()),
  ///         body: Container(),
  ///       ),
  ///     );
  ///   }
  /// }
  /// {@end-tool}
  TimedSplashScreen({
    required this.seconds,
    required Widget? body,
    required dynamic route,
  })  : assert(seconds is int && seconds > 0),
        super(route: route, body: body);

  @override
  _TimedSplashScreenState createState() => _TimedSplashScreenState();
}

/// State of [TimedSplashScreen]
class _TimedSplashScreenState extends SplashScreenState<TimedSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: widget.seconds!), () => navigateTo(widget.route));
  }
}
