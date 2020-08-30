import 'package:flutter/material.dart';

class DefaultBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
