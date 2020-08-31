import 'package:flutter/material.dart';

import 'base_splash.dart';

/// This is your Future callback for delay
typedef FuturedSplashScreenCallback = Future<dynamic> Function();

/// A class for providing splash screen based on [FuturedSplashScreenCallback] delaying
class FuturedSplashScreen extends SplashScreen {
  final FuturedSplashScreenCallback future;

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
  ///       home: FuturedSplashScreen(
  ///         future: loadFuture,
  ///         route: MaterialPageRoute(builder: (_) => YourAfterSplashScreen()),
  ///         body: Container(),
  ///       ),
  ///     );
  ///   }
  /// }
  /// {@end-tool}
  FuturedSplashScreen({
    @required this.future,
    @required dynamic route,
    @required Widget body,
  })  : assert(future != null),
        super(route: route, body: body);

  @override
  FuturedSplashScreenState createState() => FuturedSplashScreenState();
}

/// State of [FuturedSplashScreen]
class FuturedSplashScreenState extends SplashScreenState<FuturedSplashScreen> {
  @override
  void initState() {
    super.initState();
    _execFuture();
  }

  /// Executes [FutureSplashScreenCallback] before navigation to [route]
  void _execFuture() async {
    try {
      await widget.future();
    } catch (err) {
      print('An error occurred while executing Future: $err');
    } finally {
      navigateTo(widget.route);
    }
  }
}
