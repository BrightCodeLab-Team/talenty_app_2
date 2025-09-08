import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_11_screen.dart';

class CandidateProfileReadyScreen extends StatelessWidget {
  const CandidateProfileReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: CustomButton(
          text: 'Completar mi currículum',
          onTap: () {
            Get.to(CandidateRegister11PercentScreen());
          },
          backgroundColor: primaryColor,
        ),
      ),
      appBar: AppBar(
        backgroundColor: transparent,
        leading: CustomBackButton(position: false),
        centerTitle: true,
        title: Image.asset(
          AppAssets.appLogo2,
          scale: 4,
          height: 40.h,
          width: 134.w,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¡Tu perfil está casi listo!',
                  style: style24M.copyWith(color: darkPurpleColor),
                ),
                10.verticalSpace,
                Text(
                  'Un currículum completo aumenta tus oportunidades de ser descubierto por el empleador ideal. Completa tu cuenta y destaca entre los mejores.',
                  style: style14M.copyWith(color: textGreyColor),
                  textAlign: TextAlign.start,
                ),
                10.verticalSpace,
                Text(
                  '¡Completa por una última vez tu CV!',
                  style: style16B.copyWith(color: textDarkGreyColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
