// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/image_picker_model_bottom_sheet.dart';
import 'package:talenty_app/ui/custom_widgets/loader/wobble_loaders.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_16_percent/register_16_view_model.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_recruiter/register_recruiter_view_model.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../custom_widgets/Containers/progress_container.dart';
import '../../../../custom_widgets/header/header.dart';
import '../../../../custom_widgets/paddings_and_margins/custom_padding.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({
    super.key,
    required this.isLogo,
    this.isProfilePic = false,
  });
  final bool isLogo;
  final bool isProfilePic;

  @override
  Widget build(BuildContext context) {
    return Consumer2<Register16ViewModel, RegisterRecruiterViewModel>(
      builder: (context, model, model2, child) {
        return Scaffold(
          //
          // Body
          //
          body: SingleChildScrollView(
            child: Stack(
              children: [
                CustomPadding(
                  child: Column(
                    children: [
                      45.verticalSpace,
                      Header(),
                      11.verticalSpace,
                      Center(
                        child: Text(
                          '16.67%',
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ),
                      7.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.sizeOf(context).width * 0.25,
                      ),
                      30.verticalSpace,
                      Text('Información Básica', style: style24M),
                      16.verticalSpace,
                      Text(
                        'Completa los datos básicos para comenzar a crear la cuenta de la empresa.',
                        style: style16M.copyWith(color: lightBlackColor),
                      ),
                      40.verticalSpace,
                      SizedBox(
                        height: 300.h,
                        width: 1.sw,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),

                            child:
                                isProfilePic
                                    ? model2.profilePic != null
                                        ? Image.file(
                                          model2.profilePic!,
                                          // fit: BoxFit.cover,
                                        )
                                        : Text(
                                          'Could Not Display Image.',
                                          style: style20B,
                                        )
                                    : isLogo
                                    ? model.logoFile != null
                                        ? Image.file(
                                          model.logoFile!,
                                          // fit: BoxFit.cover,
                                        )
                                        : Text(
                                          'Could Not Display Image.',
                                          style: style20B,
                                        )
                                    : model.coverFile != null
                                    ? Image.file(
                                      model.coverFile!,
                                      // fit: BoxFit.cover,
                                    )
                                    : Text(
                                      'Could Not Display Image.',
                                      style: style20B,
                                    ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      CustomButton(
                        text: 'Confirmar',
                        onTap: () {
                          Get.back();
                        },
                        width: 312.w,
                        backgroundColor: primaryColor,
                      ),
                      24.verticalSpace,
                      CustomButton(
                        text: 'Cambiar foto',
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
                                  isProfilePic: isProfilePic,
                                  islogo: isLogo,
                                ),
                          );
                        },
                        width: 312.w,
                        backgroundColor: Colors.transparent,
                        borderColor: blackColor,
                        textColor: blackColor,
                      ),
                      46.verticalSpace,
                    ],
                  ),
                ),
                if (model.isLoading)
                  Positioned.fill(
                    child: Container(
                      color: blackColor.withOpacity(0.5),
                      child: Center(
                        child: Container(
                          width: 145.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: skinColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WobbleLoader(
                                child: Image.asset(
                                  AppAssets.loaderIcon,
                                  width: 42.w,
                                  height: 42.h,
                                ),
                              ),
                              5.horizontalSpace,
                              Text(
                                'Cargando',
                                style: style16B.copyWith(
                                  color: lightBlackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
