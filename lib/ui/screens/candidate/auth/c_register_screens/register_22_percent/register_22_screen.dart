import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/Containers/progress_container.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_menu.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_text_field.dart';

import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_22_percent/register_22_view_model.dart';

class Candidate22PercentScreen extends StatelessWidget {
  const Candidate22PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister22PercentViewModel(),
      child: Consumer<CandidateRegister22PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(text: 'Continuar', onTap: () {}),
              ),
              appBar: AppBar(
                backgroundColor: transparent,
                leading: Padding(
                  padding: EdgeInsetsGeometry.only(left: 15),
                  child: CustomBackButton(),
                ),
                centerTitle: true,
                title: Image.asset(AppAssets.appLogo2, scale: 4),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Center(
                        child: Text(
                          '22%',
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ),

                      ///
                      ///
                      ///
                      4.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.of(context).size.width * 0.25,
                      ),

                      ///
                      ///
                      ///
                      20.verticalSpace,
                      Container(
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: blackColor, width: 1.w),
                          boxShadow: [
                            BoxShadow(
                              color: blackColor,
                              offset: Offset(-1.w, 2.w),
                              blurRadius: 0,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 16.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Experiencia laboral',
                                style: style20B.copyWith(color: blackColor),
                              ),
                              8.verticalSpace,
                              Text(
                                'Añade tu experiencia laboral más relevante, especificando los roles que has desempeñado y las empresas en las que has trabajado.',
                                style: style14M.copyWith(
                                  color: textGreyColor,
                                ), // textGreyColor for the description
                                textAlign: TextAlign.start,
                              ),
                              8.verticalSpace,
                              Row(
                                children: [
                                  Text(''),
                                  Spacer(),
                                  Text(
                                    'Máximo 3',
                                    style: style16B.copyWith(color: blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///
                      ///
                      ///
                      5.verticalSpace,

                      Row(
                        children: [
                          Checkbox(
                            activeColor: darkgreenColor,
                            value: model.isCheckboxChecked1,
                            onChanged: (value) {
                              model.isCheckboxChecked1 = value ?? false;
                              model.updateFormValidity();
                            },
                          ),

                          Flexible(
                            flex: 1,
                            child: Text(
                              "NO tengo experiencia laboral",
                              style: style14M.copyWith(
                                color: textDarkGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nombre del Puesto',
                            style: style16B.copyWith(color: lightBlackColor),
                          ),
                          Text(
                            '*obligatorio',
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      TextFormField(
                        decoration: authFieldDecoration.copyWith(
                          hintText:
                              'Ej: Universidad Nacional Autónoma de México',
                        ),
                      ),

                      ///
                      ///
                      ///
                      10.verticalSpace,

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Empresa',
                            style: style16B.copyWith(color: lightBlackColor),
                          ),
                          Text(
                            '*obligatorio',
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      TextFormField(
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Ingresa el nombre de la empresa',
                        ),
                      ),

                      ///
                      ///
                      ///
                      10.verticalSpace,

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ubicación',
                            style: style16B.copyWith(color: lightBlackColor),
                          ),
                          Text(
                            '*obligatorio',
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      TextFormField(
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Ciudad, País',
                        ),
                      ),

                      ///
                      ///

                      ///
                      ///
                      ///. below this UI will appear when user first fill the above text field
                      ///
                      ///.
                      5.verticalSpace,

                      Row(
                        children: [
                          Checkbox(
                            activeColor: darkgreenColor,
                            value: model.isCheckboxChecked2,
                            onChanged: (value) {
                              model.isCheckboxChecked2 = value ?? false;
                              model.updateFormValidity();
                            },
                          ),

                          Flexible(
                            flex: 1,
                            child: Text(
                              "Este empleo fue/es remoto",
                              style: style14M.copyWith(
                                color: textDarkGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,

                      Text(
                        'Periodo',
                        style: style16B.copyWith(color: blackColor),
                      ),
                      10.verticalSpace,

                      ///
                      /// first row of two drop down
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fecha de Inicio',
                            style: style16B.copyWith(color: lightBlackColor),
                          ),
                          Spacer(),
                          Text(
                            '*obligatorio',
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mes',
                                  style: style16B.copyWith(color: blackColor),
                                ),
                                1.verticalSpace,
                                _buildDateDropdown(
                                  context,
                                  model.dropDown2,
                                  model.dropDown2Error,
                                  model.dropDownText2 ?? " ",
                                  model.secondDropDown,

                                  toggle: () {
                                    model.toggleDropDown2();
                                  },
                                  onItemTap: (p0) {
                                    model.setDropDownText2(p0);
                                    model
                                        .toggleDropDown2(); // close the dropdown
                                    model.dropDown2Error = false;
                                    model.notifyListeners(); // refresh UI
                                  },
                                ),
                              ],
                            ),
                          ),
                          8.horizontalSpace,
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Año',
                                  style: style16B.copyWith(color: blackColor),
                                ),
                                1.verticalSpace,
                                _buildDateDropdown(
                                  context,
                                  model.dropDown3,
                                  model.dropDown3Error,
                                  model.dropDownText3,
                                  model.thirdDropDown,

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
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Checkbox(
                            activeColor: darkgreenColor,
                            value: model.isCheckboxChecked3,
                            onChanged: (value) {
                              model.isCheckboxChecked3 = value ?? false;
                              model.updateFormValidity();
                            },
                          ),

                          Flexible(
                            flex: 1,
                            child: Text(
                              "Actualmente trabajo en este empleo",
                              style: style14M.copyWith(
                                color: textDarkGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      3.verticalSpace,

                      ///.
                      ///. seconde row of two drop down
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fecha de Finalización',
                            style: style16B.copyWith(color: lightBlackColor),
                          ),
                          Text(
                            '*obligatorio',
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mes',
                                  style: style16B.copyWith(color: blackColor),
                                ),
                                1.verticalSpace,
                                _buildDateDropdown(
                                  context,
                                  model.dropDown4,
                                  model.dropDown4Error,
                                  model.dropDownText4 ?? " ",
                                  model.secondDropDown,

                                  toggle: () {
                                    model.toggleDropDown4();
                                  },
                                  onItemTap: (p0) {
                                    model.setDropDownText4(p0);
                                    model
                                        .toggleDropDown4(); // close the dropdown
                                    model.dropDown4Error = false;
                                    model.notifyListeners(); // refresh UI
                                  },
                                ),
                              ],
                            ),
                          ),
                          8.horizontalSpace,
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Año',
                                  style: style16B.copyWith(color: blackColor),
                                ),
                                1.verticalSpace,
                                _buildDateDropdown(
                                  context,
                                  model.dropDown5,
                                  model.dropDown5Error,
                                  model.dropDownText5,
                                  model.thirdDropDown,

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
                              ],
                            ),
                          ),
                        ],
                      ),
                      5.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          //. add repetition logic this UI will appear only 3 time
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: blackColor.withOpacity(0.2),
                                offset: Offset(1, 1),
                                blurRadius: 2,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Agregar otra experiencia',
                                  style: style16M.copyWith(
                                    color: lightBlackColor,
                                  ),
                                ),
                                2.horizontalSpace,
                                Icon(
                                  Icons.add,
                                  color: lightBlackColor,
                                  size: 25,
                                  weight: 300,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      50.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///. check box
  ///
  Widget _buildCheckboxRow(
    String text,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: darkgreenColor,
              checkColor: whiteColor,
              side: BorderSide(
                color: value ? darkgreenColor : greyColor,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              text,
              style: style14M.copyWith(color: textLightGreyColor),
            ),
          ),
        ],
      ),
    );
  }
}

///
///
///
///
///. single full width drop down

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
