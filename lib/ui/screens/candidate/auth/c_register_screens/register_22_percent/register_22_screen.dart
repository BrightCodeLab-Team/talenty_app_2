// ignore_for_file: deprecated_member_use

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
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_22_percent/register_22_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_33_percent/register_33_screen.dart';

class Candidate22PercentScreen extends StatelessWidget {
  const Candidate22PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister22PercentViewModel(),
      child: Consumer<CandidateRegister22PercentViewModel>(
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
                          '22%',
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ),
                      4.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.of(context).size.width * 0.22,
                      ),
                      20.verticalSpace,
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: blackColor, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: blackColor,
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
                                'Experiencia laboral',
                                style: style20B.copyWith(color: blackColor),
                              ),
                              8.verticalSpace,
                              Text(
                                'Añade tu experiencia laboral más relevante, especificando los roles que has desempeñado y las empresas en las que has trabajado.',
                                style: style14M.copyWith(color: textGreyColor),
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
                      15.verticalSpace,

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
                              "No tengo experiencia laboral",
                              style: style14M.copyWith(
                                color: textDarkGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      15.verticalSpace,

                      // Wrap your ListView.builder in a Visibility widget
                      Visibility(
                        visible: !model.skipExperience,
                        child: ListView.builder(
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
                              Get.to(Candidate33PercentScreen());
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
  final CandidateRegister22PercentViewModel model;

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
          onChanged: (value) => model.setPosition(value, index),
          decoration: authFieldDecoration.copyWith(
            hintText: 'Ej: Desarrollador Frontend',
            errorText: entry.positionError ? 'Este campo es obligatorio' : null,
          ),
        ),

        // Company field
        10.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Empresa', style: style16B.copyWith(color: lightBlackColor)),
            Text(
              '*obligatorio',
              style: style14M.copyWith(color: textGreyColor),
            ),
          ],
        ),
        10.verticalSpace,
        TextFormField(
          onChanged: (value) => model.setCompany(value, index),
          decoration: authFieldDecoration.copyWith(
            hintText: 'Nombre de la empresa',
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
              'Ubicación',
              style: style16B.copyWith(
                color: entry.isRemote ? borderGreyColor : lightBlackColor,
              ),
            ),
            Text(
              '*obligatorio',
              style: style14M.copyWith(color: textGreyColor),
            ),
          ],
        ),
        10.verticalSpace,
        TextFormField(
          readOnly: entry.isRemote,
          onChanged: (value) => model.setLocation(value, index),
          decoration: authFieldDecoration.copyWith(
            hintText: 'Ciudad, País',
            errorText: entry.locationError ? 'Este campo es obligatorio' : null,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r), // Rounded corners
              borderSide: BorderSide(
                color: entry.isRemote ? borderGreyColor : lightBlackColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: entry.isRemote ? borderGreyColor : lightBlackColor,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: entry.isRemote ? borderGreyColor : lightBlackColor,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),

        // Remote checkbox
        Row(
          children: [
            Checkbox(
              value: entry.isRemote,
              onChanged: (value) {
                model.setIsRemote(value ?? false, index);
                // Clear location field when checking remote
                if (value == true) {
                  model.setLocation('', index);
                }
                model.validateAllEntries();
              },
              activeColor: darkgreenColor.withOpacity(0.30),
              checkColor: whiteColor,
              side: BorderSide(
                color: entry.isRemote ? darkgreenColor : greyColor,
                width: 1.4,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Flexible(
              child: Text(
                "Este empleo fue/es remoto",
                style: style14M.copyWith(color: textDarkGreyColor),
              ),
            ),
          ],
        ),

        // Date fields
        10.verticalSpace,
        Text('Periodo', style: style16B.copyWith(color: blackColor)),
        10.verticalSpace,

        // Start date
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mes', style: style16B.copyWith(color: blackColor)),
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
                  Text('Año', style: style16B.copyWith(color: blackColor)),
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

        // Current job checkbox
        // Current job checkbox
        Row(
          children: [
            Checkbox(
              value: entry.isCurrent,
              onChanged: (value) {
                model.setIsCurrent(value ?? false, index);
                model.validateAllEntries(); // Trigger validation
              },
              activeColor: darkgreenColor.withOpacity(0.30),
              checkColor: whiteColor,
              side: BorderSide(
                color: entry.isCurrent ? darkgreenColor : greyColor,
                width: 1.4,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Flexible(
              child: Text(
                "Actualmente trabajo en este empleo",
                style: style14M.copyWith(color: textDarkGreyColor),
              ),
            ),
          ],
        ),

        // End date (only if not current)
        if (!entry.isCurrent) ...[
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mes', style: style16B.copyWith(color: blackColor)),
                    1.verticalSpace,
                    _buildDateDropdown(
                      context,
                      entry.dropDown4Open,
                      entry.endMonthError,
                      entry.endMonth ?? "Selecciona",
                      model.secondDropDown,
                      toggle: () => model.toggleDropDown4(index),
                      onItemTap: (value) {
                        model.setEndMonth(value, index);
                        model.validateAllEntries();
                      },
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Año', style: style16B.copyWith(color: blackColor)),
                    1.verticalSpace,
                    _buildDateDropdown(
                      context,
                      entry.dropDown5Open,
                      entry.endYearError,
                      entry.endYear ?? "Selecciona",
                      model.thirdDropDown,
                      toggle: () => model.toggleDropDown5(index),
                      onItemTap: (value) {
                        model.setEndYear(value, index);
                        model.validateAllEntries();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],

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
                        color: blackColor.withOpacity(0.25),
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
                      style: style14M.copyWith(color: blackColor),
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
                  style: style16M.copyWith(color: blackColor),
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
