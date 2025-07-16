// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/Containers/progress_container.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/header/header.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_recruiter/register_recruiter_100_percent.dart';
import '../../../../custom_widgets/paddings_and_margins/custom_padding.dart';
import 'register_recruiter_view_model.dart';

class RegisterRecruiter83PercentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterRecruiterViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          //
          // Floating Button
          //
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: CustomButton(
              horizontalPadding: 20,
              text: 'btn_continue'.tr,

              onTap: () {
                model.validateRecruiter83Form();

                if (model.isRecruiter83FormValid) {
                  Get.to(() => RegisterRecruiter100PercentScreen());
                }
              },

              backgroundColor:
                  model.isRecruiter83FormValid ? primaryColor : greyColor,
            ),
          ),

          //
          // BODY
          //
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),

            child: SingleChildScrollView(
              child: CustomPadding(
                child: SingleChildScrollView(
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
                              '83.33%',
                              style: style16M.copyWith(color: lightBlackColor),
                            ),
                          ),
                          7.verticalSpace,
                          ProgressContainer(
                            progressWidth:
                                MediaQuery.sizeOf(context).width * 0.83,
                          ),
                          30.verticalSpace,
                          Text('buisness_profile_info'.tr, style: style24M),
                          16.verticalSpace,
                          Text(
                            'buisness_profile_info_description'.tr,
                            style: style16M.copyWith(color: lightBlackColor),
                          ),
                        ],
                      ),
                      18.verticalSpace,
                      Text(
                        'first_names'.tr,
                        style: style16B.copyWith(color: lightBlackColor),
                      ),
                      4.verticalSpace,

                      TextFormField(
                        keyboardType: TextInputType.name,
                        onChanged: (_) => model.updateFormValidity(),
                        controller: model.nombresController,
                        decoration: authFieldDecoration.copyWith(
                          hintText:
                              'buisness_profile_info_enter_write_your_name'.tr,
                          errorText:
                              model.nombresError ? 'field_required'.tr : null,
                        ),
                      ),
                      16.verticalSpace,
                      Text(
                        'last_names_label'.tr,
                        style: style16B.copyWith(color: lightBlackColor),
                      ),
                      4.verticalSpace,

                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (_) => model.updateFormValidity(),
                        controller: model.apellidoPaternoController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'buisness_profile_info_paternal_name'.tr,
                          errorText:
                              model.apellidoPaternoError
                                  ? 'field_required'.tr
                                  : null,
                        ),
                      ),
                      4.verticalSpace,

                      TextFormField(
                        keyboardType: TextInputType.name,
                        onChanged: (_) => model.updateFormValidity(),
                        controller: model.apellidoMaternoController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'buisness_profile_info_mother_name'.tr,
                          errorText:
                              model.apellidoMaternoError
                                  ? 'field_required'.tr
                                  : null,
                        ),
                      ),
                      16.verticalSpace,
                      Text(
                        'buisness_profile_info_postion_hold_in_company'.tr,
                        style: style16B.copyWith(color: lightBlackColor),
                      ),
                      4.verticalSpace,

                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (_) => model.updateFormValidity(),
                        controller: model.cargoController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Eg_Administrative_Assistant'.tr,
                          errorText:
                              model.cargoError ? 'field_required'.tr : null,
                        ),
                      ),
                      16.verticalSpace,
                      Text(
                        'buisness_profile_info_describe_your_self_professionally'
                            .tr,
                        style: style16B.copyWith(color: lightBlackColor),
                      ),
                      4.verticalSpace,

                      TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (_) => model.updateFormValidity(),
                        controller: model.descripcionProfesionalController,
                        decoration: authFieldDecoration.copyWith(
                          hintText:
                              'buisness_profile_info_describe_your_self_professionally_example'
                                  .tr,
                          errorText:
                              model.descripcionError
                                  ? 'field_required'.tr
                                  : null,
                        ),
                        minLines: 2,
                        maxLines: 10,
                        maxLength: 500,
                      ),

                      150.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
