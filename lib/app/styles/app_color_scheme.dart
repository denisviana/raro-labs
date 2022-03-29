import 'package:flutter/material.dart';
import 'package:my_app/app/utils/style_utils.dart';

import 'app_theme_data.dart';

class AppColorScheme {
  static final ColorScheme colorSchemeLight = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: AppLightThemeColors.background,
    accentColor: AppLightThemeColors.accentColor,
    primarySwatch: AppLightThemeColors.primarySwatch,
    cardColor: AppLightThemeColors.backgroundLight,
    errorColor: error,
  );

  static final ColorScheme colorSchemeDark = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor: AppDarkThemeColors.background,
    accentColor: AppDarkThemeColors.accentColor,
    primarySwatch: AppDarkThemeColors.primarySwatch,
    cardColor: AppDarkThemeColors.backgroundLight,
    errorColor: error,
  );

  static const white = Colors.white;

  static MaterialColor get primarySwatchLight => AppLightThemeColors.primarySwatch;
  static MaterialColor get primarySwatchDark => AppDarkThemeColors.primarySwatch;

  static MaterialColor get accentColorLight => AppLightThemeColors.accentColor;
  static MaterialColor get accentColorDark => AppDarkThemeColors.accentColor;

  static Color get background => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.background
      : AppLightThemeColors.background;

  static Color get backgroundLight => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.backgroundLight
      : AppLightThemeColors.backgroundLight;

  static Color get border => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.border
      : AppLightThemeColors.border;

  static Color get emphasis => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.emphasis
      : AppLightThemeColors.emphasis;

  static Color get emphasisLight => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.emphasisLight
      : AppLightThemeColors.emphasisLight;

  static Color get primary => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.primary
      : AppLightThemeColors.primary;

  static Color get primaryLight => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.primaryLight
      : AppLightThemeColors.primaryLight;

  static Color get bodyText => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.bodyText
      : AppLightThemeColors.bodyText;

  static Color get shadow => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.shadow
      : AppLightThemeColors.shadow;

  static Color get success => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.success
      : AppLightThemeColors.success;

  static Color get successLight => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.successLight
      : AppLightThemeColors.successLight;

  static Color get error => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.error
      : AppLightThemeColors.error;

  static Color get errorLight => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.errorLight
      : AppLightThemeColors.errorLight;

  static Color get shimmerBaseColor => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.shimmerBaseColor
      : AppLightThemeColors.shimmerBaseColor;

  static Color get shimmerHighlightColor => AppThemeData.appThemeModeIsDark
      ? AppDarkThemeColors.shimmerHighlightColor
      : AppLightThemeColors.shimmerHighlightColor;

  static const lightGray = Color(0xffe4e4e4);
  static const darkPurple = Color(0xFF090B27);
}

class AppDarkThemeColors {
  static final MaterialColor primarySwatch = StyleUtils.createMaterialColor(primary);
  static final MaterialColor accentColor = StyleUtils.createMaterialColor(emphasis);

  static const background = Color(0xFF090B27);
  static const backgroundLight = Color(0xFF17173E);
  static const border = Color(0x33FFFFFF);
  static const emphasis = Color(0xFFFFFFFF);
  static const emphasisLight = Color(0x66FFFFFF);
  static const primary = Color(0xFF1E1E48);
  static const bodyText = Color(0xFFFFFFFF);
  static const primaryLight = Color(0xFF7469D9);
  static const shadow = Color(0x26000000);
  static const success = Color(0xFF74DBB5);
  static const successLight = Color(0x3374DBB5);
  static const error = Color(0xFFCF3E5A);
  static const errorLight = Color(0x33CF3E5A);
  static const shimmerBaseColor = Color(0xFF17173E);
  static const shimmerHighlightColor = Color(0xFF292954);
}

class AppLightThemeColors {
  static final MaterialColor primarySwatch = StyleUtils.createMaterialColor(primary);
  static final MaterialColor accentColor = StyleUtils.createMaterialColor(emphasis);

  static const background = Color(0xFFFBF6EF);
  static const bodyText = Color(0xFF000000);
  static const backgroundLight = Color(0xFFFBF6EF);
  static const border = Color(0x33232A65);
  static const emphasis = Color(0xFF232A65);
  static const emphasisLight = Color(0x66232A65);
  static const primary = Color(0xFFFFFFFF);
  static const primaryLight = Color(0xFF7469D9);
  static const shadow = Color(0x33232A65);
  static const success = Color(0xFF1BB58B);
  static const successLight = Color(0x3374DBB5);
  static const error = Color(0xFFCF3E5A);
  static const errorLight = Color(0x33CF3E5A);
  static const shimmerBaseColor = Color(0xFFEDE8E1);
  static const shimmerHighlightColor = Color(0xFFDBD4CA);
}
