import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_menu.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_text_field.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_50_percent/register_50_view_model.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_recruiter/register_recruiter_66_percent.dart';
import '../../../../../custom_widgets/Containers/progress_container.dart';
import '../../../../../custom_widgets/header/header.dart';
import '../../../../../custom_widgets/paddings_and_margins/custom_padding.dart';

class RegisterCompany50PercentScreen extends StatelessWidget {
  const RegisterCompany50PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Register50ViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          //
          // BODY
          //
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),

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
                            '50%',
                            style: style16M.copyWith(color: lightBlackColor),
                          ),
                        ),
                        7.verticalSpace,
                        ProgressContainer(
                          progressWidth: MediaQuery.sizeOf(context).width * 0.5,
                        ),
                        30.verticalSpace,
                        Text('company_location'.tr, style: style24M),
                        16.verticalSpace,
                        Text(
                          'enter_location'.tr,
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ],
                    ),
                    18.verticalSpace,
                    Text(
                      'fedral_company_located'.tr,
                      style: style16B.copyWith(color: lightBlackColor),
                    ),
                    4.verticalSpace,
                    CustomDropDownTextField(
                      hasDroppedDown: model.dropDown4,
                      onTap: model.toggleDropDown4,
                      text: model.dropDownText4,
                      borderColor:
                          model.dropDown4Error ? primaryColor : lightBlackColor,
                    ),
                    if (model.dropDown4Error)
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          'field_required'.tr,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),

                    10.verticalSpace,
                    DropDownMenu(
                      isDroppedDown: model.dropDown4,
                      height: 180,
                      options: model.stateOptions,
                      onItemTap: (val) {
                        log("Value tapped: $val");
                        model.setDropDownText4(val);
                        model.toggleDropDown4();
                      },
                    ),

                    16.verticalSpace,
                    Text(
                      'company_part_public_or_private_sector'.tr,
                      style: style16B.copyWith(color: lightBlackColor),
                    ),
                    4.verticalSpace,
                    CustomDropDownTextField(
                      hasDroppedDown: model.dropDown5,
                      onTap: model.toggleDropDown5,
                      text: model.dropDownText5,
                      borderColor:
                          model.dropDown5Error ? primaryColor : lightBlackColor,
                    ),
                    if (model.dropDown5Error)
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          'field_required'.tr,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    10.verticalSpace,
                    DropDownMenu(
                      isDroppedDown: model.dropDown5,
                      height: 180,
                      options: model.municipalityOptions,
                      onItemTap: (val) {
                        log("Value tapped: $val");
                        model.setDropDownText5(val);
                        model.toggleDropDown5();
                      },
                    ),

                    16.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'out_side_number'.tr,
                                style: style16B.copyWith(
                                  color: lightBlackColor,
                                ),
                              ),
                              4.verticalSpace,
                              SizedBox(
                                width: 160,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => model.updateFormValidity(),
                                  controller: model.numeroExteriorController,
                                  decoration: authFieldDecoration.copyWith(
                                    hintText: 'out_side_number'.tr,
                                    errorText:
                                        model.exteriorNumberError
                                            ? 'field_required'.tr
                                            : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'inner_side_number'.tr,
                                style: style16B.copyWith(
                                  color: lightBlackColor,
                                ),
                              ),
                              4.verticalSpace,
                              SizedBox(
                                width: 160,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => model.updateFormValidity(),
                                  controller: model.numeroInteriorController,
                                  decoration: authFieldDecoration.copyWith(
                                    hintText: 'optional'.tr,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    16.verticalSpace,

                    Text(
                      'which_neighbour_vacancy_located'.tr,
                      style: style16B.copyWith(color: lightBlackColor),
                    ),
                    4.verticalSpace,

                    TextFormField(
                      keyboardType: TextInputType.name,
                      onChanged: (_) => model.updateFormValidity(),
                      controller: model.coloniaController,
                      decoration: authFieldDecoration.copyWith(
                        hintText: 'name_person'.tr,
                        errorText:
                            model.coloniaError ? 'field_required'.tr : null,
                      ),
                    ),
                    16.verticalSpace,
                    Text(
                      'company_street_located'.tr,
                      style: style16B.copyWith(color: lightBlackColor),
                    ),
                    4.verticalSpace,

                    TextFormField(
                      keyboardType: TextInputType.text,
                      onChanged: (_) => model.updateFormValidity(),
                      controller: model.calleController,
                      decoration: authFieldDecoration.copyWith(
                        hintText: 'omega'.tr,
                        errorText:
                            model.calleError ? 'field_required'.tr : null,
                      ),
                    ),
                    16.verticalSpace,
                    Text(
                      'company_zip_code'.tr,
                      style: style16B.copyWith(color: lightBlackColor),
                    ),
                    4.verticalSpace,

                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (_) => model.updateFormValidity(),
                      controller: model.codigoPostalController,

                      decoration: authFieldDecoration.copyWith(
                        hintText: 'e_g_0930'.tr,
                        errorText:
                            model.postalCodeError ? 'field_required'.tr : null,
                      ),
                    ),
                    50.verticalSpace,
                  ],
                ),
              ),
            ),
          ),

          ///
          /// Floating Button
          ///
          bottomNavigationBar: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 15),
            child: CustomButton(
              text: 'btn_continue',
              onTap: () {
                model.validateDropdown();
                model.validateTextFields();

                if (!model.dropDown4Error &&
                    !model.dropDown5Error &&
                    !model.exteriorNumberError &&
                    !model.coloniaError &&
                    !model.calleError &&
                    !model.postalCodeError) {
                  Get.to(() => RegisterRecruiter66PercentScreen());
                }
              },

              backgroundColor: model.isFormValid ? primaryColor : greyColor,
            ),
          ),
        );
      },
    );
  }
}
