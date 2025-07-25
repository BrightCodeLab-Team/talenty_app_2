import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
///
///

///
///. custom ability widget
///
class ShadowTagItem {
  final String text;

  ShadowTagItem(this.text);
}

// 2. Create the custom widget
class CustomShadowIconTextTag extends StatelessWidget {
  final ShadowTagItem item;
  bool? isShowAddIcon = true;
  CustomShadowIconTextTag({Key? key, required this.item, this.isShowAddIcon})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.2),
              offset: Offset(0.w, 2.w),
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],

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
            SizedBox(width: 2.w),
            isShowAddIcon == true
                ? Icon(Icons.add, color: textGreyColor)
                : Text(''),
          ],
        ),
      ),
    );
  }
}
