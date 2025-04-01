import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InlineTextWidget(
        'SignInPage Page',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
