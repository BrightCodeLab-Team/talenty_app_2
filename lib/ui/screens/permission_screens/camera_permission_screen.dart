import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/common/selection_screen.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_style.dart';
import '../../custom_widgets/header/header.dart';
import '../../custom_widgets/paddings_and_margins/custom_padding.dart';

class CameraPermissionScreen extends StatelessWidget {
  const CameraPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BODY
      //
      body: CustomPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                /// Header
                ///
                40.verticalSpace,
                Header(hasBackButton: false),
                Text('camera_title'.tr, style: style24M),
                10.verticalSpace,
                Text.rich(
                  TextSpan(
                    style: style14M.copyWith(color: textDarkGreyColor),
                    children: [
                      TextSpan(text: 'camera_body_part1'.tr),
                      TextSpan(
                        text: 'camera_body_mandatory'.tr,
                        style: style14M.copyWith(
                          color: brownColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: 'camera_body_part3'.tr),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: CustomPadding(
                  child: Image.asset(
                    AppAssets.cameraIcon,
                    width: 243.33,
                    height: 194.67,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                text: 'btn_allow'.tr,
                onTap: () {
                  Get.to(() => SelectionScreen());
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
