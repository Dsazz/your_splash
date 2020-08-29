import 'dart:async';

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
      expect(() => FuturedSplashScreen(), throwsA(isAssertionError));
      expect(
        () => FuturedSplashScreen(future: loadFuture, body: body),
        throwsA(isAssertionError),
      );
      expect(
        () => FuturedSplashScreen(future: loadFuture, navigate: "route"),
        throwsA(isAssertionError),
      );
      expect(
        () => FuturedSplashScreen(future: loadFuture, body: body, navigate: 99),
        throwsA(isAssertionError),
      );
    });

    testWidgets("Try init", (WidgetTester tester) async {
      expect(() async {
        await tester.pumpWidget(SplashScreen.futured(
          future: loadFuture,
          body: body,
        ));
        await tester.pumpAndSettle(Duration(seconds: 1));
      }, throwsAssertionError);
    });

    test('success build', () {
      FuturedSplashScreen futuredSplash = FuturedSplashScreen(
        future: loadFuture,
        body: body,
        navigate: "route",
      );
      expect(
        futuredSplash.toString(),
        SplashScreen.futured(
          future: loadFuture,
          body: body,
          navigate: "route",
        ).toString(),
      );
    });
  });

  group('TimedSplashScreen', () {
    test('assert with missing and invalid args', () {
      expect(() => TimedSplashScreen(), throwsA(isAssertionError));
      expect(
        () => TimedSplashScreen(seconds: -1, body: body, navigate: "route"),
        throwsA(isAssertionError),
      );
      expect(() => TimedSplashScreen(body: body), throwsA(isAssertionError));
      expect(() => TimedSplashScreen(navigate: "route"),
          throwsA(isAssertionError));
      expect(() => SplashScreen.timed(navigate: "route"),
          throwsA(isAssertionError));
    });

    test('success build', () {
      TimedSplashScreen timedSplash = TimedSplashScreen(
        seconds: 1,
        body: body,
        navigate: "route",
      );
      expect(
        timedSplash.toString(),
        SplashScreen.timed(seconds: 1, body: body, navigate: "route")
            .toString(),
      );
    });
  });
}
