// ignore_for_file: unnecessary_null_comparison, use_key_in_widget_constructors, invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/character_counter_row.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_menu.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_text_field.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_33_percent/register_33_view_model.dart';
import '../../../../../custom_widgets/Containers/progress_container.dart';
import '../../../../../custom_widgets/header/header.dart';
import '../../../../../custom_widgets/paddings_and_margins/custom_padding.dart';
import '../register_50_percent/register_company_50_percent_screen.dart';

class RegisterCompany33PercentScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Register33ViewModel(),
      child: Consumer<Register33ViewModel>(
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
                                '33.33%',
                                style: style16M.copyWith(
                                  color: lightBlackColor,
                                ),
                              ),
                            ),
                            7.verticalSpace,
                            ProgressContainer(
                              progressWidth:
                                  MediaQuery.sizeOf(context).width * 0.33,
                            ),
                            30.verticalSpace,
                            Text('buisness_information'.tr, style: style24M),
                            16.verticalSpace,
                            Text(
                              'complete_your_company_info'.tr,
                              style: style16M.copyWith(color: lightBlackColor),
                            ),
                          ],
                        ),
                        18.verticalSpace,
                        Text(
                          'company_belong'.tr,
                          style: style16B.copyWith(color: lightBlackColor),
                        ),
                        4.verticalSpace,
                        CustomDropDownTextField(
                          borderColor:
                              model.dropDown1Error
                                  ? primaryColor
                                  : lightBlackColor,
                          hasDroppedDown: model.dropDown1,
                          onTap: model.toggleDropDown1,
                          text: model.dropDownText1,
                        ),
                        if (model.dropDown1Error)
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              'field_required'.tr,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        10.verticalSpace,
                        DropDownMenu(
                          isDroppedDown: model.dropDown1,
                          height: 180,
                          options: model.industryOptions,
                          onItemTap: (val) {
                            model.setDropDownText1(val);
                            model.dropDown1Error = false; // 👈 Reset error flag
                            model.toggleDropDown1();
                            model.notifyListeners();
                          },
                        ),
                        16.verticalSpace,
                        Text(
                          'company_part_public_or_private_sector'.tr,
                          style: style16B.copyWith(color: lightBlackColor),
                        ),
                        4.verticalSpace,
                        CustomDropDownTextField(
                          hasDroppedDown: model.dropDown2,
                          borderColor:
                              model.dropDown2Error
                                  ? primaryColor
                                  : lightBlackColor,
                          onTap: model.toggleDropDown2,
                          text: model.dropDownText2,
                        ),
                        if (model.dropDown2Error)
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              'field_required'.tr,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        10.verticalSpace,
                        DropDownMenu(
                          isDroppedDown: model.dropDown2,
                          height: 100,
                          options: model.sectorOptions,
                          onItemTap: (val) {
                            log("Value tapped: $val");
                            model.setDropDownText2(val);
                            model.dropDown2Error = false; // 👈 Reset error flag
                            model.toggleDropDown2();
                            model.notifyListeners();
                          },
                        ),
                        16.verticalSpace,
                        Text(
                          'employs_curently_?'.tr,
                          style: style16B.copyWith(color: lightBlackColor),
                        ),
                        4.verticalSpace,
                        CustomDropDownTextField(
                          hasDroppedDown: model.dropDown3,
                          borderColor:
                              model.dropDown3Error
                                  ? primaryColor
                                  : lightBlackColor,
                          onTap: model.toggleDropDown3,
                          text: model.dropDownText3,
                        ),
                        if (model.dropDown3Error)
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              'field_required'.tr,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        10.verticalSpace,
                        DropDownMenu(
                          isDroppedDown: model.dropDown3,
                          height: 180,
                          options: model.employeeCountOptions,

                          onItemTap: (val) {
                            log("Value tapped: $val");
                            model.setDropDownText3(val);
                            model.dropDown3Error = false; // 👈 Reset error flag
                            model.toggleDropDown3();

                            model.notifyListeners();
                          },
                        ),
                        16.verticalSpace,

                        Text(
                          'country_registration_rc'.tr,
                          style: style16B.copyWith(color: lightBlackColor),
                        ),
                        4.verticalSpace,

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: model.rfcController,
                          // validator: (_) => model.validateRfc(),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[A-Za-z0-9]'),
                            ),
                            UpperCaseTextFormatter(),
                            LengthLimitingTextInputFormatter(15),
                          ],
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'rfc_number'.tr,
                            errorText: null,
                            suffixIcon: Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              verticalOffset: -30,
                              message: 'company_registration_message'.tr,
                              textStyle: style14M.copyWith(
                                color: lightBlackColor,
                              ),

                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: lightBlackColor),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Icon(
                                Icons.info_outline_rounded,
                                color: lightBlackColor,
                              ),
                            ),
                          ),
                        ),
                        CharacterCounterRow(
                          error: model.rfcError,
                          currentLength: model.rfcControllerLength,
                          maxLength: 50,
                          label: 'caracteres',
                        ),
                        16.verticalSpace,
                        Text(
                          'company_registration_number_imss'.tr,
                          style: style16B.copyWith(color: lightBlackColor),
                        ),
                        4.verticalSpace,

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: model.imssController,
                          // validator: (_) => model.validateImss(),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[A-Za-z0-9]'),
                            ),
                            LengthLimitingTextInputFormatter(15),
                          ],
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'Ej: A1234567890',
                            errorText: null,
                            suffixIcon: Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              verticalOffset: -30,
                              message: 'unique_identifier'.tr,
                              textStyle: style14M.copyWith(
                                color: lightBlackColor,
                              ),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: lightBlackColor),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Icon(
                                Icons.info_outline_rounded,
                                color: lightBlackColor,
                              ),
                            ),
                          ),
                        ),

                        CharacterCounterRow(
                          error: model.imssError,
                          currentLength: model.imssControllerLength,
                          maxLength: 50,
                          label: 'caracteres',
                        ),

                        16.verticalSpace,
                        Text(
                          'corporate_name_comapany'.tr,
                          style: style16B.copyWith(color: lightBlackColor),
                        ),
                        4.verticalSpace,

                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: model.razonSocialController,
                          // validator: (_) => model.validateRazonSocial(),
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'corporate_name_example'.tr,
                            errorText: null,

                            suffixIcon: Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              verticalOffset: -30,
                              message: 'corporate_name_description'.tr,
                              textStyle: style14M.copyWith(
                                color: lightBlackColor,
                              ),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: lightBlackColor),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Icon(
                                Icons.info_outline_rounded,
                                color: lightBlackColor,
                              ),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              child:
                                  model.razonSocialError != null
                                      ? Text(
                                        model.razonSocialError!,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      )
                                      : null,
                            ),
                            Text(
                              '${model.razonSocialControllerLength}/50 ${'caracteres'.tr}',
                              style: style14M.copyWith(
                                color:
                                    model.razonSocialControllerLength > 50
                                        ? Colors.red
                                        : textGreyColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
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
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                text: 'btn_continue'.tr,
                onTap: () {
                  // Validate all fields
                  model.validateDropdowns();
                  model.validateForm();
                  model.notifyListeners();

                  // Check if all fields are valid
                  bool areDropdownsValid =
                      !model.dropDown1Error &&
                      !model.dropDown2Error &&
                      !model.dropDown3Error;

                  bool areTextFieldsValid =
                      model.validateRfc() == null &&
                      model.validateImss() == null &&
                      model.validateRazonSocial() == null;

                  if (areDropdownsValid && areTextFieldsValid) {
                    Get.to(() => RegisterCompany50PercentScreen());
                  }
                },
                backgroundColor:
                    model.isFormCompletelyValid ? primaryColor : greyColor,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
