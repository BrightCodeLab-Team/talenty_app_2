import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/Containers/progress_container.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';

import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_44_percent/register_44_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_55_percent/register_55_screen.dart';

class Candidate44PercentScreen extends StatelessWidget {
  const Candidate44PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister44PercentViewModel(),
      child: Consumer<CandidateRegister44PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(15),
                child: CustomButton(
                  text: 'Continuar',
                  onTap: () {
                    model.isAnyTalentSelected
                        ? Get.to(Candidate55PercentScreen())
                        : model.isAnyTalentSelected == false
                        ? Get.snackbar(
                          'Attention',
                          'Please select one of below ',
                          backgroundColor: lightbrownColor,
                        )
                        : null; // No navigation here as per request
                  },
                  backgroundColor:
                      model.isAnyTalentSelected
                          ? primaryColor
                          : textGreyColor, // Change color based on selection
                ),
              ),
              appBar: AppBar(
                backgroundColor: transparent,
                leading: CustomBackButton(position: false),
                centerTitle: true,
                title: Image.asset(
                  AppAssets.appLogo2,
                  scale: 4,
                  height: 28.h,
                  width: 115.w,
                  color: primaryColor,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    20.verticalSpace,
                    Center(
                      child: Text(
                        '44%',
                        style: style16M.copyWith(color: lightBlackColor),
                      ),
                    ),
                    4.verticalSpace,
                    ProgressContainer(
                      progressWidth: MediaQuery.of(context).size.width * 0.44,
                    ),
                    20.verticalSpace,
                    Container(
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Talentos',
                              style: style20B.copyWith(color: darkPurpleColor),
                            ),
                            8.verticalSpace,
                            Text(
                              'Selecciona hasta 10 de los 34 talentos que mejor te describan. Haz clic en un talento para ver su descripción: ',
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
                                  '${model.selectedTalents.length} de 10',
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
                    Expanded(
                      child: Center(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 5.h,
                                childAspectRatio: 0.8,
                              ),
                          itemCount: model.talents.length,
                          itemBuilder: (context, index) {
                            final talent = model.talents[index];
                            final isSelected = model.selectedTalents.contains(
                              talent,
                            );
                            return TalentCircleWidget(
                              talent: talent,
                              isSelected: isSelected,
                              onTap: () {
                                model.toggleTalentSelection(talent);
                                // Get.snackbar(
                                //   "Analitica",
                                //   'you chose ${talent.name}',
                                //   snackPosition: SnackPosition.BOTTOM,
                                //   backgroundColor: Colors.white,
                                //   colorText: brownColor,
                                //   duration: const Duration(seconds: 2),
                                //   borderColor: brownColor,
                                // );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

///
///. model
///
class Talent {
  final String name;
  final String imageUrl;
  final String selectedImageUrl; // Image for when the talent is selected

  Talent({
    required this.name,
    required this.imageUrl,
    required this.selectedImageUrl,
  });
}

///
///. custom circle widget
///

class TalentCircleWidget extends StatelessWidget {
  final Talent talent;
  final bool isSelected;
  final VoidCallback onTap;

  const TalentCircleWidget({
    Key? key,
    required this.talent,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
          isSelected
              ? Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.star44),
                        scale: 4,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          talent.imageUrl,
                          scale: 4,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    talent.name,
                    style: style14B.copyWith(
                      fontSize: 13.sp,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
              : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: lightbrownColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: brownColor),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          talent.imageUrl,
                          scale: 4,

                          color: brownColor,
                        ),
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    talent.name,
                    style: style14B.copyWith(
                      fontSize: 13.sp,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
    );
  }
}
