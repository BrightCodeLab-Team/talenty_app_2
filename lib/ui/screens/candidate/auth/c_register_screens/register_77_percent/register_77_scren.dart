import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/Containers/progress_container.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_77_percent/register_77_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_88_percent/register_88_screen.dart';

class Candidate77PercentScreen extends StatelessWidget {
  Candidate77PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister77percentViewModel(),
      child: Consumer<CandidateRegister77percentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(
                  text: 'Continuar',
                  onTap: () {
                    Get.to(Candidate88PercentScreen());
                  },
                ),
              ),
              appBar: AppBar(
                leading: CustomBackButton(position: false),
                centerTitle: true,
                title: Image.asset(
                  AppAssets.appLogo2,
                  scale: 4,
                  height: 40.h,
                  width: 134.w,
                ),
                backgroundColor: transparent,
              ),

              ///
              /// Start of the body
              ///
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.verticalSpace,

                        Center(
                          child: Text(
                            '77%',
                            style: style16M.copyWith(color: lightBlackColor),
                          ),
                        ),

                        ///
                        /// progress indecatoe 77 percent
                        ///
                        4.verticalSpace,
                        ProgressContainer(
                          progressWidth:
                              MediaQuery.of(context).size.width * 0.77,
                        ),
                        20.verticalSpace,

                        ///
                        /// Header
                        ///
                        _header(),

                        ///
                        ///
                        ///
                        20.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: greyColor, width: 1.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  15.verticalSpace,
                                  Text(
                                    '🇨🇳 Chino mandarín',
                                    style: style20B.copyWith(),
                                  ),
                                  15.verticalSpace,
                                  Text(
                                    'Describe qué tanto dominio tienes en éste idioma.',
                                    style: style16M.copyWith(
                                      color: lightBlackColor2,
                                    ),
                                  ),
                                  20.verticalSpace,

                                  ///
                                  /// First DropDown
                                  ///
                                  GestureDetector(
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 1,
                                          color: borderGreyColor,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          model.selectedLevel ==
                                                  'Selecciona tu nivel'
                                              ? Icon(
                                                Icons.touch_app_outlined,
                                                size: 25,
                                                color: lightBlackColor,
                                              )
                                              : Container(),
                                          10.horizontalSpace,
                                          Text(
                                            model.selectedLevel,
                                            style: GoogleFonts.roboto(
                                              textStyle: style16M.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: lightBlackColor,
                                              ),
                                            ),
                                          ),
                                          10.horizontalSpace,
                                          PopupMenuButton(
                                            popUpAnimationStyle: AnimationStyle(
                                              curve: Curves.easeInOut,
                                            ),
                                            icon:
                                                model.isFirstDropDownOpen ==
                                                        false
                                                    ? Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color: lightBlackColor,
                                                    )
                                                    : Icon(
                                                      Icons
                                                          .keyboard_arrow_up_rounded,
                                                      color: lightBlackColor,
                                                    ),
                                            offset: Offset(
                                              // MediaQuery.of(
                                              //       context,
                                              //     ).size.width *
                                              //     0.17,
                                              model.selectedLevel ==
                                                      'Selecciona tu nivel'
                                                  ? MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.12
                                                  : model.selectedLevel ==
                                                      '🗨️  Básico'
                                                  ? MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.22
                                                  : model.selectedLevel ==
                                                      '🗣️ Intermedio'
                                                  ? MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.2
                                                  : model.selectedLevel ==
                                                      '🧠 Avanzado'
                                                  ? MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.2
                                                  : model.selectedLevel ==
                                                      '📚  Nativo'
                                                  ? MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.22
                                                  : 0,
                                              55.0,
                                            ),

                                            constraints: BoxConstraints(
                                              minWidth: 65.w,
                                              maxWidth:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.82,
                                            ),
                                            color: Colors.transparent,
                                            clipBehavior: Clip.none,
                                            elevation: 0,
                                            onOpened: () {
                                              model.setFirstDropdown(true);
                                            },
                                            onCanceled: () {
                                              Future.delayed(
                                                Duration(milliseconds: 200),
                                                () {
                                                  model.setFirstDropdown(false);
                                                },
                                              );
                                            },
                                            onSelected: (value) {
                                              model.setSelectedLevel(value);
                                              Future.delayed(
                                                Duration(milliseconds: 200),
                                                () {
                                                  model.setFirstDropdown(false);
                                                },
                                              );
                                            },

                                            itemBuilder: (
                                              BuildContext context,
                                            ) {
                                              final screenWidth =
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width;
                                              final containerWidth =
                                                  screenWidth - 60;
                                              return <PopupMenuEntry<String>>[
                                                PopupMenuItem<String>(
                                                  value: '🗨️  Básico',
                                                  child: buildDropdownItem(
                                                    icon:
                                                        Icons
                                                            .record_voice_over_outlined,
                                                    text: '🗨️  Básico',
                                                    containerWidth:
                                                        containerWidth,
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: '🗣️ Intermedio',
                                                  child: buildDropdownItem(
                                                    containerWidth:
                                                        containerWidth,
                                                    icon:
                                                        Icons
                                                            .record_voice_over_outlined,
                                                    text: '🗣️ Intermedio',
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: '🧠 Avanzado',
                                                  child: buildDropdownItem(
                                                    containerWidth:
                                                        containerWidth,
                                                    icon: Icons.school_outlined,
                                                    text: '🧠 Avanzado',
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: '📚  Nativo',
                                                  child: buildDropdownItem(
                                                    containerWidth:
                                                        containerWidth,
                                                    icon:
                                                        Icons
                                                            .menu_book_outlined,
                                                    text: '📚  Nativo',
                                                  ),
                                                ),
                                              ];
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  model.isFirstDropDownOpen == true
                                      ? 250.verticalSpace
                                      : 0.verticalSpace,
                                ],
                              ),
                            ),
                          ),
                        ),

                        // CustomButton(
                        //   text: 'Continuar',
                        //   onTap: () {
                        //     Get.to(Candidate88PercentScreen());
                        //   },
                        // ),
                        // 60.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///. drop Down item
  ///
  Widget buildDropdownItem({
    required IconData icon,
    required String text,
    required double containerWidth,
    Color iconColor = lightBlackColor,
    Color textColor = lightBlackColor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.h),
      width: containerWidth,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _header() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: darkPurpleColor, width: 1.w),
      boxShadow: [
        BoxShadow(
          color: darkPurpleColor,
          offset: Offset(-1.w, 2.w),
          blurRadius: 0,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '¿Qué tanto los hablas?',
            style: style20B.copyWith(color: darkPurpleColor),
          ),
          8.verticalSpace,
          Text(
            'Especifica tu nivel de dominio en cada idioma. Esto permitirá a los reclutadores identificar si tu perfil se ajusta a las vacantes disponibles.',
            style: style14M.copyWith(
              color: textLightGreyColor,
            ), // textGreyColor for the description
            textAlign: TextAlign.start,
          ),
          8.verticalSpace,
        ],
      ),
    ),
  );
}
