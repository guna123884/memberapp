// lib/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Base Colors (from your SCSS)
  static const Color blue = Color(0xFF0ab39c);
  static const Color indigo = Color(0xFF405189);
  static const Color purple = Color(0xFF6559cc);
  static const Color pink = Color(0xFFf672a7);
  static const Color red = Color(0xFFf06548);
  static const Color orange = Color(0xFFf1963b);
  static const Color yellow = Color(0xFFffc84b);
  static const Color green = Color(0xFF67b173);
  static const Color teal = Color(0xFF02a8b5);
  static const Color cyan = Color(0xFF299cdb);
  static const Color lightYellow = Color(0xFFa4ca6c);
  static const Color color1 = Color(0xFFeb340e);
  static const Color color2 = Color(0xFFffa500);
  static const Color color4 = Color(0xFF67b173);

  // Theme Colors (mapped from your SCSS theme colors)
  static const Color primary = blue; // $primary: $blue
  static const Color secondary = indigo; // $secondary: $indigo
  static const Color success = green; // $success: $green
  static const Color info = cyan; // $info: $cyan
  static const Color warning = yellow; // $warning: $yellow
  static const Color danger = red; // $danger: $red
  static const Color light = Color(0xFFf8f9fa); // $light: $gray-100
  static const Color dark = Color(0xFF495057); // $dark: $gray-700

  // Additional grays for consistency
  static const Color gray600 = Color(0xFF6c757d);
  static const Color gray100 = Color(0xFFf8f9fa);
  static const Color gray700 = Color(0xFF495057);
  static const Color gray800 = Color(0xFF343a40);

  // Background colors
  static const Color background = gray100;
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFf5f5f5);
}

// Extension for easy access to custom colors
extension CustomColors on ColorScheme {
  Color get success => AppColors.success;
  Color get warning => AppColors.warning;
  Color get danger => AppColors.danger;
  Color get info => AppColors.info;
  Color get lightYellow => AppColors.lightYellow;
  Color get orangeColor => AppColors.orange;
  Color get color1 => AppColors.color1;
  Color get color2 => AppColors.color2;
  Color get color4 => AppColors.color4;
  Color get teal => AppColors.teal;
  Color get gray600 => AppColors.gray600;
}
