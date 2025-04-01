import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(color: Colors.red, width: 10.0, height: 322.0),
        const Image(
          image: AssetImage('assets/logo.png'),
          width: 150,
          height: 181.22,
        ),
      ],
    );
  }
}
