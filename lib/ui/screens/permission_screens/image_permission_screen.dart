// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_style.dart';
import '../../custom_widgets/header/header.dart';
import '../../custom_widgets/paddings_and_margins/custom_padding.dart';
import 'camera_permission_screen.dart';

class ImagePermissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// Start Body
      ///
      body: CustomPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.verticalSpace,
                Header(hasBackButton: false, height: 30, width: 110),
                10.verticalSpace,
                Text('image_title'.tr, style: style24M),
                10.verticalSpace,
                Text.rich(
                  TextSpan(
                    style: style14M.copyWith(color: textDarkGreyColor),
                    children: [
                      TextSpan(text: 'image_body_part1'.tr),
                      TextSpan(
                        text: 'image_body_mandatory'.tr,
                        style: style14M.copyWith(
                          color: brownColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: 'image_body_part3'.tr),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  AppAssets.imageIcon,
                  width: 270,
                  height: 270,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(
                text: 'btn_allow'.tr,
                onTap: () {
                  Get.to(() => const CameraPermissionScreen());
                },
                backgroundColor: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
