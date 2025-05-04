import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

class RoundedLabelWidget extends StatelessWidget {
  const RoundedLabelWidget({
    required this.title,
    required this.label,
    super.key,
  });
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 24.0,
          width: 252.0,
          child: InlineTextWidget(
            title,
            style:
                Theme.of(context).textTheme.bodyLarge ??
                const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.0),
            color: Theme.of(context).canvasColor,
          ),
          width: 328.0,
          height: 56.0,
          child: SizedBox(
            width: 288.0,
            height: 48.0,
            child: Row(
              children: <Widget>[
                const SizedBox(width: 48.0),
                InlineTextWidget(
                  label,
                  style: const TextStyle(),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
