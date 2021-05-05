import 'package:flutter/material.dart';

class ThemeColors {
  static Color darkestGrey = Color(0xff292929);

  LinearGradient blackLightGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        darkestGrey,
        Colors.black.withOpacity(0.6)
      ],
      stops: [0, 1.0]
  );
}