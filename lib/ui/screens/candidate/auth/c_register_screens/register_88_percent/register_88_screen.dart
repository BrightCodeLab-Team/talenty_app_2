// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/Containers/progress_container.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_menu.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_text_field.dart';
import 'package:talenty_app/ui/custom_widgets/header/header.dart';
import 'package:talenty_app/ui/custom_widgets/paddings_and_margins/custom_padding.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_100_percent/register_100_screen.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_88_percent/register_88_view_model.dart';

class Candidate88PercentScreen extends StatelessWidget {
  const Candidate88PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister88PercentViewModel(),
      child: Consumer<CandidateRegister88PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 40.h, left: 0.0, right: 0.0),
                child: CustomPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      45.verticalSpace,
                      Header(hasBackButton: true, scale: 5),
                      20.verticalSpace,
                      Center(
                        child: Text(
                          '88%',
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ),
                      4.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.of(context).size.width * 0.80,
                      ),
                      20.verticalSpace,
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: darkPurpleColor, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: darkPurpleColor,
                              offset: Offset(-4, 4),
                              blurRadius: 0,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '¿Tienes algún curso, diplomado o certificación?',
                                style: style20B.copyWith(
                                  color: darkPurpleColor,
                                ),
                              ),
                              8.verticalSpace,
                              Text(
                                'Describe hasta 3 cursos o certificaciones que respalden tu experiencia. Haz clic en cada uno para añadir los detalles y fortalecer tu perfil.',
                                style: style14M.copyWith(color: textGreyColor),
                              ),
                              8.verticalSpace,
                              Row(
                                children: [
                                  Text(''),
                                  Spacer(),
                                  Text(
                                    'Máximo 32',
                                    style: style16B.copyWith(
                                      color: darkPurpleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      15.verticalSpace,

                      // Add this checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: model.skipExperience,
                            onChanged:
                                (value) =>
                                    model.setSkipExperience(value ?? false),
                            activeColor: darkgreenColor.withOpacity(0.30),
                            checkColor: whiteColor,
                            side: BorderSide(
                              color:
                                  model.skipExperience
                                      ? darkgreenColor
                                      : greyColor,
                              width: 1.4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "NO tengo cursos ni certificaciones",
                              style: style14M.copyWith(
                                color: textDarkGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      // Wrap your ListView.builder in a Visibility widget
                      Visibility(
                        visible: !model.skipExperience,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: model.workExperienceEntries.length,
                          itemBuilder: (context, index) {
                            return WorkExperienceEntryWidget(
                              entry: model.workExperienceEntries[index],
                              index: index,
                              model: model,
                            );
                          },
                        ),
                      ),

                      // Continue button
                      Padding(
                        padding: EdgeInsets.only(bottom: 90.h),
                        child: CustomButton(
                          text: 'Continuar',
                          onTap: () {
                            if (model.skipExperience || model.isFormValid) {
                              Get.to(Candidate100PercentScreen());
                            } else {
                              Get.snackbar(
                                'Error',
                                'Por favor completa todos los campos obligatorios',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                          backgroundColor:
                              model.isFormValid ? primaryColor : greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

///
///. single full width drop down
///
///. single full width drop down

class WorkExperienceEntryWidget extends StatelessWidget {
  final WorkExperienceEntry entry;
  final int index;
  final CandidateRegister88PercentViewModel model;

  const WorkExperienceEntryWidget({
    required this.entry,
    required this.index,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Position field
        Text(
          'Nombre del curso o certificación ',
          style: style16B.copyWith(color: lightBlackColor),
        ),
        10.verticalSpace,
        TextFormField(
          controller: entry.positionController,
          onChanged: (value) => model.setPosition(value, index),
          decoration: authFieldDecoration.copyWith(
            hintText: 'Ej: Microsoft Excel Specialist.',
            errorText: entry.positionError ? 'Este campo es obligatorio' : null,
          ),
        ),

        // Company field
        10.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Entidad que lo acredita',
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
          controller: entry.companyController,
          onChanged: (value) => model.setCompany(value, index),
          decoration: authFieldDecoration.copyWith(
            hintText: 'Ej: Microsoft.',
            errorText: entry.companyError ? 'Este campo es obligatorio' : null,
          ),
        ),
        20.verticalSpace,
        // Location field (only if not remote)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Fecha de acreditación',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mes', style: style16B.copyWith(color: darkPurpleColor)),
                  1.verticalSpace,
                  _buildDateDropdown(
                    context,
                    entry.dropDown2Open,
                    entry.startMonthError,
                    entry.startMonth ?? "Selecciona",
                    model.secondDropDown,
                    toggle: () => model.toggleDropDown2(index),
                    onItemTap: (value) {
                      model.setStartMonth(value, index);
                      model.validateAllEntries();
                    },
                  ),
                ],
              ),
            ),
            8.horizontalSpace,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Año', style: style16B.copyWith(color: darkPurpleColor)),
                  1.verticalSpace,
                  _buildDateDropdown(
                    context,
                    entry.dropDown3Open,
                    entry.startYearError,
                    entry.startYear ?? "Selecciona",
                    model.thirdDropDown,
                    toggle: () => model.toggleDropDown3(index),
                    onItemTap: (value) {
                      model.setStartYear(value, index);
                      model.validateAllEntries();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        // Add/Remove buttons
        if (index == model.workExperienceEntries.length - 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: model.addWorkExperienceEntry,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),

                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: darkPurpleColor.withOpacity(0.25),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Agregar otra experiencia',
                        style: style14M.copyWith(color: lightBlackColor),
                      ),
                      3.horizontalSpace,
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

              GestureDetector(
                onTap: () => model.removeWorkExperienceEntry(index),
                child: Row(
                  children: [
                    Image.asset(AppAssets.deleteIcon, scale: 4.5),
                    10.horizontalSpace,
                    Text(
                      'Borrar experiencia',
                      style: style14M.copyWith(color: darkPurpleColor),
                    ),
                  ],
                ),
              ),
            ],
          )
        else
          GestureDetector(
            onTap: () => model.removeWorkExperienceEntry(index),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(AppAssets.deleteIcon, scale: 4.5),
                10.horizontalSpace,
                Text(
                  'Borrar experiencia',
                  style: style16M.copyWith(color: darkPurpleColor),
                ),
              ],
            ),
          ),

        // Divider between entries
        if (index < model.workExperienceEntries.length - 1)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image.asset(AppAssets.dividerImage, scale: 3),
          ),
      ],
    );
  }

  Widget _buildDateDropdown(
    BuildContext context,
    bool isDroppedDown,
    bool hasError,
    String text,
    List<String> options, {
    required VoidCallback toggle,
    required Function(String) onItemTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropDownTextField(
          borderColor: hasError ? primaryColor : lightBlackColor,
          hasDroppedDown: isDroppedDown,
          onTap: toggle,
          text: text,
        ),
        if (hasError)
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              'Este campo es obligatorio',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        10.verticalSpace,
        DropDownMenu(
          isDroppedDown: isDroppedDown,
          height: 180,
          options: options,
          onItemTap: (value) {
            onItemTap(value); // Call the callback
            toggle(); // Close the dropdown after selection
          },
        ),
      ],
    );
  }
}
