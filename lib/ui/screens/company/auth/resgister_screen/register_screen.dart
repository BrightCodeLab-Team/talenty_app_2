// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/header/header.dart';
import 'package:talenty_app/ui/screens/company/auth/otp_screen/otp_screen.dart';

import '../../../../../core/constants/auth_field_decoration.dart';
import '../../../../custom_widgets/buttons/custom_buttons.dart';
import '../../../../custom_widgets/paddings_and_margins/custom_padding.dart';
import 'register_screen_view_model.dart';

class RegistroEmpresaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterViewModel>(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            // floatingActionButton:
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerFloat,

            ///
            ///
            body: SingleChildScrollView(
              child: CustomPadding(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      45.verticalSpace,
                      Header(),
                      25.verticalSpace,
                      Text('register_company_title'.tr, style: style24M),
                      20.verticalSpace,
                      Text(
                        'register_company_description'.tr,
                        maxLines: 3,
                        style: style14M.copyWith(color: textDarkGreyColor),
                      ),
                      20.verticalSpace,
                      Text(
                        'label_email'.tr,
                        style: style16M.copyWith(fontWeight: FontWeight.w600),
                      ),
                      4.verticalSpace,
                      TextFormField(
                        controller: model.emailController,
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'hint_email'.tr,
                          errorText: model.emailError,
                        ),
                        // validator: (_) => model.validateEmail(),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      16.verticalSpace,
                      Text(
                        'label_password'.tr,
                        style: style16M.copyWith(fontWeight: FontWeight.w600),
                      ),
                      4.verticalSpace,
                      TextFormField(
                        controller: model.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        // validator: (_) => model.validatePassword(),
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'hint_password'.tr,
                          errorText: model.passwordError,

                          suffixIcon: InkWell(
                            onTap: () {
                              model.toggleHidden();
                            },
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                );
                              },
                              child:
                                  model.isPasswordHidden
                                      ? Icon(
                                        Icons.visibility_off,
                                        key: ValueKey('visibility_off'),
                                        color: Color(0xff707070),
                                        size: 20,
                                      )
                                      : Icon(
                                        Icons.visibility,
                                        key: ValueKey('visibility'),
                                        color: Color(0xff707070),
                                        size: 20,
                                      ),
                            ),
                          ),
                        ),
                        obscureText: model.isPasswordHidden,
                      ),

                      4.verticalSpace,

                      Text(
                        'register_company_password_info'.tr,
                        maxLines: 3,
                        style: style14M.copyWith(color: textDarkGreyColor),
                      ),
                      16.verticalSpace,
                      Text(
                        'register_company_confirm_password_label'.tr,
                        style: style16M.copyWith(fontWeight: FontWeight.w600),
                      ),
                      4.verticalSpace,
                      TextFormField(
                        controller: model.confirmPasswordController,

                        // validator: (_) => model.validateConfirmPassword(),
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'register_company_confirm_password_hint'.tr,
                          errorText: model.confirmError,
                          suffixIcon: InkWell(
                            onTap: () {
                              model.toggleConfirmPasswordHidden();
                            },
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                );
                              },
                              child:
                                  model.isConfirmPasswordHidden
                                      ? Icon(
                                        Icons.visibility_off,
                                        key: ValueKey('visibility_off'),
                                        color: Color(0xff707070),
                                        size: 20,
                                      )
                                      : Icon(
                                        Icons.visibility,
                                        key: ValueKey('visibility'),
                                        color: Color(0xff707070),
                                        size: 20,
                                      ),
                            ),
                          ),
                        ),
                        obscureText: model.isConfirmPasswordHidden,
                      ),
                      100.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),

            ///
            /// Floating Button
            ///
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15,
              ),
              child: CustomButton(
                onTap: () {
                  model.validateFormFields(); // <-- Set error flags true
                  final isValid =
                      model.formKey.currentState?.validate() ?? false;
                  if (isValid && model.canSubmit) {
                    Get.to(() => OtpScreen(email: model.emailController.text));
                  }
                },
                text: 'btn_continue'.tr,
                backgroundColor: model.canSubmitReg ? primaryColor : greyColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
