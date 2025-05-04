import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

class CounterDisplayWidget extends StatelessWidget {
  const CounterDisplayWidget({
    required this.label,
    this.size = const Size(96.0, 80.0),
    super.key,
  });

  final Size size;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: InlineTextWidget(label, style: const TextStyle(fontSize: 64.0)),
    );
  }
}
