import 'package:flutter/material.dart';

class AppColors {
  static const Color primary        = Color(0xFF4F46E5);
  static const Color primaryLight   = Color(0xFF818CF8);
  static const Color accent         = Color(0xFFF59E0B);
  static const Color background     = Color(0xFFF8F7FF);
  static const Color surface        = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF1F0FF);
  static const Color textPrimary    = Color(0xFF1E1B4B);
  static const Color textSecondary  = Color(0xFF6B7280);
  static const Color success        = Color(0xFF10B981);
  static const Color error          = Color(0xFFEF4444);

  static const List<Color> gradient = [Color(0xFF4F46E5), Color(0xFF7C3AED)];

  // legacy aliases so existing code doesn't break
  static const Color onPrimary    = Colors.white;
  static const Color onSecondary  = Colors.black;
  static const Color onBackground = Colors.black;
  static const Color onSurface    = Colors.black;
  static const Color onError      = Colors.white;
}
