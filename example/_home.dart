import 'package:flutter/material.dart';

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
