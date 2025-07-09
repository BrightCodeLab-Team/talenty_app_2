// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

class CustomDropDownTextField extends StatelessWidget {
  CustomDropDownTextField({
    required this.hasDroppedDown,
    required this.onTap,
    required this.text,
    this.borderColor,
  });
  final bool hasDroppedDown;
  final Color? borderColor;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color:
                text == ''
                    ? hasDroppedDown
                        ? lightBlackColor
                        : borderColor ?? borderGreyColor
                    : lightBlackColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                text == '' ? 'select_option'.tr : text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: style14M.copyWith(
                  color:
                      text == ''
                          ? hasDroppedDown
                              ? lightBlackColor
                              : borderGreyColor
                          : lightBlackColor,
                ),
              ),
            ),
            Image.asset(
              hasDroppedDown ? AppAssets.arrowUp : AppAssets.arrowDown,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
