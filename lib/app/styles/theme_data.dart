import 'package:flutter/material.dart' as theme_data_my_app;

class ThemeDataMyApp {
  static bool? _isDark;

  static void setIsDark(theme_data_my_app.BuildContext context) {
    _isDark = false;
  }

  static bool? get isDark => _isDark;
}
