import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InlineTextWidget(
        'Home Page',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
