// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/character_counter_row.dart';
import 'package:talenty_app/ui/custom_widgets/image_picker_model_bottom_sheet.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_16_percent/register_16_view_model.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../custom_widgets/Containers/image_picker_container.dart';
import '../../../../../custom_widgets/Containers/progress_container.dart';
import '../../../../../custom_widgets/header/header.dart';
import '../../../../../custom_widgets/paddings_and_margins/custom_padding.dart';
import '../register_33_percent/register_company_33_percent_screen.dart';

class RegisterCompany16PercentScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<Register16ViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          //
          // BODY
          //
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),

            child: CustomPadding(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      40.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            progressWidth:
                                MediaQuery.sizeOf(context).width * 0.16,
                          ),
                          30.verticalSpace,
                          Text('basic_information'.tr, style: style24M),
                          16.verticalSpace,
                          Text(
                            'buisness_description'.tr,
                            style: style16M.copyWith(color: lightBlackColor),
                          ),
                        ],
                      ),
                      18.verticalSpace,
                      Text(
                        'your_company_name'.tr,
                        style: style16B.copyWith(color: lightBlackColor),
                      ),
                      4.verticalSpace,

                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: model.titleController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'enter_company_name'.tr,
                          errorText: model.titleError,
                        ),
                        // validator: (_) => model.validateTitle(),
                      ),
                      16.verticalSpace,
                      Text(
                        'describe_the_company?'.tr,
                        style: style16B.copyWith(color: lightBlackColor),
                      ),
                      4.verticalSpace,

                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: model.descriptionController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'best_travel_experiences'.tr,
                          errorText: null, // We will show custom error below
                        ),
                        minLines: 2,
                        maxLines: 10,
                      ),
                      SizedBox(height: 4),
                      CharacterCounterRow(
                        error: model.descriptionError,
                        currentLength: model.descriptionLength,
                        maxLength: 500,
                        label: 'caracteres',
                      ),
                      16.verticalSpace,
                      Text(
                        'uplod_company_logo'.tr,
                        style: style16B.copyWith(color: lightBlackColor),
                      ),
                      3.verticalSpace,
                      GestureDetector(
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
                                (_) =>
                                    ImagePickerModalBottomSheet(islogo: true),
                          );
                        },
                        child: ImagePickerContainer(
                          icon: AppAssets.camereSmallIcon,
                          text: 'uplod_your_logo_in_png_or_jpg_format'.tr,
                          image: model.logoFile,
                        ),
                      ),
                      16.verticalSpace,
                      Text(
                        'uplod_company_cover_image'.tr,
                        style: style16B.copyWith(color: lightBlackColor),
                      ),
                      3.verticalSpace,
                      GestureDetector(
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
                                (_) =>
                                    ImagePickerModalBottomSheet(islogo: false),
                          );
                        },
                        child: ImagePickerContainer(
                          icon: AppAssets.camereSmallIcon,
                          text: 'uplod_your_logo_in_png_or_jpg_format'.tr,
                          image: model.coverFile,
                        ),
                      ),
                      15.verticalSpace,
                      RichText(
                        text: TextSpan(
                          style: style16M.copyWith(color: lightBlackColor),
                          children: [
                            TextSpan(text: 'by_continue'.tr),
                            TextSpan(
                              text: 'terms_and_condition'.tr,
                              style: style16B.copyWith(
                                color: lightBlackColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: 'talenty_as_well'.tr),
                            TextSpan(
                              text: 'privacy_policy'.tr,
                              style: style16B.copyWith(
                                color: lightBlackColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: '.'),
                          ],
                        ),
                      ),
                      150.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ),

          ///
          /// Floating Button
          ///
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: CustomButton(
              text: 'btn_continue'.tr,
              onTap: () {
                model.validateForm(); // Show errors if any

                // Check if both fields are valid
                final isTitleValid = model.validateTitle() == null;
                final isDescriptionValid = model.validateDescription() == null;

                if (isTitleValid && isDescriptionValid) {
                  Get.to(() => RegisterCompany33PercentScreen());
                }
              },
              backgroundColor: model.isFormFilled ? primaryColor : greyColor,
            ),
          ),
        );
      },
    );
  }
}
/*
 CustomButton(
              text: 'btn_continue'.tr,
              onTap: () {
                model.validateForm(); // Show errors if any

                // Check if both fields are valid
                final isTitleValid = model.validateTitle() == null;
                final isDescriptionValid = model.validateDescription() == null;

                if (isTitleValid && isDescriptionValid) {
                  Get.to(() => RegisterCompany33PercentScreen());
                }
              },
              backgroundColor: model.isFormFilled ? primaryColor : greyColor,
            ),
            */