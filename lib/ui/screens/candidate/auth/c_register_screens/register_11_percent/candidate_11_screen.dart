// ignore_for_file: use_key_in_widget_constructors, annotate_overrides, curly_braces_in_flow_control_structures, invalid_use_of_visible_for_testing_member, deprecated_member_use

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
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_register_11_percent_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_22_percent/register_22_screen.dart';

class CandidateRegister11PercentScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister11PercentViewModel(),
      child: Consumer<CandidateRegister11PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: 40.h,
                ), // Add only bottom padding
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      45.verticalSpace,
                      Header(hasBackButton: true, scale: 5),
                      20.verticalSpace,
                      Center(
                        child: Text(
                          '11%',
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ),
                      4.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.of(context).size.width * 0.11,
                      ),
                      20.verticalSpace,
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8.r),
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
                            horizontal: 8.w,
                            vertical: 16.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '¿Cuáles son tus estudios?',
                                style: style20B.copyWith(
                                  color: darkPurpleColor,
                                ),
                              ),
                              8.verticalSpace,
                              Text(
                                'Registra tu trayectoria académica, indicando el nombre de la universidad, preparatoria o institución de donde provienes.',
                                style: style14M.copyWith(color: textGreyColor),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                      15.verticalSpace,

                      // Display all university entries
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: model.universityEntries.length,
                        itemBuilder: (context, index) {
                          return UniversityEntryWidget(
                            entry: model.universityEntries[index],
                            index: index,
                            model: model,
                          );
                        },
                      ),

                      // Update your Continuar button
                      // In CandidateRegister11PercentScreen
                      Padding(
                        padding: EdgeInsets.only(bottom: 90.h),
                        child: CustomButton(
                          text: 'Continuar',
                          onTap: () {
                            // Validate all entries
                            model.validateAllEntries();

                            // Only navigate if valid
                            if (model.isFormValid) {
                              Get.to(Candidate22PercentScreen());
                            } else {
                              // Show error message if not valid
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
                      30.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

class UniversityEntryWidget extends StatelessWidget {
  final UniversityEntry entry;
  final int index;
  final CandidateRegister11PercentViewModel model;

  const UniversityEntryWidget({
    required this.entry,
    required this.index,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '¿Cuál es tu institución académica?',
              style: style16B.copyWith(color: lightBlackColor),
            ),
            Text(
              '*obligatorio',
              style: style14M.copyWith(color: textGreyColor),
            ),
          ],
        ),
        10.verticalSpace,
        entry.selectedUniversity == null
            ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RawAutocomplete<UniversityModel>(
                  textEditingController: entry.universityController,
                  focusNode: entry.universityFocusNode,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty)
                      return const Iterable<UniversityModel>.empty();

                    return model.universityList.where(
                      (u) => u.name.toLowerCase().contains(
                        textEditingValue.text.toLowerCase(),
                      ),
                    );
                  },
                  onSelected: (selection) {
                    model.selectUniversity(selection, index);
                  },
                  fieldViewBuilder: (
                    BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted,
                  ) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      readOnly: entry.isUniversitySelected,
                      decoration: authFieldDecoration.copyWith(
                        hintText: 'Ej: Universidad Nacional Autónoma de México',
                      ),
                    );
                  },
                  optionsViewBuilder: (
                    BuildContext context,
                    AutocompleteOnSelected<UniversityModel> onSelected,
                    Iterable<UniversityModel> options,
                  ) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 0,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: options.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final option = options.elementAt(index);
                            return InkWell(
                              onTap: () {
                                onSelected(option);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                width: MediaQuery.of(context).size.width - 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: borderGreyColor),
                                ),
                                child: Row(
                                  children: [
                                    Image.network(
                                      option.logoUrl,
                                      height: 40,
                                      width: 40,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Icon(Icons.school, size: 40),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(option.name, style: style16M),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                if (model.isFormValid == false &&
                    entry.selectedUniversity == null)
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      'Por favor selecciona una universidad',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            )
            : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderGreyColor),
              ),
              child: Row(
                children: [
                  Image.network(
                    entry.selectedUniversity!.logoUrl,
                    height: 40,
                    width: 40,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            Icon(Icons.school, size: 40),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      entry.selectedUniversity!.name,
                      style: style16M,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),

        if (entry.selectedUniversity != null) ...[
          15.verticalSpace,

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '¿Carrera o área de especialización?',
                style: style16B.copyWith(color: lightBlackColor),
              ),
              Text(
                '*obligatorio',
                style: style14M.copyWith(color: textGreyColor),
              ),
            ],
          ),
          5.verticalSpace, // For date dropdowns
          TextFormField(
            decoration: authFieldDecoration.copyWith(
              hintText: 'Escribe tus estudios',
              errorText:
                  entry.careerError && model.isFormValid == false
                      ? 'Por favor ingresa tu carrera'
                      : null,
              errorStyle: TextStyle(color: Colors.red, fontSize: 12),
            ),
            onChanged: (value) {
              model.setCareer(value, index);
              model.updateFormValidity();
            },
          ),

          20.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Grado de especialización',
                style: style16B.copyWith(color: lightBlackColor),
              ),
              Text(
                '*obligatorio',
                style: style14M.copyWith(color: textGreyColor),
              ),
            ],
          ),
          5.verticalSpace, // For date dropdowns
          // For degree dropdown
          _buildDropdown(
            context,
            entry.dropDown1Open,
            entry.dropDown1Error, // Pass the error state
            entry.degree ?? '',
            model.firstDropdown,
            toggle: () {
              model.toggleDropDown1(index);
            },
            onItemTap: (value) {
              model.setDegree(value, index);
              model.toggleDropDown1(index);
              model.setDropDown1Error(false, index);
              model.updateFormValidity();
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: entry.isCurrent,
                onChanged: (value) {
                  model.setIsCurrent(value ?? false, index);

                  model.validateAllEntries(); // Trigger validation after change
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
              Text(
                "Actualmente lo sigo cursando",
                style: style14M.copyWith(color: textDarkGreyColor),
              ),
            ],
          ),
          5.verticalSpace,

          // First row of two dropdowns
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fecha de Inicio',
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
                      style: style16B.copyWith(color: darkPurpleColor),
                    ),
                    1.verticalSpace,
                    _buildDateDropdown(
                      context,
                      entry.dropDown2Open,
                      entry.dropDown2Error, // Pass error state
                      entry.startMonth ?? "Selecciona",
                      model.secondDropDown,
                      toggle: () {
                        model.toggleDropDown2(index);
                      },
                      onItemTap: (value) {
                        model.setStartMonth(value, index);
                        model.toggleDropDown2(index);
                        model.setDropDown2Error(false, index);
                        model.updateFormValidity();
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
                      style: style16B.copyWith(color: darkPurpleColor),
                    ),
                    1.verticalSpace,
                    _buildDateDropdown(
                      context,
                      entry.dropDown3Open,
                      entry.dropDown3Error,
                      entry.startYear ?? "Selecciona",
                      model.thirdDropDown,
                      toggle: () {
                        model.toggleDropDown3(index);
                      },
                      onItemTap: (value) {
                        model.setStartYear(value, index);
                        model.toggleDropDown3(index);
                        model.setDropDown3Error(false, index);
                        model.updateFormValidity();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Second row of two dropdowns
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                entry.isCurrent
                    ? "Fecha de Finalización (Deseada)"
                    : 'Fecha de Finalización',
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
                      style: style16B.copyWith(color: darkPurpleColor),
                    ),
                    1.verticalSpace,
                    _buildDateDropdown(
                      context,
                      entry.dropDown4Open,
                      entry.dropDown4Error,
                      entry.endMonth ?? "Selecciona",
                      model.secondDropDown,
                      toggle: () {
                        model.toggleDropDown4(index);
                      },
                      onItemTap: (value) {
                        model.setEndMonth(value, index);
                        model.toggleDropDown4(index);
                        model.setDropDown4Error(false, index);
                        model.updateFormValidity();
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
                      style: style16B.copyWith(color: darkPurpleColor),
                    ),
                    1.verticalSpace,
                    _buildDateDropdown(
                      context,
                      entry.dropDown5Open,
                      entry.dropDown5Error,
                      entry.endYear ?? "Selecciona",
                      model.thirdDropDown,
                      toggle: () {
                        model.toggleDropDown5(index);
                      },
                      onItemTap: (value) {
                        model.setEndYear(value, index);
                        model.toggleDropDown5(index);
                        model.setDropDown5Error(false, index);
                        model.updateFormValidity();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (index == model.universityEntries.length - 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    model.addUniversityEntry();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: darkPurpleColor, width: 2),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 5.h,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Agregar otra experiencia',
                            style: style16M.copyWith(color: lightBlackColor),
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
                GestureDetector(
                  onTap: () {
                    model.removeUniversityEntry(index);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.deleteIcon, scale: 4.5),
                      10.horizontalSpace,
                      Text(
                        'Borrar estudio',
                        style: style16M.copyWith(color: darkPurpleColor),
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            GestureDetector(
              onTap: () {
                model.removeUniversityEntry(index);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.deleteIcon, scale: 4.5),
                  10.horizontalSpace,
                  Text(
                    'Borrar estudio',
                    style: style16M.copyWith(color: darkPurpleColor),
                  ),
                ],
              ),
            ),

          // Show divider only if this is not the last entry
          if (index < model.universityEntries.length - 1)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(AppAssets.dividerImage, scale: 3),
            ),
        ],
      ],
    );
  }

  Widget _buildDropdown(
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
          borderColor:
              hasError
                  ? Colors.red
                  : lightBlackColor, // Change border color on error
          hasDroppedDown: isDroppedDown,
          onTap: toggle!,
          text: text.isEmpty ? '--Selecciona uno--' : text,
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
          onItemTap: (val) => onItemTap!(val),
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
          text: text.isEmpty ? '--Selecciona uno--' : text,
        ),
        if (hasError)
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              'field_required'.tr,
              style: TextStyle(color: primaryColor, fontSize: 12),
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
}

class UniversityModel {
  final String name;
  final String logoUrl;

  UniversityModel({required this.name, required this.logoUrl});
}
