import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.verticalPadding,
    this.horizontalPadding,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.radius,
    this.image,
    this.isLoading = false, // 👈 New parameter
  });

  final String text;
  final double? width;
  final double? height;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? radius;
  final VoidCallback? onTap;
  final Widget? image;
  final bool isLoading; // 👈 New parameter

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        width: width ?? double.infinity,
        height: height ?? 54,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 19,
          vertical: verticalPadding ?? 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: backgroundColor ?? greyColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: Center(
          child:
              isLoading
                  ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      color: textColor ?? whiteColor,
                      strokeWidth: 2.5,
                    ),
                  )
                  : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (image != null) ...[image!, 5.horizontalSpace],
                      Text(
                        text.tr,
                        style: style16M.copyWith(
                          color: textColor ?? whiteColor,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
