import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/mas/delete_account/candidate_delete_account_view_model.dart';

class CandidateDeleteAccountScreen extends StatelessWidget {
  const CandidateDeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateDeleteAccountViewModel(),
      child: Consumer<CandidateDeleteAccountViewModel>(
        builder:
            (context, model, child) => Scaffold(
              appBar: AppBar(
                leading: CustomBackButton(),
                title: Image.asset(
                  AppAssets.appLogo2,
                  height: 40.h,
                  width: 134.w,
                ),
                centerTitle: true,
                backgroundColor: whiteColor,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 10.h,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Eliminar Cuenta',
                          style: style24M.copyWith(color: darkPurpleColor),
                        ),
                        10.verticalSpace,
                        Text(
                          'Al eliminar tu cuenta, se borrarán de forma permanente todos tus datos personales, historial de actividad, conversaciones, vacantes creadas (si aplica) y cualquier información asociada a tu perfil.',
                          style: style14M.copyWith(color: darkPurpleColor),
                        ),
                        20.verticalSpace,
                        Text(
                          'Qué sucede cuando eliminas tu cuenta?',
                          style: style16B.copyWith(color: darkPurpleColor),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ',
                                    style: style14M.copyWith(
                                      color: darkPurpleColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Se eliminará tu perfil completo, incluidos tu nombre, correo electrónico, foto y cualquier otra información personal.',
                                      style: style14M.copyWith(
                                        color: darkPurpleColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              5.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ',
                                    style: style14M.copyWith(
                                      color: darkPurpleColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Todas tus conversaciones, matches, postulaciones, entrevistas agendadas y vacantes creadas (en caso de ser reclutador) serán eliminadas sin posibilidad de recuperación.',
                                      style: style14M.copyWith(
                                        color: darkPurpleColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              5.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ',
                                    style: style14M.copyWith(
                                      color: darkPurpleColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Si tienes suscripciones activas, estas se cancelarán automáticamente.',
                                      style: style14M.copyWith(
                                        color: darkPurpleColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              5.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ',
                                    style: style14M.copyWith(
                                      color: darkPurpleColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'En caso de que estés participando en procesos de selección, las empresas dejarán de ver tu perfil y no podrán contactarte.',
                                      style: style14M.copyWith(
                                        color: darkPurpleColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          '¿Puedo reactivar mi cuenta después?',
                          style: style16B.copyWith(color: darkPurpleColor),
                        ),

                        Text(
                          'No. Esta acción no se puede deshacer. Si decides volver en el futuro, deberás crear una cuenta nueva desde cero, sin historial previo.',
                          style: style14M.copyWith(color: darkPurpleColor),
                        ),
                        20.verticalSpace,
                        Text(
                          '¿Qué pasa con mis datos?',
                          style: style16B.copyWith(color: darkPurpleColor),
                        ),

                        Text(
                          'Todos los datos se eliminan conforme a nuestras políticas de privacidad y normativas de protección de datos. Puedes consultar más detalles en nuestra sección de [Política de Privacidad].',
                          style: style14M.copyWith(color: darkPurpleColor),
                        ),
                        30.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
                child: CustomButton(
                  text: 'Continuar',
                  onTap: () {
                    model.handleDeleteAccount();
                  },
                  backgroundColor: primaryColor,
                  textColor: whiteColor,
                  radius: 8.r,
                ),
              ),
            ),
      ),
    );
  }
}

///
///. dialog box
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
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.appLogo2,
              height: 40.h,
              width: 134.w,
            ), // Talenty Logo
            20.verticalSpace,
            Text(
              '¿Estás seguro de que deseas eliminar tu cuenta?',
              textAlign: TextAlign.center,
              style: style16B.copyWith(color: blackColor),
            ),
            10.verticalSpace,
            Text(
              'Esta acción es definitiva.',
              textAlign: TextAlign.center,
              style: style16M.copyWith(color: blackColor),
            ),
            30.verticalSpace,
            CustomButton(
              text: 'Eliminar',
              onTap: onConfirmDelete,
              backgroundColor: brownColor2, // Assuming primaryColor is red
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
              textColor: darkPurpleColor,
              borderColor: darkPurpleColor,
              radius: 10.r,
            ),
          ],
        ),
      ),
    );
  }
}
