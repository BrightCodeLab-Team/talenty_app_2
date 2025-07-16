// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_16_percent/register_company_16_screen.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../custom_widgets/Containers/progress_container.dart';
import '../../../../custom_widgets/header/header.dart';
import '../../../../custom_widgets/paddings_and_margins/custom_padding.dart';

class RegisterCompany0PercentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BODY
      //
      body: SingleChildScrollView(
        child: CustomPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              45.verticalSpace,
              Header(hasBackButton: false),
              11.verticalSpace,
              Center(
                child: Text(
                  '0%',
                  style: style16M.copyWith(color: lightBlackColor),
                ),
              ),
              7.verticalSpace,
              ProgressContainer(
                progressWidth: MediaQuery.sizeOf(context).width * 0.0,
              ),
              Container(
                color: greenColor,
                child: Image.asset(
                  AppAssets.registerCompanyImage,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  height: 390,
                ),
              ),
              Text('register_company_title_process'.tr, style: style24M),
              18.verticalSpace,
              Text(
                'register_company_description_process'.tr,
                style: style14M.copyWith(color: textDarkGreyColor),
              ),
              130.verticalSpace,
            ],
          ),
        ),
      ),

      ///
      /// Floating Button
      ///
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 15),
        child: CustomButton(
          text: 'btn_continue'.tr,
          onTap: () {
            Get.to(() => RegisterCompany16PercentScreen());
          },

          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}
