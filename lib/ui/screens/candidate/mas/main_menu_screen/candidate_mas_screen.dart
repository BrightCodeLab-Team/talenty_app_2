// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart'
    show CustomButton;
import 'package:talenty_app/ui/custom_widgets/menu_reuse/menu_reuse.dart';
import 'package:talenty_app/ui/screens/candidate/mas/availability_screen_3/availability_screen_3.dart';
import 'package:talenty_app/ui/screens/candidate/mas/block_companies/block_companies_screen.dart';
import 'package:talenty_app/ui/screens/candidate/mas/c_mas_deactivate_visibility_screen/deactivate_visibility_screen.dart';
import 'package:talenty_app/ui/screens/candidate/mas/candidate_profile.dart/candidate_profile_screen.dart';
import 'package:talenty_app/ui/screens/candidate/mas/delete_account/delete_account_screen.dart';
import 'package:talenty_app/ui/screens/candidate/mas/mas_calendar_screen/calendar_screen.dart';
import 'package:talenty_app/ui/screens/common/splash_screen.dart';
import 'package:talenty_app/ui/screens/company/further_menu/menu_view_model.dart';

class CandidateMasScreen extends StatefulWidget {
  const CandidateMasScreen({super.key});

  @override
  State<CandidateMasScreen> createState() => _CandidateMasScreenState();
}

class _CandidateMasScreenState extends State<CandidateMasScreen> {
  bool isDisponible = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuViewModel(),
      child: Consumer<MenuViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              /// Start Body
              ///
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// Profile
                      ///
                      _profile(),

                      Divider(color: dividerColor, thickness: 1),

                      ///
                      /// Title
                      ///
                      ///
                      30.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(
                          AppAssets.profileIcon,
                          height: 18.h,
                          width: 16.w,
                        ),
                        title: 'Visibilidad para las empresas',
                        onTap: () {
                          Get.to(() => DeactivateVisibilityScreen());
                        },
                      ),
                      isDisponible
                          ? Text(
                            'Tu perfil está visible actualmente.',
                            style: style14source.copyWith(
                              color: Colors.grey.shade700,
                            ),
                          )
                          : Text(
                            'Tu perfil está oculto actualmente.\nActívalo cuando estés listo para buscar nuevas oportunidades.',
                            style: style14source.copyWith(
                              color: textLightGreyColor,
                            ),
                          ),
                      30.verticalSpace,
                      Text(
                        'Mi Cuenta',
                        style: style16source.copyWith(
                          color: newColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      18.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(
                          AppAssets.menuCameraIcon,
                          height: 16.h,
                          width: 20.w,
                        ),
                        title: 'Disponibilidad Inmediata',
                        trailing: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isDisponible
                                    ? lightgreenColor1
                                    : const Color(0xFFFAD7D7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                height: 18.h,
                                width: 20.w,
                                isDisponible
                                    ? AppAssets.dispoCamera
                                    : AppAssets.noDispCamera,
                                color:
                                    isDisponible
                                        ? darkgreenColor
                                        : lightBrownColor2,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                isDisponible ? 'Disponible' : 'No disponible',
                                style: TextStyle(
                                  color:
                                      isDisponible
                                          ? darkgreenColor
                                          : lightBrownColor2,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          if (isDisponible) {
                            // If currently "Disponible", show deactivate dialog
                            Get.dialog(
                              DeactivateAvailabilityDialog(
                                onConfirmDeactivate: () {
                                  setState(() {
                                    isDisponible = false;
                                  });
                                  Get.back(); // Dismiss the dialog
                                },
                              ),
                            );
                          } else {
                            // If currently "No disponible", show activate dialog
                            Get.dialog(
                              ActivateAvailabilityDialog(
                                onConfirmActivate: () {
                                  setState(() {
                                    isDisponible = true;
                                  });
                                  Get.back(); // Dismiss the dialog
                                },
                              ),
                            );
                          }
                        },
                      ),
                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/calender.png',
                          height: 20.h,
                          width: 18.w,
                        ),
                        title: 'Mi calendario',
                        onTap: () {
                          Get.to(() => CandidateMasCalendarScreen());
                        },
                        //child: AnimatedContainer(duration: Duration()),
                      ),

                      MenuReuse(
                        leading: Image.asset(
                          AppAssets.watchIcon,
                          height: 20.h,
                          width: 20.w,
                        ),
                        title: 'Mi disponibilidad',
                        onTap: () {
                          Get.to(AvailabilityScreenThree());
                        },
                        // child: AnimatedContainer(duration: Duration()),
                      ),

                      20.verticalSpace,
                      //
                      Text(
                        'Privacidad y Seguridad',
                        style: style16source.copyWith(
                          color: newColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      //
                      18.verticalSpace,
                      //
                      MenuReuse(
                        leading: Image.asset(
                          AppAssets.BlockedCompaniesIcon,
                          height: 24.h,
                          width: 18.w,
                        ),
                        title: 'Empresas bloqueadas',
                        onTap: () {
                          Get.to(BlockedCompaniesScreen());
                        },
                        //child: AnimatedContainer(duration: Duration()),
                      ), //
                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/shield.png',
                          height: 20.h,
                          width: 16.w,
                        ),
                        title: 'Aviso de privacidad',
                        onTap: () {},
                        // child: AnimatedContainer(duration: Duration()),
                      ),

                      MenuReuse(
                        leading: Image.asset(
                          AppAssets.BlockedCompaniesIcon,
                          height: 24.h,
                          width: 18.w,
                        ),
                        title: 'tèrminos Condiciones',
                        onTap: () {},
                        // child: AnimatedContainer(duration: Duration()),
                      ),
                      20.verticalSpace,

                      Text('Administraciòn de cuenta', style: style16source),
                      10.verticalSpace,

                      MenuReuse(
                        leading: Image.asset(
                          AppAssets.deleteIcon,
                          height: 20.h,
                          width: 18.w,
                        ),
                        title: 'Eliminar cuenta',
                        onTap: () {
                          Get.to(CandidateDeleteAccountScreen());
                        },
                        textStyle: style14sourceblack.copyWith(
                          color: primaryColor,
                        ),
                        // child: AnimatedContainer(duration: Duration()),
                        trailingIconColor: primaryColor,
                      ),

                      MenuReuse(
                        leading: Icon(Icons.logout, color: primaryColor),
                        title: 'Tèrminos y condiciones',
                        onTap: () {
                          Get.offAll(() => SplashScreen());
                        },
                        //child: AnimatedContainer(duration: Duration()),
                        textStyle: style14sourceblack.copyWith(
                          color: primaryColor,
                        ),
                        trailingIconColor: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

_profile() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          Get.to(CandidateProfileScreen());
        },
        child: Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(AppAssets.img2),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      5.horizontalSpace,
      GestureDetector(
        onTap: () {
          Get.to(CandidateProfileScreen());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jorge Pérez', style: style24),
            4.verticalSpace,
            Row(
              children: [
                Text('Ver Perfil', style: style14source),
                SizedBox(width: 4.w),
                Icon(Icons.arrow_forward, color: lightBlackColor, size: 14),
              ],
            ),
          ],
        ),
      ),
      Spacer(),
      Image.asset(AppAssets.badgeIcon, scale: 4),
    ],
  );
}

///
///. dialog box (Original and new ones)
///

class DeleteAccountConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirmDelete;

  const DeleteAccountConfirmationDialog({
    Key? key,
    required this.onConfirmDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.appLogo2,
              height: 20.h,
              width: 114.w,
            ), // Talenty Logo
            20.verticalSpace,
            Text(
              'Activar disponibilidad inmediata',
              textAlign: TextAlign.center,
              style: style16B.copyWith(color: blackColor),
            ),
            10.verticalSpace,
            Text(
              'Al activarla, las empresas sabrán que estás disponible en todo momento.Si tu perfil les interesa podrán chatear, llamarte ó videollamarte de inmediato.',
              textAlign: TextAlign.center,
              style: style14M.copyWith(color: blackColor),
            ),
            30.verticalSpace,
            CustomButton(
              text: 'Activar',
              onTap: onConfirmDelete,
              backgroundColor: primaryColor, // Assuming primaryColor is red
              textColor: whiteColor,
              radius: 10.r,
            ),
            12.verticalSpace,
            CustomButton(
              text: 'Cancelar',
              onTap: () {
                Get.back(); // Dismiss the dialog
              },
              backgroundColor: Colors.transparent,
              textColor: blackColor,
              borderColor: blackColor,
              radius: 10.r,
            ),
          ],
        ),
      ),
    );
  }
}

class ActivateAvailabilityDialog extends StatelessWidget {
  final VoidCallback onConfirmActivate;

  const ActivateAvailabilityDialog({Key? key, required this.onConfirmActivate})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 270.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAssets.appLogo2,
                color: brownColor2,
                height: 40.h,
                width: 134.w,
              ), // Talenty Logo
              20.verticalSpace,
              Text(
                'Activar disponibilidad\ninmediata',
                textAlign: TextAlign.center,
                style: style16B.copyWith(color: blackColor),
              ),
              20.verticalSpace,
              Text(
                'Al activarla, las empresas\nsabrán que estás disponible en\ntodo momento.\nSi tu perfil les interesa podrán\nchatear, llamarte ó\nvideollamarte de inmediato.',
                textAlign: TextAlign.center,
                style: style14M.copyWith(color: blackColor),
              ),
              10.verticalSpace,
              CustomButton(
                text: 'Activar',
                onTap: onConfirmActivate,
                backgroundColor: brownColor2,
                textColor: whiteColor,
                radius: 10.r,
              ),
              12.verticalSpace,
              CustomButton(
                text: 'Cancelar',
                onTap: () {
                  Get.back(); // Dismiss the dialog
                },
                backgroundColor: Colors.transparent,
                textColor: blackColor,
                borderColor: blackColor,
                radius: 10.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeactivateAvailabilityDialog extends StatelessWidget {
  final VoidCallback onConfirmDeactivate;

  const DeactivateAvailabilityDialog({
    Key? key,
    required this.onConfirmDeactivate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 270.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            30.verticalSpace,
            Image.asset(
              color: brownColor2,
              AppAssets.appLogo2,
              height: 40.h,
              width: 134.w,
            ), // Talenty Logo
            20.verticalSpace,
            Text(
              '¿Seguro que quieres\ndesactivar tu\ndisponibilidad inmediata?',
              textAlign: TextAlign.center,
              style: style16B.copyWith(color: blackColor),
            ),
            20.verticalSpace,
            Text(
              'Las empresas seguirán viendo\ntu perfil, pero es posible que\nprioricen a quienes están\ndisponibles de inmediato.',
              textAlign: TextAlign.center,
              style: style14M.copyWith(color: blackColor),
            ),
            10.verticalSpace,
            CustomButton(
              text:
                  'Activar', // This button's text is "Activar" but it's for deactivation, based on your image.
              onTap: onConfirmDeactivate,
              backgroundColor: brownColor2,
              textColor: whiteColor,
              radius: 10.r,
            ),
            12.verticalSpace,
            CustomButton(
              text: 'Cancelar',
              onTap: () {
                Get.back(); // Dismiss the dialog
              },
              backgroundColor: Colors.transparent,
              textColor: blackColor,
              borderColor: blackColor,
              radius: 10.r,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
