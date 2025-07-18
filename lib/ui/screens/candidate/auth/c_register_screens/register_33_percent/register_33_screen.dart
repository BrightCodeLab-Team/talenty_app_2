import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';

import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/Containers/progress_container.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_33_percent/register_33_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_44_percent/register_44_screen.dart';

class Candidate33PercentScreen extends StatelessWidget {
  const Candidate33PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister33PercentViewModel(),
      child: Consumer<CandidateRegister33PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(
                  text: 'Continuar',
                  onTap: () {
                    Get.to(Candidate33PercentScreen2());
                  },
                ),
              ),
              appBar: AppBar(
                backgroundColor: transparent,
                leading: Padding(
                  padding: EdgeInsetsGeometry.only(left: 15),
                  child: CustomBackButton(),
                ),
                centerTitle: true,
                title: Image.asset(AppAssets.appLogo2, scale: 4),
              ),
              body: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Center(
                        child: Text(
                          '33%',
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ),

                      ///
                      ///
                      ///
                      4.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.of(context).size.width * 0.33,
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
                          border: Border.all(color: blackColor, width: 1.w),
                          boxShadow: [
                            BoxShadow(
                              color: blackColor,
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
                                'Habilidades',
                                style: style20B.copyWith(color: blackColor),
                              ),
                              8.verticalSpace,
                              Text(
                                'Selecciona hasta 10 habilidades que mejor describan tu personalidad y capacidades técnicas.',
                                style: style14M.copyWith(
                                  color: textGreyColor,
                                ), // textGreyColor for the description
                                textAlign: TextAlign.start,
                              ),
                              8.verticalSpace,
                              Row(
                                children: [
                                  Text(''),
                                  Spacer(),
                                  Text(
                                    '0 de 10',
                                    style: style16B.copyWith(color: blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///
                      ///
                      ///
                      5.verticalSpace,
                      Text(
                        'Filtra por tipo de habilidad',
                        style: style16M.copyWith(color: textDarkGreyColor),
                      ),
                      5.verticalSpace,

                      ///
                      ///
                      ///
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          1.horizontalSpace,
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(28.r),
                                border: Border.all(
                                  color: blackColor,
                                  width: 2.w,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColor,
                                    offset: Offset(-1.w, 2.w),
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                                child: Center(
                                  child: Text(
                                    'Habilidades humanas ',
                                    style: style16M.copyWith(
                                      color: textGreyColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          5.horizontalSpace,
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(28.r),
                                border: Border.all(
                                  color: blackColor,
                                  width: 2.w,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColor,
                                    offset: Offset(-1.w, 2.w),
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                                child: Center(
                                  child: Text(
                                    'Habilidades técnicas ',
                                    style: style16M.copyWith(
                                      color: textGreyColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///
                      ///
                      ///
                      10.verticalSpace,

                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(28.r),
                            border: Border.all(color: blackColor, width: 2.w),
                            boxShadow: [
                              BoxShadow(
                                color: blackColor,
                                offset: Offset(-1.w, 2.w),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            child: TextFormField(
                              decoration: authFieldDecoration.copyWith(
                                hintText: 'Busca más habilidades',
                                hintStyle: style16M.copyWith(color: blackColor),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets
                                        .zero, // Remove default content padding from TextFormField)
                              ),
                            ),
                          ),
                        ),
                      ),
                      40.verticalSpace,
                      Wrap(
                        spacing: 4.w,
                        runSpacing: 5.h,
                        children: List.generate(model.tagItemsList.length, (
                          index,
                        ) {
                          return CustomShadowIconTextTag(
                            item: model.tagItemsList[index],
                          );
                        }),
                      ),
                      50.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

class Candidate33PercentScreen2 extends StatelessWidget {
  const Candidate33PercentScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: CustomButton(
          text: 'Continuar',
          onTap: () {
            Get.to(Candidate44PercentScreen());
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: transparent,
        leading: Padding(
          padding: EdgeInsetsGeometry.only(left: 15),
          child: CustomBackButton(),
        ),
        centerTitle: true,
        title: Image.asset(AppAssets.appLogo2, scale: 4),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            20.verticalSpace,
            Center(
              child: Text(
                '33%',
                style: style16M.copyWith(color: lightBlackColor),
              ),
            ),

            ///
            ///
            ///
            4.verticalSpace,
            ProgressContainer(
              progressWidth: MediaQuery.of(context).size.width * 0.33,
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
                border: Border.all(color: blackColor, width: 1.w),
                boxShadow: [
                  BoxShadow(
                    color: blackColor,
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
                      'Cuéntanos más de tus habilidades',
                      style: style20B.copyWith(color: blackColor),
                    ),
                    8.verticalSpace,
                    Text(
                      'Este espacio es para que nos compartas tus habilidades blandas y técnicas de forma libre. Describe tus capacidades en formato de lista.',
                      style: style14M.copyWith(
                        color: textGreyColor,
                      ), // textGreyColor for the description
                      textAlign: TextAlign.start,
                    ),
                    8.verticalSpace,
                    Row(
                      children: [
                        Text(''),
                        Spacer(),
                        Text(
                          'Máximo 500 caracteres',
                          style: style16B.copyWith(color: blackColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ///
            ///
            ///
            20.verticalSpace,
            Row(
              children: [
                Text(
                  'Acerca de mí',
                  style: style16B.copyWith(color: textDarkGreyColor),
                ),
                Spacer(),
                Text(
                  '0/500 caracteres',
                  style: style14M.copyWith(color: blackColor),
                ),
              ],
            ),
            10.verticalSpace,
            TextFormField(
              decoration: authFieldDecoration.copyWith(
                hintMaxLines: 20,
                hintText:
                    'Ej:¨• Creatividad para campañas digitales  • Gestión de redes sociales (Instagram, TikTok, LinkedIn)  • Edición básica de video y diseño gráfico con Canva  • Conocimientos en Google Ads y Meta Business Suite  • Estrategias de posicionamiento y branding  • Facilidad para comunicar ideas y trabajar en equipo.¨',
              ),
            ),
            30.verticalSpace,
            Text(
              'Máximo 500 caracteres',
              style: style14M.copyWith(color: textGreyColor),
            ),
          ],
        ),
      ),
    );
  }
}
