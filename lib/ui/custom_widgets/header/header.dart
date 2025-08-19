// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/colors.dart';

class Header extends StatelessWidget {
  Header({
    super.key,
    this.hasBackButton = true,
    this.scale,
    this.height,
    this.width,
    this.color,
  });

  final bool hasBackButton;
  double? scale;
  double? height;
  double? width;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          hasBackButton
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
      children: [
        if (hasBackButton)
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF4E4E4E),
              ),
              child: Icon(Icons.arrow_back, color: whiteColor),
            ),
          ),
        Image.asset(
          AppAssets.appLogo2,
          scale: scale ?? 4,
          height: height ?? 40.h, // default height
          width: width ?? 134.w, // default width
          color: color ?? primaryColor,
        ),
        if (hasBackButton)
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(shape: BoxShape.circle),
          ),
      ],
    );
  }
}
