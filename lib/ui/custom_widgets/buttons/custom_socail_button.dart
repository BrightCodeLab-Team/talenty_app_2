import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.radius,
    this.iconSize,
    this.spacing,
  });

  final String text;
  final Widget icon;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? radius;
  final double? iconSize;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 54,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor ?? greyColor,
          borderRadius: BorderRadius.circular(radius ?? 10),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: spacing ?? 10),
            Text(
              text,
              style: style16M.copyWith(color: textColor ?? whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
