import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      Get.offAll(() => NotificationPermissionScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset('assets/gif/salida1.gif', fit: BoxFit.cover),
      ),
    );
  }
}
