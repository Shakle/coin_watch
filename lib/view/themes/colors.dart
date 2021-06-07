import 'package:flutter/material.dart';

/// Colors and Gradients to use in the app.
class ThemeColors {
  /// Darkest grey [Color].
  static Color darkestGrey = Color(0xff292929);

  /// Black light [Gradient].
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