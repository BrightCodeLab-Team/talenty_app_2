// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/screens/company/onboarding_screen/onboarding_screen.dart';
import 'package:talenty_app/ui/screens/company/onboarding_screen/onboarding_view_model.dart';
import '../translation/translation_screen.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TranslationScreen());
        },
        child: Icon(Icons.translate),
      ),

      ///
      /// Start Body
      ///
      body: Consumer<OnBoardingViewModel>(
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    40.verticalSpace,
                    _header(),
                    20.verticalSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('choose_one'.tr, style: style24M),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              model.selectRole(UserRole.candidate);
                              Get.to(() => OnboardingScreen());
                            },
                            child: Container(
                              height: 146.h,
                              width: 146.w,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: darkPurpleColor,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(AppAssets.student, scale: 3),
                                  20.verticalSpace,
                                  Text(
                                    'i_am_candidate'.tr,
                                    style: style14M,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              model.selectRole(UserRole.recruiter);
                              Get.to(() => OnboardingScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 146.h,
                              width: 146.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: darkPurpleColor,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(AppAssets.comapnay, scale: 3),
                                  20.verticalSpace,
                                  Text(
                                    'i_am_company_or_recruiter'.tr,
                                    style: style14M,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    70.verticalSpace,
                    Center(
                      child: Image.asset(
                        AppAssets.selectionScreenGif,
                        scale: 3.5,
                        // width: 400,
                        // height: 500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _header() {
  return Column(
    children: [
      Image.asset('assets/static_assets/talenty_logo.png', scale: 3.5),

      const SizedBox(height: 10),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'header_part1'.tr,
              style: style16B.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: 'header_part2'.tr,
              style: style16B.copyWith(
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            TextSpan(
              text: 'header_part3'.tr,
              style: style16B.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: 'header_part4'.tr,
              style: style16B.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: 'header_part5'.tr,
              style: style16B.copyWith(
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
