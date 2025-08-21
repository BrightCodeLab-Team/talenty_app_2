import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/Containers/progress_container.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_100_percent/register_100_view_model.dart';

import 'package:talenty_app/ui/screens/candidate/candidate_root/candidate_root_screen.dart';

class Candidate100PercentScreen extends StatefulWidget {
  const Candidate100PercentScreen({super.key});

  @override
  State<Candidate100PercentScreen> createState() =>
      _Candidate100PercentScreenState();
}

class _Candidate100PercentScreenState extends State<Candidate100PercentScreen> {
  final TextEditingController _aboutMeController = TextEditingController();
  bool isButtonEnabled = false;
  int maxChars = 500;

  @override
  void initState() {
    super.initState();
    _aboutMeController.addListener(_validateInput);
  }

  void _validateInput() {
    final text = _aboutMeController.text.trim();
    setState(() {
      isButtonEnabled = text.isNotEmpty && text.length <= maxChars;
    });
  }

  @override
  void dispose() {
    _aboutMeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textLength = _aboutMeController.text.length;
    final isOverLimit = textLength > maxChars;

    return ChangeNotifierProvider(
      create: (context) => CandidateRegister100PercentViewModel(),
      child: Consumer<CandidateRegister100PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(15),
                child: CustomButton(
                  text: 'Continuar',
                  onTap:
                      isButtonEnabled
                          ? () {
                            Get.to(() => CandidateRootScreen());
                          }
                          : null,
                  backgroundColor: isButtonEnabled ? Colors.red : Colors.grey,
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
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Center(
                        child: Text(
                          '100%',
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ),
                      4.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.of(context).size.width * 1,
                      ),
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
                            children: [
                              Text(
                                'Cuéntanos más de tus habilidades',
                                style: style20B.copyWith(
                                  color: darkPurpleColor,
                                ),
                              ),
                              8.verticalSpace,
                              Text(
                                'Este espacio es para que nos compartas tus habilidades blandas y técnicas de forma libre. Describe tus capacidades en formato de lista.',
                                style: style14M.copyWith(
                                  color: textLightGreyColor,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              8.verticalSpace,
                              Row(
                                children: [
                                  const Text(''),
                                  const Spacer(),
                                  Text(
                                    'Máximo 500 caracteres',
                                    style: style16B.copyWith(
                                      color: darkPurpleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Text(
                            'Acerca de mí',
                            style: style16B.copyWith(color: lightBlackColor),
                          ),
                          const Spacer(),
                          Text(
                            '$textLength/500 caracteres',
                            style: style14M.copyWith(
                              color: isOverLimit ? Colors.red : darkPurpleColor,
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      TextFormField(
                        controller: _aboutMeController,
                        maxLines: 7,

                        decoration: authFieldDecoration.copyWith(
                          hintText:
                              'Ej:¨• Creatividad para campañas digitales  • Gestión de redes sociales (Instagram, TikTok, LinkedIn)  • Edición básica de video y diseño gráfico con Canva  • Conocimientos en Google Ads y Meta Business Suite  • Estrategias de posicionamiento y branding  • Facilidad para comunicar ideas y trabajar en equipo.¨',
                        ),
                      ),
                      10.verticalSpace,
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Máximo 500 caracteres',
                          style: style14M.copyWith(
                            color: isOverLimit ? Colors.red : textGreyColor,
                          ),
                        ),
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
