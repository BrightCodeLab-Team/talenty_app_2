// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/ui/screens/common/splash2_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2940), () {
      Get.offAll(() => Splash2Screen());
    });

    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox.expand(
        child: Image.asset(
          'assets/gif/Part 1.gif',
          // fit: BoxFit.contain, // Ya try BoxFit.fill agar aspect issue ho
        ),
      ),
    );
  }
}
