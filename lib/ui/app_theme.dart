import 'package:flutter/material.dart';

class AppTheme {
  static const Color secondaryContainer = Color(0xFFD3E8D2);

  static ThemeData get lisghtTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        secondaryContainer: secondaryContainer,
      ),
    );
  }
}
