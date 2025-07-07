// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/header/header.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_company_0_percent_screen.dart';

import '../../../../custom_widgets/paddings_and_margins/custom_padding.dart';
import 'otp_view_model.dart';

class OtpScreen extends StatelessWidget {
  final String email;
  final String _timer = "01:00";

  OtpScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpViewModel(),
      child: Consumer<OtpViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                onTap: () {
                  if (model.validateOtp()) {
                    Get.to(() => RegisterCompany0PercentScreen());
                  }
                },
                text: 'btn_continue'.tr,
                backgroundColor: model.isComplete ? primaryColor : greyColor,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
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
                    25.verticalSpace,
                    Text('otp_verify_title'.tr, style: style24M),
                    20.verticalSpace,

                    // Text(
                    //   'otp_instruction'.tr,
                    //   maxLines: 3,
                    //   style: style14M.copyWith(color: textDarkGreyColor),
                    // ),
                    RichText(
                      text: TextSpan(
                        style: style14M.copyWith(color: textDarkGreyColor),
                        children: [
                          TextSpan(text: 'otp_instruction'.tr),
                          TextSpan(text: " $email" ?? ''),
                        ],
                      ),
                      maxLines: 3,
                    ),
                    20.verticalSpace,
                    OtpTextField(
                      numberOfFields: 6,
                      showFieldAsBox: true,
                      focusedBorderColor:
                          model.hasError ? primaryColor : lightBlackColor,
                      enabledBorderColor:
                          model.hasError ? primaryColor : lightBlackColor,
                      cursorColor: blackColor,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      borderRadius: BorderRadius.circular(8.r),
                      onSubmit: (value) {
                        model.updateOtp(value);
                      },
                    ),

                    if (model.otpError != null && model.otpError!.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          model.otpError ?? "",
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'otp_resend_timer'.tr,
                          style: style14M.copyWith(color: textDarkGreyColor),
                        ),

                        Text(
                          model.timerText,
                          style: style14M.copyWith(color: textDarkGreyColor),
                        ),
                      ],
                    ),
                    if (model.canResend) ...[
                      10.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          model.resendOtp();
                        },
                        child: Text(
                          'Resend OTP',
                          style: style14M.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
