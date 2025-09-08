// ignore_for_file: use_build_context_synchronously, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/services/auth_services.dart';
import 'package:talenty_app/locator.dart';
import 'package:talenty_app/ui/screens/permission_screens/notification_permission_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthService>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7), () {
      Get.offAll(() => NotificationPermissionScreen());
    });
  }

  Future<void> _navigateUser() async {
    // await _authService.doSetup();

    // if (_authService.isLogin) {
    //   final role = locator<LocalStorageService>().userRole;
    //   if (role == "candidate") {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (_) => CandidateRootScreen()),
    //     );
    //   } else if (role == "recruiter") {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (_) => RootScreen()),
    //     );
    //   } else {
    //     // fallback - agar role null hai
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (_) => LoginScreen(isCadidate: true)),
    //     );
    //   }
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => LoginScreen(isCadidate: true)),
    //   );
    // }
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
