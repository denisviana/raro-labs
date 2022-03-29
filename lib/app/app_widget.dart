import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:my_app/app/styles/theme_data.dart';

import '../generated/l10n.dart';
import 'app_binding.dart';
import 'app_routes.dart';
import 'styles/app_color_scheme.dart';
import 'styles/app_theme_data.dart';
import 'utils/widget_utils.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        navigatorKey: Get.key,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        builder: (context, child) {
          ThemeDataMyApp.setIsDark(context);
          return Scaffold(
            backgroundColor: AppColorScheme.background,
            body: GestureDetector(
              onTap: () => WidgetUtils.hideKeyboard(context),
              child: child,
            ),
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'My App',
        themeMode: AppThemeData.themeMode,
        theme: AppThemeData.themeDataLight,
        darkTheme: AppThemeData.themeDataDark,
        getPages: AppRoutes.routes,
        initialRoute: Routes.main,
        initialBinding: AppBinding(),
      );
}
