// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/app.dart';
import 'package:talenty_app/core/enums/env.dart';
import 'package:talenty_app/core/others/logger_customization/custom_logger.dart';
import 'package:talenty_app/core/constants/provider.dart';
import 'package:talenty_app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final log = CustomLogger(className: 'main');
  try {
    log.i('Testing info logs');
    log.d('Testing debug logs');
    log.e('Testing error logs');
    log.wtf('Testing WTF logs');
    WidgetsFlutterBinding.ensureInitialized();

    await setupLocator(Env.dev);

    runApp(
      MultiProvider(
        providers: providerPath,
        child: MyApp(title: 'Talenty'),
        // child: DevicePreview(
        //   enabled: !kReleaseMode,
        //   builder: (context) => MyApp(title: 'Talenty'),
        // ),
      ),
    );
  } catch (e) {
    log.e("Error in main(): $e");
  }
}
