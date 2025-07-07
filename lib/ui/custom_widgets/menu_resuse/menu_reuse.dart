import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

class MenuReuse extends StatelessWidget {
  final Widget leading;
  final String title;
  final VoidCallback onTap;
  // ignore: use_key_in_widget_constructors
  const MenuReuse({
    required this.leading,
    required this.title,
    required this.onTap,
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
                    5.horizontalSpace,
                    Text(title, style: style14sourceblack),
                  ],
                ),

                Icon(Icons.arrow_forward_ios, size: 20, color: lightBlackColor),
              ],
            ),
            10.verticalSpace,
            horizontaldiDivider(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

Widget horizontaldiDivider() {
  return Divider(color: dividerColor);
}
