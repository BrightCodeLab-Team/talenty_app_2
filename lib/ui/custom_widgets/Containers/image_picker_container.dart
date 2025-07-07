import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_style.dart';

class ImagePickerContainer extends StatelessWidget {
  const ImagePickerContainer({
    super.key,
    required this.icon,
    required this.text,
    this.image,
  });
  final String icon;
  final String text;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 142.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        border: Border.all(color: lightBlackColor),
      ),
      child:
          image == null
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(icon, width: 37.w, height: 37.h),
                  Text(text.tr, style: style14M.copyWith(color: textGreyColor)),
                ],
              )
              : Image.file(image!),
    );
  }
}
