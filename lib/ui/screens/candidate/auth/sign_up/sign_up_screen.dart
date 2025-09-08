// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/enums/user_roles.dart';
import 'package:talenty_app/core/enums/view_state.dart';
import 'package:talenty_app/ui/custom_widgets/header/header.dart';
import 'package:talenty_app/ui/screens/candidate/auth/sign_up/sign_up_view_model.dart';
import '../../../../../core/constants/auth_field_decoration.dart';
import '../../../../custom_widgets/buttons/custom_buttons.dart';
import '../../../../custom_widgets/paddings_and_margins/custom_padding.dart';

class CandidateSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CandidateSignUpViewModel(),
      child: Consumer<CandidateSignUpViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            // floatingActionButton:
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerFloat,

            ///
            ///
            body: SafeArea(
              child: SingleChildScrollView(
                child: CustomPadding(
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        45.verticalSpace,
                        Header(height: 28.h, width: 115.w),
                        25.verticalSpace,
                        Text('create_an_account'.tr, style: style24M),
                        20.verticalSpace,

                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'enter_your_email'.tr,
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
                          controller: model.emailController,
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'hint_email'.tr,
                            errorText: model.emailError,
                          ),
                          onChanged: (value) {
                            model.appUser.email = value;
                          },
                          // validator: (_) => model.validateEmail(),
                          keyboardType: TextInputType.emailAddress,
                        ),

                        16.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'password_create_account'.tr,
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
                          controller: model.passwordController,
                          keyboardType: TextInputType.visiblePassword,

                          // validator: (_) => model.validatePassword(),
                          onChanged: (value) {
                            model.appUser.password = value;
                          },
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

                        10.verticalSpace,

                        Text(
                          'register_company_password_info'.tr.tr,
                          maxLines: 3,
                          style: style14M.copyWith(color: textDarkGreyColor),
                        ),
                        16.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Confirma tu contraseña'.tr,
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
                          controller: model.confirmPasswordController,
                          onChanged: (value) {
                            model.appUser.confirmPassword = value;
                          },
                          // validator: (_) => model.validateConfirmPassword(),
                          decoration: authFieldDecoration.copyWith(
                            hintText:
                                'register_company_confirm_password_hint'.tr,
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
                isLoading: model.state == ViewState.busy,
                onTap: () {
                  model.validateFormFields(); // <-- Set error flags true
                  final isValid =
                      model.formKey.currentState?.validate() ?? false;
                  if (isValid && model.canSubmit) {
                    model.appUser.role = UserRole.candidate;
                    print("appUser Data SingUp==> ${model.appUser.toJson()}");
                    model.registerUser();
                    // Get.to(
                    //   () =>
                    //       CandidateOTPScreen(email: model.emailController.text),
                    // );
                  }
                },
                text: 'btn_continue',
                backgroundColor: model.canSubmit ? primaryColor : greyColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
