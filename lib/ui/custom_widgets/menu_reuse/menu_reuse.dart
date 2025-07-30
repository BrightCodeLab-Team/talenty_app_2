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
  final Color? trailingIconColor;

  const MenuReuse({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
    this.trailing,
    this.textStyle,
    this.trailingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: leading,
          title: Text(
            title,
            style: textStyle ?? style14sourceblack.copyWith(fontSize: 16),
          ),
          trailing:
              trailing ??
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: trailingIconColor ?? lightBlackColor,
              ),
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 2.0.w,
          ), // Apply horizontal padding
        ),

        CustomDivider(),
      ],
    );
  }
}
