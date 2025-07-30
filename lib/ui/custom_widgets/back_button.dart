import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:talenty_app/core/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: CircleAvatar(
        radius: 17.r,
        backgroundColor: lightBlackColor,
        child: IconButton(
          onPressed: () {
            navigator!.pop();
          },
          icon: Icon(Icons.arrow_back, color: whiteColor),
        ),
      ),
    );
  }
}
