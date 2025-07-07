// // ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:talenty_app/ui/screens/selection_screen.dart';

// class Splash2Screen extends StatefulWidget {
//   @override
//   _Splash2ScreenState createState() => _Splash2ScreenState();
// }

// class _Splash2ScreenState extends State<Splash2Screen>
//     with TickerProviderStateMixin {
//   late AnimationController _logoController;
//   late Animation<Offset> _logoOffsetAnimation;

//   late AnimationController _textController;

//   // You’ll show parts of the sentence one by one
//   int _visibleParts = 0;
//   final List<InlineSpan> _textParts = [
//     TextSpan(text: 'La ', style: TextStyle(color: pinkColor, fontSize: 16)),
//     TextSpan(
//       text: '1.ª APP ',
//       style: TextStyle(
//         color: Colors.red,
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     TextSpan(
//       text: 'laboral ',
//       style: TextStyle(color: pinkColor, fontSize: 16),
//     ),
//     TextSpan(
//       text: 'creada para ',
//       style: TextStyle(color: pinkColor, fontSize: 16),
//     ),
//     TextSpan(
//       text: 'jóvenes',
//       style: TextStyle(
//         color: Colors.red,
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();

//     // Logo slide-in from left
//     _logoController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1500),
//     );
//     _logoOffsetAnimation = Tween<Offset>(
//       begin: Offset(-2.0, 0.0), // Offscreen left
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

//     _logoController.forward();

//     // Text animation after delay
//     _textController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3),
//     );

//     _startTextAnimation();
//     Timer(Duration(milliseconds: 400 * _textParts.length), () {
//       Get.offAll(() => SelectionScreen());
//     });
//   }

//   Future<void> _startTextAnimation() async {
//     for (int i = 1; i <= _textParts.length; i++) {
//       await Future.delayed(Duration(milliseconds: 400));
//       setState(() {
//         _visibleParts = i;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _logoController.dispose();
//     _textController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF4EFE3),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SlideTransition(
//               position: _logoOffsetAnimation,
//               child: Image.asset(
//                 'assets/static_assets/talenty_logo.png',
//                 scale: 3,
//               ),
//             ),
//             const SizedBox(height: 10),
//             RichText(
//               text: TextSpan(children: _textParts.sublist(0, _visibleParts)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/ui/screens/permission_screens/notification_permission_screen.dart';

class Splash2Screen extends StatelessWidget {
  const Splash2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2940), () {
      Get.offAll(() => NotificationPermissionScreen());
    });

    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(child: Image.asset('assets/gif/Part 2.gif')),
    );
  }
}
