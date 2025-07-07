import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/image_picker_model_bottom_sheet.dart';
import 'package:talenty_app/ui/screens/company/root/root_screen.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../custom_widgets/Containers/progress_container.dart';
import '../../../../custom_widgets/header/header.dart';
import '../../../../custom_widgets/paddings_and_margins/custom_padding.dart';

import 'register_recruiter_view_model.dart';

class RegisterRecruiter100PercentScreen extends StatelessWidget {
  const RegisterRecruiter100PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterRecruiterViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          //
          // Floating Button
          //
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
              text: 'btn_continue'.tr,
              onTap: () {
                Get.offAll(() => RootScreen());
              },

              backgroundColor: primaryColor,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          //
          // BODY
          //
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),

            child: CustomPadding(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    40.verticalSpace,

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(),
                        11.verticalSpace,
                        Center(
                          child: Text(
                            '100%',
                            style: style16M.copyWith(color: lightBlackColor),
                          ),
                        ),
                        7.verticalSpace,
                        ProgressContainer(progressWidth: double.infinity),
                        30.verticalSpace,
                        Text('Photo_for_your_profile'.tr, style: style24M),
                        16.verticalSpace,
                        Text(
                          'upload_photo_complete_your_profile'.tr,
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ],
                    ),
                    40.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24.r),
                              ),
                            ),
                            builder:
                                (_) => ImagePickerModalBottomSheet(
                                  islogo: true,
                                  isProfilePic: true,
                                ),
                          );
                        },
                        child: Container(
                          width: 300.w,
                          height: 300.h,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            border: Border.all(color: lightBlackColor),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child:
                              model.profilePic != null
                                  ? Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: Image.file(model.profilePic!),
                                    ),
                                  )
                                  : Image.asset(
                                    AppAssets.camereSmallIcon,
                                    width: 117.w,
                                    height: 106.h,
                                  ),
                        ),
                      ),
                    ),
                    100.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
