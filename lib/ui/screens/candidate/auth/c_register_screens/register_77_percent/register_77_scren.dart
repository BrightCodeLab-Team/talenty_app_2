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
  final List<Map<String, String>> selectedLanguages;

  const Candidate77PercentScreen({super.key, required this.selectedLanguages});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister77percentViewModel(),
      child: Consumer<CandidateRegister77percentViewModel>(
        builder:
            (context, model77, child) => Scaffold(
              // ... rest of your code remains the same
              bottomNavigationBar: bottomBarButton(model77),
              appBar: appBar(),

              ///
              /// body
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
                        // 77% progress bar text
                        Center(
                          child: Text(
                            '77%',
                            style: style16M.copyWith(color: lightBlackColor),
                          ),
                        ),
                        4.verticalSpace,
                        // progress container
                        ProgressContainer(
                          progressWidth:
                              MediaQuery.of(context).size.width * 0.77,
                        ),
                        20.verticalSpace,
                        // top container just blow progress bar
                        topMainContainer(),
                        20.verticalSpace,
                        _languageGrid(model77, context),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }

  // app bar
  AppBar appBar() {
    return AppBar(
      leading: CustomBackButton(position: false),
      centerTitle: true,
      title: Image.asset(
        AppAssets.appLogo2,
        scale: 4,
        height: 40.h,
        width: 134.w,
      ),
      backgroundColor: transparent,
    );
  }

  ///
  ///. top container just blow progress bar
  ///
  Container topMainContainer() {
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

  ///
  /// Language grid with dropdowns
  ///
  Widget _languageGrid(
    CandidateRegister77percentViewModel model77,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: List.generate(selectedLanguages.length, (index) {
          final language = selectedLanguages[index];
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10.h),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: greyColor, width: 1.2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.verticalSpace,
                  Text(language['text'] ?? '', style: style20B.copyWith()),
                  15.verticalSpace,
                  Text(
                    'Describe qué tanto dominio tienes en éste idioma.',
                    style: style16M.copyWith(color: lightBlackColor2),
                  ),
                  20.verticalSpace,

                  ///
                  ///. Dropdown for language proficiency
                  ///
                  GestureDetector(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: borderGreyColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          model77.getLanguageLevel(index) ==
                                  'Selecciona tu nivel'
                              ? Image.asset(
                                AppAssets.tablerHandClick,
                                height: 20.h,
                                width: 17.w,
                              )
                              : Container(),
                          10.horizontalSpace,
                          Text(
                            model77.getLanguageLevel(index),
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
                                model77.isLanguageDropdownOpen(index) == false
                                    ? Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: lightBlackColor,
                                    )
                                    : Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                      color: lightBlackColor,
                                    ),
                            offset: Offset(
                              model77.getLanguageLevel(index) ==
                                      'Selecciona tu nivel'
                                  ? MediaQuery.of(context).size.width * 0.12
                                  : model77.getLanguageLevel(index) ==
                                      '🗨️  Básico'
                                  ? MediaQuery.of(context).size.width * 0.22
                                  : model77.getLanguageLevel(index) ==
                                      '🗣️ Intermedio'
                                  ? MediaQuery.of(context).size.width * 0.2
                                  : model77.getLanguageLevel(index) ==
                                      '🧠 Avanzado'
                                  ? MediaQuery.of(context).size.width * 0.2
                                  : model77.getLanguageLevel(index) ==
                                      '📚  Nativo'
                                  ? MediaQuery.of(context).size.width * 0.22
                                  : 0,
                              55.0,
                            ),

                            constraints: BoxConstraints(
                              minWidth: 65.w,
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.82,
                            ),
                            color: Colors.transparent,
                            clipBehavior: Clip.none,
                            elevation: 0,
                            onOpened: () {
                              model77.setLanguageDropdownOpen(index, true);
                            },
                            onCanceled: () {
                              Future.delayed(Duration(milliseconds: 200), () {
                                model77.setLanguageDropdownOpen(index, false);
                              });
                            },
                            onSelected: (value) {
                              model77.setLanguageLevel(index, value);
                              Future.delayed(Duration(milliseconds: 200), () {
                                model77.setLanguageDropdownOpen(index, false);
                              });
                            },

                            itemBuilder: (BuildContext context) {
                              final screenWidth =
                                  MediaQuery.of(context).size.width;
                              final containerWidth = screenWidth - 60;
                              return <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: '🗨️  Básico',
                                  child: buildDropdownItem(
                                    icon: Icons.record_voice_over_outlined,
                                    text: '🗨️  Básico',
                                    containerWidth: containerWidth,
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: '🗣️ Intermedio',
                                  child: buildDropdownItem(
                                    containerWidth: containerWidth,
                                    icon: Icons.record_voice_over_outlined,
                                    text: '🗣️ Intermedio',
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: '🧠 Avanzado',
                                  child: buildDropdownItem(
                                    containerWidth: containerWidth,
                                    icon: Icons.school_outlined,
                                    text: '🧠 Avanzado',
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: '📚  Nativo',
                                  child: buildDropdownItem(
                                    containerWidth: containerWidth,
                                    icon: Icons.menu_book_outlined,
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

                  model77.isLanguageDropdownOpen(index) == true
                      ? 250.verticalSpace
                      : 0.verticalSpace,
                ],
              ),
            ),
          );
        }),
      ),
    );
  } // button at the bottom

  // button at the bottom
  Padding bottomBarButton(CandidateRegister77percentViewModel model77) {
    return Padding(
      padding: EdgeInsetsGeometry.all(15),
      child: CustomButton(
        text: 'Continuar',
        backgroundColor:
            model77.areAllLevelsSelected(
                  selectedLanguages.length,
                ) // Change this
                ? primaryColor
                : greyColor,
        onTap: () {
          if (model77.areAllLevelsSelected(selectedLanguages.length)) {
            Get.to(Candidate88PercentScreen());
          } else {
            // Show error message
            ScaffoldMessenger.of(Get.context!).showSnackBar(
              SnackBar(
                content: Text(
                  'Por favor selecciona un nivel para todos los idiomas',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
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
