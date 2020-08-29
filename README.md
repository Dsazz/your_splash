# your_splash

This is your lightweight splash screen.

## Features
* Supports splash screen with the Future callback
* Supports splash screen with timer
* Supports iOS and Android.

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
| `navigate` | This is a dynamic argument. Can be `String` name of route or `PageRoute` instance |
| `body`     | This is a body of your splash screen |

A `TimedSplashScreen` requires next arguments:

| Parameter     | Description   |
| ------------- | ------------- |
| `seconds`  | This is a duration in seconds for how long your splash screen will be displayed |
| `navigate` | This is a dynamic argument. Can be `String` name of route or `PageRoute` instance |
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
        navigate: MaterialPageRoute(builder: (_) => Home()),
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



```dart
navigate: PageRouteBuilder(
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

You can check all examples [here](#).
