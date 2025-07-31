import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  final EdgeInsetsGeometry? padding;

  const CustomBackButton({
    super.key,
    this.backgroundColor = lightBlackColor,
    this.iconColor = Colors.white,
    this.size = 15,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: 10.h, left: 10.w),
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
