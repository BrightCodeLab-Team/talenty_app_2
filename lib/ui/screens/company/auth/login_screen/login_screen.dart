import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart' show AppAssets;
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/header/header.dart';
import 'package:talenty_app/ui/screens/candidate/candidat_root/candidate_root_screen.dart';
import 'package:talenty_app/ui/screens/company/root/root_screen.dart';
import '../../../../custom_widgets/paddings_and_margins/custom_padding.dart';
import '../resgister_screen/register_screen.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.isCadidate});
  final bool isCadidate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// Start Body
      ///
      body: ChangeNotifierProvider(
        create: (_) => LoginViewModel(isCandidate: isCadidate),
        child: Consumer<LoginViewModel>(
          builder: (context, model, child) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: CustomPadding(
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      children: [
                        45.verticalSpace,

                        ///
                        /// Header
                        ///
                        Header(),
                        7.verticalSpace,
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          transitionBuilder:
                              (child, animation) => ScaleTransition(
                                scale: animation,
                                child: child,
                              ),

                          child: Text(
                            model.isCandidate
                                ? 'login_tagline_candidate'.tr
                                : 'login_tagline_recruiter'.tr,
                            key: ValueKey<bool>(model.isCandidate),
                            textAlign: TextAlign.center,
                            style: style14M.copyWith(color: lightBlackColor),
                          ),
                        ),
                        7.verticalSpace,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'login_title'.tr,
                            style: style24M.copyWith(color: blackColor),
                          ),
                        ),
                        17.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  model.setIsCandidate(true);
                                },
                                child: OptionContainer(
                                  text: 'btn_candidate'.tr,
                                  backgroundColor:
                                      model.isCandidate
                                          ? primaryColor
                                          : skinColor,
                                  icon: AppAssets.candidatoIcon,
                                  textColor:
                                      model.isCandidate
                                          ? whiteColor
                                          : lightBlackColor,
                                ),
                              ),
                            ),
                            5.horizontalSpace,
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  model.setIsCandidate(false);
                                },
                                child: OptionContainer(
                                  text: 'btn_recruiter'.tr,
                                  backgroundColor:
                                      model.isCandidate
                                          ? skinColor
                                          : primaryColor,
                                  icon: AppAssets.reclutadorIcon,
                                  iconWidth: 24,
                                  iconHeight: 19,
                                  textColor:
                                      model.isCandidate
                                          ? lightBlackColor
                                          : whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        17.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'label_email'.tr,
                              style: style16M.copyWith(
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            ),
                            Text(
                              'label_required'.tr,
                              style: style14M.copyWith(color: textGreyColor),
                            ),
                          ],
                        ),
                        4.verticalSpace,
                        // Email Text Field
                        TextFormField(
                          controller: model.emailController,
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'hint_email'.tr,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enterValidEmail'.tr;
                            }
                            if (!model.emailRegEx.hasMatch(value)) {
                              return 'invalidEmail'.tr;
                            }
                            return null;
                          },
                        ),
                        16.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'label_password'.tr,
                              style: style16M.copyWith(
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            ),
                            Text(
                              'label_required'.tr,
                              style: style14M.copyWith(color: textGreyColor),
                            ),
                          ],
                        ),
                        4.verticalSpace,
                        // Password Text Field
                        TextFormField(
                          controller: model.passwordController,
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'hint_password'.tr,

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
                                    model.isHidden
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
                          obscureText: model.isHidden,
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value!.isEmpty || value.trim().isEmpty) {
                              return 'enterValidPassword'.tr;
                            } else if (value.length < 6) {
                              return ("invalidPassword".tr);
                            } else {
                              return null;
                            }
                          },
                        ),
                        30.verticalSpace,
                        CustomButton(
                          text: 'login_title'.tr,
                          onTap: () {
                            if (model.formKey.currentState!.validate()) {
                              if (model.isCandidate) {
                                Get.to(() => CandidateRootScreen());
                              } else {
                                Get.to(() => RootScreen());
                              }
                            }
                          },

                          backgroundColor:
                              (model.canSubmit) ? primaryColor : greyColor,
                        ),
                        20.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: brownColor,
                                thickness: 1,
                                endIndent: 5,
                              ),
                            ),
                            Text(
                              'OR',
                              style: TextStyle(
                                color: brownColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: brownColor,
                                thickness: 1,
                                indent: 5,
                              ),
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          height: model.isCandidate ? 125 : 120,
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            transitionBuilder:
                                (child, animation) => ScaleTransition(
                                  scale: animation,
                                  child: child,
                                ),
                            child:
                                model.isCandidate
                                    ? SizedBox(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 54,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color(0xFFADADAD),
                                              ),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    AppAssets.googleIcon,
                                                    width: 19.31,
                                                    height: 20,
                                                  ),
                                                  15.horizontalSpace,
                                                  Text(
                                                    'btn_google'.tr,
                                                    style: style16M,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          12.verticalSpace,
                                          Container(
                                            height: 54,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color(0xFFADADAD),
                                              ),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    AppAssets.appleIcon,
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  15.horizontalSpace,
                                                  Text(
                                                    'btn_apple'.tr,
                                                    style: style16M,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    : RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: style16M,
                                        children: [
                                          TextSpan(
                                            text: 'login_recruiter_prefix'.tr,
                                          ),
                                          TextSpan(
                                            text:
                                                'login_recruiter_highlight'.tr,
                                            style: style16M.copyWith(
                                              color: brownColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'login_recruiter_suffix'.tr,
                                          ),
                                        ],
                                      ),
                                    ),
                          ),
                        ),
                        10.verticalSpace,
                        RichText(
                          text: TextSpan(
                            style: style16M,
                            children: [
                              TextSpan(text: 'no_account'.tr),
                              TextSpan(
                                text:
                                    model.isCandidate
                                        ? 'action_create_account'.tr
                                        : 'action_register_company'.tr,
                                style: style16M.copyWith(
                                  color: brownColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        if (model.isCandidate) {
                                        } else {
                                          Get.to(() => RegistroEmpresaScreen());
                                        }
                                      },
                              ),
                            ],
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.iconWidth,
    this.iconHeight,
  });

  final String text;
  final String icon;
  final Color backgroundColor;
  final Color textColor;
  final double? iconWidth;
  final double? iconHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 5),
      duration: Duration(milliseconds: 300),
      width: 158,
      height: 146,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: backgroundColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: iconWidth ?? 15,
              height: iconHeight ?? 16,
              color: textColor,
            ),
            12.verticalSpace,
            Text(
              text,
              textAlign: TextAlign.center,
              style: style14M.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
