import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final bool? position; // Added position parameter

  const CustomBackButton({
    super.key,
    this.backgroundColor = lightBlackColor,
    this.iconColor = Colors.white,
    this.size = 20,
    this.padding,
    this.position, // Made optional
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ??
          EdgeInsets.only(
            top: (position == false ? 10.h : 30.h), // Conditional top padding
            left: 15.w,
          ),
      child: CircleAvatar(
        radius: size?.r,
        backgroundColor: backgroundColor,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: Get.back,
          icon: Icon(Icons.arrow_back, color: iconColor),
        ),
      ),
    );
  }
}
