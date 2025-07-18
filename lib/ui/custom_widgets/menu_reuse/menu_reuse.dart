import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/divider.dart';

class MenuReuse extends StatelessWidget {
  final Widget leading;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;
  final TextStyle? textStyle;
  final Color? trailingIconColor; // NEW: optional color for trailing icon

  // ignore: use_key_in_widget_constructors
  const MenuReuse({
    required this.leading,
    required this.title,
    required this.onTap,
    required AnimatedContainer child,
    this.trailing,
    this.textStyle,
    this.trailingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    leading,
                    4.horizontalSpace,
                    Text(title, style: textStyle ?? style14sourceblack),
                  ],
                ),
                trailing ??
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: trailingIconColor ?? lightBlackColor,
                    ),
              ],
            ),
            10.verticalSpace,
            CustomDivider(),
          ],
        ),
      ),
    );
  }
}
