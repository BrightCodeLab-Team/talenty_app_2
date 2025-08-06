// ignore_for_file: use_key_in_widget_constructors, invalid_use_of_visible_for_testing_member

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
import 'package:talenty_app/ui/custom_widgets/header/header.dart';
import 'package:talenty_app/ui/custom_widgets/paddings_and_margins/custom_padding.dart';
import 'package:talenty_app/ui/screens/candidate/auth/build_Profile/mandatory_registeration/mandatory_student_reg_view_model.dart';

class MandatoryStudentRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MandatoryStudentRegViewModel(),
      child: Consumer<MandatoryStudentRegViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              /// Start Body
              ///
              body: SingleChildScrollView(
                child: CustomPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      45.verticalSpace,
                      Header(hasBackButton: false),
                      30.verticalSpace,
                      Text('Crea una cuenta'.tr, style: style24M),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ingresa tu correo electrónico'.tr,
                            style: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'label_required'.tr,
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      TextFormField(
                        controller: model.nameController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Primer nombre input'.tr,
                          errorText: model.nameError,
                        ),
                        // validator: (_) => model.validateEmail(),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Segundo nombre input'.tr,
                            style: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'optional'.tr,
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      TextFormField(
                        controller: model.nameController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Escribe tu segundo nombre'.tr,
                          errorText: model.nameError,
                        ),
                        // validator: (_) => model.validateEmail(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'last_names_label'.tr,
                            style: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'label_required'.tr,
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      TextFormField(
                        controller: model.nameController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Apellido paterno'.tr,
                          errorText: model.nameError,
                        ),
                        // validator: (_) => model.validateEmail(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '',
                            style: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'optional'.tr,
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      TextFormField(
                        controller: model.nameController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Apellido materno'.tr,
                          errorText: model.nameError,
                        ),
                        // validator: (_) => model.validateEmail(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fecha de Nacimiento'.tr,
                            style: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'label_required'.tr,
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: _buildDateDropdown(
                              context,
                              model.dropDown1,
                              model.dropDown1Error,
                              model.dropDownText1 ?? "",
                              model.day,

                              toggle: () {
                                model.toggleDropDown1();
                              },
                              onItemTap: (p0) {
                                model.setDropDownText1(p0);
                                model.toggleDropDown1(); // close the dropdown
                                model.dropDown1Error = false;
                                model.notifyListeners(); // refresh UI
                              },
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            flex: 1,
                            child: _buildDateDropdown(
                              context,
                              model.dropDown2,
                              model.dropDown2Error,
                              model.dropDownText2,
                              model.month,

                              toggle: () {
                                model.toggleDropDown2();
                              },
                              onItemTap: (p0) {
                                model.setDropDownText2(p0);
                                model.toggleDropDown2();
                                model.dropDown2Error = false;
                                model.notifyListeners();
                              },
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            flex: 1,
                            child: _buildDateDropdown(
                              context,
                              model.dropDown3,
                              model.dropDown3Error,
                              model.dropDownText3,
                              model.year,
                              toggle: () {
                                model.toggleDropDown3();
                              },
                              onItemTap: (p0) {
                                model.setDropDownText3(p0);
                                model.toggleDropDown3();
                                model.dropDown3Error = false;
                                model.notifyListeners();
                              },
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Para crear una cuenta, debes ser mayor de 18 años. ",
                        style: style14M.copyWith(color: textDarkGreyColor),
                      ),
                      16.verticalSpace,
                      Text(
                        "Indica tu ubicación actual para que podamos mostrarte las mejores oportunidades cerca de ti",
                        style: style14M.copyWith(color: textDarkGreyColor),
                      ),
                      10.verticalSpace,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Entidad Federativa',
                            style: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'label_required'.tr,
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      TextFormField(
                        controller: model.nameController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Ciudad de México'.tr,
                          errorText: model.nameError,
                        ),
                        // validator: (_) => model.validateEmail(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delegación/Municipio'.tr,
                            style: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'label_required'.tr,
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      _buildDateDropdown(
                        context,
                        model.dropDown4,
                        model.dropDown4Error,
                        model.dropDownText4,
                        model.fourthDropdown,
                        toggle: () {
                          model.toggleDropDown4();
                        },
                        onItemTap: (p0) {
                          model.setDropDownText4(p0);
                          model.toggleDropDown4();
                          model.dropDown4Error = false;
                          model.notifyListeners();
                        },
                      ),

                      16.verticalSpace,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Colonia',
                            style: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '',
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      TextFormField(
                        controller: model.nameController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Romero de Torres '.tr,
                          errorText: model.nameError,
                        ),
                        // validator: (_) => model.validateEmail(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Área Laboral'.tr,
                            style: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'label_required'.tr,
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      _buildDateDropdown(
                        context,
                        model.dropDown5,
                        model.dropDown5Error,
                        model.dropDownText5,
                        model.sixthDropdown,
                        toggle: () {
                          model.toggleDropDown5();
                        },
                        onItemTap: (p0) {
                          model.setDropDownText5(p0);
                          model.toggleDropDown5();
                          model.dropDown5Error = false;
                          model.notifyListeners();
                        },
                      ),
                      Text(
                        "Si no eres parte de un sector laboral, elige el área en la que deseas trabajar.",
                        style: style14M.copyWith(color: textDarkGreyColor),
                      ),
                      16.verticalSpace,
                      Row(
                        children: [
                          Checkbox(
                            activeColor: brownColor,
                            value: model.isCheckboxChecked,
                            onChanged: (value) {
                              model.isCheckboxChecked = value ?? false;
                              model.updateFormValidity();
                            },
                          ),

                          Flexible(
                            flex: 1,
                            child: Text(
                              "Declaro que tengo 18 años de edad y que, por lo tanto, soy mayor de edad.",
                              style: style14M.copyWith(
                                color: textDarkGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
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
                      40.verticalSpace,
                      CustomButton(
                        text: "Aceptar y Continuar",
                        onTap:
                            model.isFormValid
                                ? () {
                                  // Proceed to next screen
                                }
                                : null, // Disabled when form invalid
                        backgroundColor:
                            model.isFormValid
                                ? brownColor
                                : Colors.grey.shade300,
                        textColor:
                            model.isFormValid ? Colors.white : Colors.grey,
                      ),

                      100.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

Widget _buildDateDropdown(
  BuildContext context,
  bool isDroppedDown,
  bool hasError,
  String text,
  List<String> options, {
  final VoidCallback? toggle,
  final Function(String)? onItemTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomDropDownTextField(
        borderColor: hasError ? primaryColor : lightBlackColor,
        hasDroppedDown: isDroppedDown,
        onTap: toggle!,
        text:
            text.isEmpty
                ? '--Selecciona uno--'
                : text, // 👈 this line is changed
      ),
      if (hasError)
        Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            'field_required'.tr,
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
      10.verticalSpace,
      DropDownMenu(
        isDroppedDown: isDroppedDown,
        height: 180,
        options: options,
        onItemTap: (val) => onItemTap!(val),
      ),
    ],
  );
}
