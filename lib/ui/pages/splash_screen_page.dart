import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(height: 322.0),
        Image(image: AssetImage('assets/logo.png'), width: 150, height: 181.22),
      ],
    );
  }
}
