import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_splash/your_splash.dart';

void main() {
  Future<void> loadFuture() {
    return Future.delayed(Duration(seconds: 1), () => {});
  }

  final body = const SizedBox();

  group('FuturedSplashScreen', () {
    test('assert with missing and invalid args', () {
      expect(
        () => FuturedSplashScreen(future: loadFuture, route: null, body: body),
        throwsA(isAssertionError),
      );
      expect(
        () =>
            FuturedSplashScreen(future: loadFuture, route: "route", body: null),
        throwsA(isAssertionError),
      );
      expect(
        () => FuturedSplashScreen(future: loadFuture, body: body, route: 99),
        throwsA(isAssertionError),
      );
    });

    testWidgets("Try init", (WidgetTester tester) async {
      expect(() async {
        await tester.pumpWidget(SplashScreen.futured(
          future: loadFuture,
          route: null,
          body: body,
        ));
        await tester.pumpAndSettle(Duration(seconds: 1));
      }, throwsAssertionError);
    });

    test('success build', () {
      FuturedSplashScreen futuredSplash = FuturedSplashScreen(
        future: loadFuture,
        body: body,
        route: "route",
      );
      expect(
        futuredSplash.toString(),
        SplashScreen.futured(
          future: loadFuture,
          body: body,
          route: "route",
        ).toString(),
      );
    });
  });

  group('TimedSplashScreen', () {
    test('assert with missing and invalid args', () {
      expect(
        () => TimedSplashScreen(seconds: -1, body: body, route: "route"),
        throwsA(isAssertionError),
      );
      expect(
          () => TimedSplashScreen(
                seconds: 1,
                body: body,
                route: null,
              ),
          throwsA(isAssertionError));
      expect(() => TimedSplashScreen(seconds: 1, body: null, route: "route"),
          throwsA(isAssertionError));
      expect(
          () => SplashScreen.timed(seconds: null, body: null, route: "route"),
          throwsA(isAssertionError));
    });

    test('success build', () {
      TimedSplashScreen timedSplash = TimedSplashScreen(
        seconds: 1,
        body: body,
        route: "route",
      );
      expect(
        timedSplash.toString(),
        SplashScreen.timed(seconds: 1, body: body, route: "route").toString(),
      );
    });
  });
}
