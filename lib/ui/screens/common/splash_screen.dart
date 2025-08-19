// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/ui/screens/permission_screens/notification_permission_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 7), () {
      Get.offAll(
        () => NotificationPermissionScreen(),
        transition: Transition.noTransition,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset('$gifAssets/splashh.gif', fit: BoxFit.cover),
      ),
    );
  }
}
