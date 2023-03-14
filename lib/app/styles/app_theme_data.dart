import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/app/styles/theme_data.dart';

import 'app_color_scheme.dart';
import 'app_font_size.dart';
import 'app_font_weight.dart';
import 'app_text_theme.dart';

/// https://medium.com/flutter-community/page-transitions-using-themedata-in-flutter-c24afadb0b5d
class AppThemeData extends ThemeDataMyApp {
  AppThemeData._();

  static bool? _appThemeModeIsDark;

  static void setIfAppThemeModeIsDark({bool? isDark}) {
    _appThemeModeIsDark = isDark;
  }

  static bool get appThemeModeIsDark => _appThemeModeIsDark ?? ThemeDataMyApp.isDark ?? true;

  static ThemeData get themeData => appThemeModeIsDark ? themeDataDark : themeDataLight;

  static ThemeMode get themeMode => ThemeDataMyApp.isDark == null
      ? ThemeMode.system
      : appThemeModeIsDark
          ? ThemeMode.dark
          : ThemeMode.light;

  static final ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: AppColorScheme.primarySwatchLight,
    textTheme: AppTextTheme.textTheme,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    tabBarTheme: TabBarTheme(
      labelColor: AppColorScheme.emphasis,
      labelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          color: AppColorScheme.emphasis,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      unselectedLabelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          color: AppColorScheme.emphasisLight,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
    ),
    scaffoldBackgroundColor: AppLightThemeColors.background,
    colorScheme: AppColorScheme.colorSchemeLight,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColorScheme.primary,
      cursorColor: AppColorScheme.primary,
      selectionHandleColor: AppColorScheme.primary,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppLightThemeColors.background,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: Brightness.light,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: TextStyle(
          color: AppColorScheme.bodyText,
          fontSize: AppFontSize.extraLarge,
          fontFamily: 'Montserrat',
        ),
        pickerTextStyle: TextStyle(
          color: AppColorScheme.bodyText,
          fontSize: AppFontSize.extraLarge,
          fontFamily: 'Montserrat',
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.bodyText,
    ),
    disabledColor: AppColorScheme.border,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: AppColorScheme.colorSchemeLight, textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: AppColorScheme.bodyText,
  );

  static final ThemeData themeDataDark = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primarySwatch: AppColorScheme.primarySwatchDark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      unselectedLabelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      labelPadding: EdgeInsets.symmetric(horizontal: 12),
    ),
    textTheme: AppTextTheme.textTheme,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: AppDarkThemeColors.background,
    colorScheme: AppColorScheme.colorSchemeDark,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColorScheme.primary,
      cursorColor: AppColorScheme.primary,
      selectionHandleColor: AppColorScheme.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppDarkThemeColors.background,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: Brightness.dark,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: TextStyle(
          color: AppColorScheme.bodyText,
          fontSize: AppFontSize.extraLarge,
          fontFamily: 'Montserrat',
        ),
        pickerTextStyle: TextStyle(
          color: AppColorScheme.bodyText,
          fontSize: AppFontSize.extraLarge,
          fontFamily: 'Montserrat',
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.bodyText,
    ),
    disabledColor: AppColorScheme.border,
    buttonTheme: ButtonThemeData(
        colorScheme: AppColorScheme.colorSchemeDark, textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: AppColorScheme.bodyText,
  );
}
