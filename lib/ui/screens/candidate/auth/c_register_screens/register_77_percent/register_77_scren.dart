import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
  const Candidate77PercentScreen({super.key});

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
                leading: Padding(
                  padding: EdgeInsetsGeometry.only(left: 15),
                  child: CustomBackButton(),
                ),
                centerTitle: true,
                title: Image.asset(AppAssets.appLogo2, scale: 4),
                backgroundColor: transparent,
              ),
              body: Padding(
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
                      ///
                      ///
                      4.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.of(context).size.width * 0.77,
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
                          border: Border.all(
                            color: darkPurpleColor,
                            width: 1.w,
                          ),
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 16.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '¿Qué tanto los hablas?',
                                style: style20B.copyWith(
                                  color: darkPurpleColor,
                                ),
                              ),
                              8.verticalSpace,
                              Text(
                                'Especifica tu nivel de dominio en cada idioma. Esto permitirá a los reclutadores identificar si tu perfil se ajusta a las vacantes disponibles.',
                                style: style14M.copyWith(
                                  color: textGreyColor,
                                ), // textGreyColor for the description
                                textAlign: TextAlign.start,
                              ),
                              8.verticalSpace,
                            ],
                          ),
                        ),
                      ),

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
                                GestureDetector(
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: greyColor,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.touch_app_outlined,
                                          size: 25,
                                          color: lightBlackColor,
                                        ),
                                        10.horizontalSpace,
                                        Text(
                                          'Conoce más',
                                          style: GoogleFonts.roboto(
                                            textStyle: style16M.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: lightBlackColor,
                                            ),
                                          ),
                                        ),
                                        10.horizontalSpace,
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: lightBlackColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

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
                                  '🇲🇽 Español ',
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
                                GestureDetector(
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: greyColor,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.touch_app_outlined,
                                          size: 25,
                                          color: lightBlackColor,
                                        ),
                                        10.horizontalSpace,
                                        Text(
                                          'Conoce más',
                                          style: GoogleFonts.roboto(
                                            textStyle: style16M.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: lightBlackColor,
                                            ),
                                          ),
                                        ),
                                        10.horizontalSpace,
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: lightBlackColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      50.verticalSpace,
                    ],

                    ///
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
