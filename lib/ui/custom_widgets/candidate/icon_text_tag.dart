// ignore_for_file: use_super_parameters, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

///
///. custom ability widget
///
class TagItem {
  final String text;

  TagItem(this.text);
}

// 2. Create the custom widget
class CustomIconTextTag extends StatelessWidget {
  final TagItem item;

  const CustomIconTextTag({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 150.w, // 💡 Limit the width per tag
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: greyColor),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(item.icon, size: 16, color: Colors.grey[700]),
            SizedBox(width: 4.w),
            Flexible(
              child: Text(
                item.text,
                style: style16M.copyWith(color: textGreyColor),
                overflow: TextOverflow.ellipsis, // prevent overflow
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
///. custom ability widget
///
class ShadowTagItem {
  final String text;
  final String category; // 'humana' or 'tecnica'

  ShadowTagItem(this.text, this.category);
}

// 2. Create the custom widget
class CustomShadowIconTextTag extends StatelessWidget {
  final ShadowTagItem item;
  final bool isSelected;
  final bool isShowAddIcon;
  final VoidCallback? onTap;

  const CustomShadowIconTextTag({
    Key? key,
    required this.item,
    this.isSelected = false,
    this.isShowAddIcon = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: isSelected ? lightbrownColor : whiteColor,
            border: Border.all(
              color: isSelected ? primaryColor : Colors.transparent,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: darkPurpleColor.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 4.w),
              Flexible(
                child: Text(
                  item.text,
                  style: style16M.copyWith(
                    color: isSelected ? darkPurpleColor : textGreyColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              const SizedBox(width: 10),
              isShowAddIcon
                  ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(AppAssets.closeIcon, scale: 3),
                  )
                  : Icon(Icons.add, color: textGreyColor),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. Create the custom widget

class CustomShadowIconTextTagWithoutIcon extends StatelessWidget {
  final ShadowTagItem item;
  final bool isSelected;
  final bool isShowAddIcon;
  final VoidCallback? onTap;

  CustomShadowIconTextTagWithoutIcon({
    required this.item,
    this.isSelected = false,
    this.isShowAddIcon = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: isSelected ? lightbrownColor : whiteColor,
            border: Border.all(
              color: isSelected ? primaryColor : Colors.transparent,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: darkPurpleColor.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 4.w),
              Flexible(
                child: Text(
                  item.text,
                  style: style16M.copyWith(
                    color: isSelected ? darkPurpleColor : textGreyColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
