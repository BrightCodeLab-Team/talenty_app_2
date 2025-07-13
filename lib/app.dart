// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:talenty_app/core/services/localization_services.dart';
import 'package:talenty_app/ui/screens/candidate/candidat_root/candidate_root_screen.dart';
import 'package:talenty_app/ui/screens/candidate/mas/availability_screen_3/availability_screen_3.dart';
import 'package:talenty_app/ui/screens/candidate/mas/bloack_companies/block_companies_screen.dart';
import 'package:talenty_app/ui/screens/candidate/mas/main_menu_screen/candidate_mas_screen.dart';
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

    return DevicePreview(
      enabled: true, // Ensure this is true to enable DevicePreview
      builder:
          (context) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: title,
            translations: LocalizationService(),
            // locale: DevicePreview.locale(context),
            locale: Locale('en'),
            builder: DevicePreview.appBuilder,
            defaultTransition: Transition.rightToLeft,
            themeMode:
                languageProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: ScreenUtilInit(
              designSize: const Size(
                _designWidth,
                _designHeight,
              ), // Use your constants

              builder: (context, child) => CandidateRootScreen(),
            ),
          ),
    );
  }
}
