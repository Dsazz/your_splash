# your_splash

[![pub package](https://img.shields.io/pub/v/your_splash?style=flat-square)](https://pub.dev/packages/your_splash) 
[![license](https://img.shields.io/github/license/Dsazz/your_splash?style=flat-square)](https://github.com/Dsazz/your_splash/blob/master/LICENSE)
![build](https://img.shields.io/github/workflow/status/Dsazz/your_splash/tests?style=flat-square)
[![codecov](https://img.shields.io/codecov/c/github/Dsazz/your_splash?style=flat-square)](https://codecov.io/gh/Dsazz/your_splash)
[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg?style=flat-square)](https://saythanks.io/to/dsazztazz%40gmail.com)

A Flutter implementation of splash screen. Supports Android and IOS.

## Features
  * Supports splash screen with the Future callback
  * Supports splash screen with timer

## Getting Started

To use this library, add `your_splash` as a [dependency](https://flutter.io/platform-plugins/) in your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  your_splash:
```

In your library add the following import:

```dart
import 'package:your_splash/your_splash.dart';
```

### Constructors

This package comes with 2 kinds of splash screen actions:
  * `FuturedSplashScreen` 
  * `TimedSplashScreen`

You can create a splash screen in two different ways:

  * by calling `FuturedSplashScreen` or `TimedSplashScreen` constructor and passing required arguments.
  * by calling `SplashScreen.futured` or `SplashScreen.timed` constructor respectively.

A `FuturedSplashScreen` requires next arguments:

| Parameter     | Description   |
| ------------- | ------------- |
| `future`   | This is your Future callback for delay  |
| `route`    | This is a dynamic argument. Can be `String` name of route or `PageRoute` instance |
| `body`     | This is a body of your splash screen |

A `TimedSplashScreen` requires next arguments:

| Parameter     | Description   |
| ------------- | ------------- |
| `seconds`  | This is a duration in seconds for how long your splash screen will be displayed |
| `route`    | This is a dynamic argument. Can be `String` name of route or `PageRoute` instance |
| `body`     | This is a body of your splash screen |

### Examples

Quick start example:

```dart
import 'package:flutter/material.dart';
import 'package:your_splash/your_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.timed(
        seconds: 3,
        route: MaterialPageRoute(builder: (_) => Home()),
        body: Scaffold(
          body: InkWell(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://bit.ly/3hD5Tj8'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen!"),
      ),
      body: Center(
        child: Text(
          "Welcome!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
        ),
      ),
    );
  }
}

```

How can I animate transition between the splash screen and navigation page?

![Overview](https://github.com/Dsazz/your_splash/blob/master/doc/images/splash.gif?raw=true)

```
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
```

You can see all examples [here](https://github.com/Dsazz/your_splash/tree/master/example)
