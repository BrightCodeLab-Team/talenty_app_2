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
import 'image_permission_screen.dart';

class NotificationPermissionScreen extends StatelessWidget {
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
                40.verticalSpace,
                Header(hasBackButton: false),
                Text('notif_title'.tr, style: style24M),
                Text(
                  'notif_body'.tr,
                  maxLines: 3,
                  style: style14M.copyWith(color: textDarkGreyColor),
                ),
              ],
            ),
            Center(
              child: Image.asset(
                AppAssets.notificationIcon,
                width: 182,
                height: 232,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    text: 'btn_allow'.tr,
                    onTap: () {
                      Get.to(() => ImagePermissionScreen());
                    },

                    backgroundColor: primaryColor,
                  ),
                  10.verticalSpace, // add spacing between buttons if needed
                  CustomButton(
                    text: 'btn_not_now'.tr,
                    onTap: () {
                      Get.to(() => ImagePermissionScreen());
                    },

                    backgroundColor: Colors.transparent,
                    borderColor: blackColor,
                    textColor: blackColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
