import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_recruiter/register_recruiter_83_percent.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../custom_widgets/Containers/progress_container.dart';
import '../../../../custom_widgets/header/header.dart';
import '../../../../custom_widgets/paddings_and_margins/custom_padding.dart';

class RegisterRecruiter66PercentScreen extends StatelessWidget {
  const RegisterRecruiter66PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: CustomButton(
          text: 'btn_continue',
          onTap: () {
            Get.to(() => RegisterRecruiter83PercentScreen());
          },

          backgroundColor: primaryColor,
        ),
      ),

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
                  '66.67%',
                  style: style16M.copyWith(color: lightBlackColor),
                ),
              ),
              7.verticalSpace,
              ProgressContainer(
                progressWidth: MediaQuery.sizeOf(context).width * 0.66,
              ),
              20.verticalSpace,
              Container(
                margin: EdgeInsets.only(top: 20),
                color: greenColor,
                child: Image.asset(
                  AppAssets.registerRecruiterImage,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  height: 390.h,
                ),
              ),
              Text('buisness_profile'.tr, style: style24M),
              18.verticalSpace,
              Text(
                'buisness_profile_description'.tr,
                style: style14M.copyWith(color: textDarkGreyColor),
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
