// ignore_for_file: use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/services/localization_services.dart';
import 'package:talenty_app/ui/screens/common/splash_screen.dart';
import 'package:talenty_app/ui/screens/theme/app_theme.dart';
import 'package:talenty_app/ui/screens/theme/lang_theme_provider.dart';

class MyApp extends StatelessWidget {
  final String title;
  static const double _designWidth = 375;
  static const double _designHeight = 812;
  const MyApp({required this.title, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanThemeProvider>(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      translations: LocalizationService(),
      locale: Locale('es'),
      defaultTransition: Transition.rightToLeft,
      themeMode: languageProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: transparent,
          surfaceTintColor: transparent,
          shadowColor: transparent,
        ),
        scaffoldBackgroundColor: whiteColor,
      ),
      darkTheme: AppTheme.darkTheme,
      home: ScreenUtilInit(
        designSize: const Size(
          _designWidth,
          _designHeight,
        ), // Use your constants
        builder: (context, child) => SplashScreen(),
      ),
    );
  }
}
