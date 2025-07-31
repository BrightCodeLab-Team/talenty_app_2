// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/bottom_bar/bottom_navigation_bar.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_root/candidate_root_view_model.dart';

class CandidateRootScreen extends StatelessWidget {
  final int? selectedScreen;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CandidateRootScreen({super.key, this.selectedScreen = 0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRootScreenViewModel(selectedScreen),
      child: Consumer<CandidateRootScreenViewModel>(
        builder:
            (context, model, child) => Scaffold(
              backgroundColor: whiteColor,

              key: _scaffoldKey,

              ///
              /// Start Body
              ///
              body: Stack(
                alignment: Alignment.topRight,
                children: [
                  model.currentStep == 3
                      ? model.allScreen[model.selectedScreen]
                      : Column(
                        children: [
                          Expanded(
                            child: model.allScreen[model.selectedScreen],
                          ),
                          bottomBar(model),
                        ],
                      ),
                  if (model.showTooltip) ...[
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7),
                        child: Container(color: blackColor.withOpacity(0.4)),
                      ),
                    ),
                    model.currentStep == 4
                        ? Positioned(
                          bottom: 100,
                          left: 40,
                          right: 40,
                          child: CustomOnboardingTooltip(
                            onNext: model.nextStep,
                            // onClose: model.closeTooltip,
                            currentIndex: model.currentStep,
                            totalSteps: model.onboardingSteps.length,
                            title:
                                model.onboardingSteps[model
                                    .currentStep]['title']!,
                            description:
                                model.onboardingSteps[model
                                    .currentStep]['description']!,
                            iconPath:
                                model.onboardingSteps[model
                                    .currentStep]['icon']!,
                            number:
                                model.onboardingSteps[model
                                    .currentStep]['number']!,
                          ),
                        )
                        : model.currentStep == 3
                        ? Positioned(
                          bottom: 60,
                          left: -1,
                          child: CustomOnboardingTooltip(
                            onNext: model.nextStep,
                            // onClose: model.closeTooltip,
                            currentIndex: model.currentStep,
                            totalSteps: model.onboardingSteps.length,
                            title:
                                model.onboardingSteps[model
                                    .currentStep]['title']!,
                            description:
                                model.onboardingSteps[model
                                    .currentStep]['description']!,
                            iconPath:
                                model.onboardingSteps[model
                                    .currentStep]['icon']!,
                            number:
                                model.onboardingSteps[model
                                    .currentStep]['number']!,
                          ),
                        )
                        : Column(
                          children: [
                            60.verticalSpace,
                            CustomOnboardingTooltip(
                              onNext: model.nextStep,
                              // onClose: model.closeTooltip,
                              currentIndex: model.currentStep,
                              totalSteps: model.onboardingSteps.length,
                              title:
                                  model.onboardingSteps[model
                                      .currentStep]['title']!,
                              description:
                                  model.onboardingSteps[model
                                      .currentStep]['description']!,
                              iconPath:
                                  model.onboardingSteps[model
                                      .currentStep]['icon']!,
                              number:
                                  model.onboardingSteps[model
                                      .currentStep]['number']!,
                            ),
                          ],
                        ),
                  ],
                ],
              ),

              ///
              /// BottomBar
              ///
              bottomNavigationBar:
                  model.currentStep == 3 ? bottomBar(model) : SizedBox(),
            ),
      ),
    );
  }

  Widget bottomBar(CandidateRootScreenViewModel model) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Color(0xff9B9B9B).withOpacity(0.10),
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),

      // surfaceTintColor: whiteColor,
      // elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomBottomNavigator(
            currentIndex: model.selectedScreen,
            indexNumber: 0,
            image: model.selectedScreen == 0 ? AppAssets.home : AppAssets.home,
            onPressed: () {
              model.updatedScreen(0);
            },
            text: "Inicio",
          ),
          CustomBottomNavigator(
            currentIndex: model.selectedScreen,
            indexNumber: 1,
            image: model.selectedScreen == 1 ? AppAssets.tips : AppAssets.tips,
            onPressed: () {
              model.updatedScreen(1);
            },
            text: 'Tips',
          ),
          CustomBottomNavigator(
            currentIndex: model.selectedScreen,
            indexNumber: 2,
            image:
                model.selectedScreen == 2
                    ? AppAssets.vacancies
                    : AppAssets.vacancies,
            onPressed: () {
              model.updatedScreen(2);
            },
            text: "Matches",
          ),

          CustomBottomNavigator(
            currentIndex: model.selectedScreen,
            indexNumber: 3,
            image: model.selectedScreen == 3 ? AppAssets.chat : AppAssets.chat,
            onPressed: () {
              model.updatedScreen(3);
            },
            text: "Chats",
          ),
          CustomBottomNavigator(
            currentIndex: model.selectedScreen,
            indexNumber: 4,
            image: model.selectedScreen == 4 ? AppAssets.menu : AppAssets.menu,
            onPressed: () {
              model.updatedScreen(4);
            },
            text: "Más",
          ),
        ],
      ),
    );
  }
}

class CustomOnboardingTooltip extends StatelessWidget {
  final VoidCallback onNext;

  final int currentIndex;
  final int totalSteps;
  final String title;
  final String number;
  final String description;
  final String iconPath;

  const CustomOnboardingTooltip({
    required this.onNext,

    required this.currentIndex,
    required this.totalSteps,
    required this.number,
    required this.title,
    required this.description,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 35,
            left: 16,
            right: currentIndex != 2 ? 16 : 4,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: darkPurpleColor.withOpacity(0.20),
                blurRadius: 10,
              ),
            ],
          ),
          width: 303,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: Color(0xffF1F1F1),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1, color: brownColor),
                          ),

                          child: Text(
                            number,
                            style: GoogleFonts.secularOne(
                              textStyle: style14B.copyWith(color: brownColor),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            title,
                            style: style16B.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              25.verticalSpace,
              Text(description, style: style14M),
              25.verticalSpace,
              Row(
                children: List.generate(
                  totalSteps,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == currentIndex ? brownColor : greyColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: onNext,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: brownColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:
                        currentIndex == 3
                            ? Image.asset("$iconsAssets/tick.png", scale: 3)
                            : Image.asset(
                              "$iconsAssets/circle_tick.png",
                              scale: 3,
                            ),
                  ),
                ),
              ),
            ],
          ),
        ),

        currentIndex == 4
            ? Positioned(
              bottom: -25,
              left: 0.0,
              right: 0.0,
              child: Center(child: Image.asset(iconPath, scale: 4)),
            )
            : currentIndex != 3
            ? Positioned(
              top: 13,
              right:
                  currentIndex == 0
                      ? 85
                      : currentIndex == 1
                      ? 50
                      : currentIndex == 2
                      ? 8
                      : 0,
              child: Image.asset(iconPath, scale: 4),
            )
            : Positioned(
              top: 10,
              left: 40,
              child: Image.asset(iconPath, scale: 4),
            ),
      ],
    );
  }
}
