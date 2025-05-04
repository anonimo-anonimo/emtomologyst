import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

class CircleCounterDisplayWidget extends StatelessWidget {
  const CircleCounterDisplayWidget({
    required this.label,
    this.radius = 24,
    this.isLight = false,
    super.key,
  });

  final double radius;
  final String label;
  final bool isLight;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          isLight
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.primary,
      radius: radius,
      child: InlineTextWidget(
        label,
        style: TextStyle(
          color: isLight ? null : Theme.of(context).canvasColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
