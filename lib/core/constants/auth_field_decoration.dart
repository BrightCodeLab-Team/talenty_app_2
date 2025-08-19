import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

final authFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter your email',
  hintStyle: style14M.copyWith(color: borderGreyColor),

  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(color: borderGreyColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(color: darkPurpleColor, width: 1.2),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(color: borderGreyColor),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(color: Colors.red, width: 1.2),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(color: Colors.red, width: 1.5),
  ),
);
