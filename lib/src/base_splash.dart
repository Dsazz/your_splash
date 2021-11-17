library your_splash;

import 'package:flutter/material.dart';
import 'package:your_splash/your_splash.dart';

/// A base class for providing splash screen logic
abstract class SplashScreen extends StatefulWidget {
  /// The [route] that will be displayed after the splash screen
  /// Must either be a String or instance of [PageRoute],
  final dynamic route;

  /// The [body] of splash screen
  final Widget? body;

  /// Describes the base splash screen constructor
  SplashScreen({
    required this.route,
    required this.body,
  })  : assert(route != null),
        assert(route is String || route is PageRoute,
            "widget.route must either be a String or instance of PageRoute"),
        assert(body != null);

  /// Creates a [FuturedSplashScreen] widget
  ///
  /// {@tool snippet}
  ///
  /// This example shows a quick start example for [FuturedSplashScreen]:
  ///
  /// ```dart
  ///
  /// Future<void> loadFuture() {
  ///   return Future.delayed(Duration(seconds: 5), () => {print("LOADED!")});
  /// }
  ///
  /// class MyApp extends StatelessWidget {
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return MaterialApp(
  ///       debugShowCheckedModeBanner: false,
  ///       home: SplashScreen.futured(
  ///         future: loadFuture,
  ///         route: MaterialPageRoute(builder: (_) => YourAfterSplashScreen()),
  ///         body: Container(),
  ///       ),
  ///     );
  ///   }
  /// }
  /// {@end-tool}
  factory SplashScreen.futured({
    required FuturedSplashScreenCallback future,
    required dynamic route,
    required Widget body,
  }) =>
      FuturedSplashScreen(
        future: future,
        route: route,
        body: body,
      );

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
  ///       home: SplashScreen.timed(
  ///         seconds: 3,
  ///         route: MaterialPageRoute(builder: (_) => YourAfterSplashScreen()),
  ///         body: Container(),
  ///       ),
  ///     );
  ///   }
  /// }
  /// {@end-tool}
  factory SplashScreen.timed({
    int? seconds,
    required dynamic route,
    required Widget? body,
  }) =>
      TimedSplashScreen(
        seconds: seconds,
        route: route,
        body: body,
      );
}

abstract class SplashScreenState<Page extends SplashScreen>
    extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return widget.body ?? const SizedBox();
  }

  /// Replace the splash screen by pushing the route
  /// [route] and then disposing the splash screen once the new route has
  /// finished animating in.
  void navigateTo(route) {
    if (route is String) {
      Navigator.of(context).pushReplacementNamed(route);
    } else if (route is PageRoute) {
      Navigator.of(context).pushReplacement(route);
    } else {
      throw new ArgumentError(
        'widget.route must either be a String or instance of PageRoute',
      );
    }
  }
}
