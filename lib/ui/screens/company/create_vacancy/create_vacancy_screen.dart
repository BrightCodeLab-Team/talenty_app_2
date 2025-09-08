// ignore_for_file: use_key_in_widget_constructors, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/company/create_vacancy/create_vacancy_view_model.dart';

class CreateVacancyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateVacancyViewModel(),
      child: Consumer<CreateVacancyViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 25.w,
                  vertical: 10.h,
                ),
                child: CustomButton(
                  text: 'Crear reclutador',
                  backgroundColor:
                      model.areAllFieldsFilled() ? primaryColor : greyColor,
                  onTap: () {
                    if (model.validateForm()) {
                      // Add your navigation or form submission logic here
                    } else {
                      // Show error message if form is not valid
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Por favor completa todos los campos correctamente',
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  image: Image.asset(
                    AppAssets.createVacIconIcon,
                    height: 20,
                    width: 20,
                    color: whiteColor,
                  ),
                ),
              ),
              appBar: AppBar(
                backgroundColor: transparent,
                leading: CustomBackButton(position: false),
                title: Image.asset(
                  AppAssets.appLogo2,
                  scale: 4,
                  height: 40.h,
                  width: 134.w,
                ),
                centerTitle: true,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        30.verticalSpace,
                        Text('Crear Reclutador'.tr, style: style24M),
                        20.verticalSpace,
                        Text(
                          'Crea nuevos reclutadores ingresando su información básica.'
                              .tr,
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                        20.verticalSpace,

                        // First Name Field
                        Text(
                          'Nombre(s)',
                          style: style16M.copyWith(fontWeight: FontWeight.w600),
                        ),
                        4.verticalSpace,
                        TextFormField(
                          controller: model.firstNameController,
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'Escribe los nombre(s)'.tr,
                          ),
                          onChanged: (_) => model.notifyListeners(),
                        ),
                        10.verticalSpace,

                        // Last Name Fields
                        Text(
                          'Apellidos',
                          style: style16M.copyWith(fontWeight: FontWeight.w600),
                        ),
                        4.verticalSpace,
                        TextFormField(
                          controller: model.lastNameController,
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'Apellido paterno'.tr,
                          ),
                          onChanged: (_) => model.notifyListeners(),
                        ),
                        4.verticalSpace,
                        TextFormField(
                          controller: model.motherLastNameController,
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'Apellido materno'.tr,
                          ),
                          onChanged: (_) => model.notifyListeners(),
                        ),
                        10.verticalSpace,

                        // Email Field
                        Text(
                          'Correo',
                          style: style16M.copyWith(fontWeight: FontWeight.w600),
                        ),
                        4.verticalSpace,
                        TextFormField(
                          controller: model.emailController,
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'Ingresa el correo'.tr,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (_) => model.notifyListeners(),
                        ),
                        10.verticalSpace,

                        // Password Field
                        Text(
                          'Contraseña',
                          style: style16M.copyWith(fontWeight: FontWeight.w600),
                        ),
                        4.verticalSpace,
                        TextFormField(
                          controller: model.passwordController,
                          obscureText: !model.isPasswordVisible,
                          decoration: authFieldDecoration.copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                model.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: textLightGreyColor,
                              ),
                              onPressed: model.togglePasswordVisibility,
                            ),
                            hintText: 'Ingresa la contraseña'.tr,
                          ),
                          onChanged: (_) => model.notifyListeners(),
                        ),
                        10.verticalSpace,
                        Text(
                          'Crea una contraseña segura de al menos 8 caracteres, incluyendo mayúsculas, minúsculas, números y símbolos.',
                          style: style14M.copyWith(color: textDarkGreyColor),
                        ),
                        15.verticalSpace,

                        // Confirm Password Field
                        Text(
                          'Confirmar contraseña',
                          style: style16M.copyWith(fontWeight: FontWeight.w600),
                        ),
                        4.verticalSpace,
                        TextFormField(
                          controller: model.confirmPasswordController,
                          obscureText: !model.isConfirmPasswordVisible,
                          decoration: authFieldDecoration.copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                model.isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: textLightGreyColor,
                              ),
                              onPressed: model.toggleConfirmPasswordVisibility,
                            ),
                            hintText: 'Confirma la contraseña'.tr,
                          ),
                          onChanged: (_) => model.notifyListeners(),
                        ),
                        30.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
