// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
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
                          bottomBar(model), // move bottomBar inside body Stack
                        ],
                      ),
                  if (model.showTooltip) ...[
                    ClipRect(
                      // <-- recommended to avoid overflow
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Container(
                          color: Colors.black.withOpacity(
                            0.1,
                          ), // lighter overlay
                        ),
                      ),
                    ),

                    model.currentStep == 3
                        ? Positioned(
                          bottom: 20, // adjust based on your UI
                          left: 16,
                          right: 16,
                          child: CustomOnboardingTooltip(
                            onNext: model.nextStep,
                            onClose: model.closeTooltip,
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
                          ),
                        )
                        : Column(
                          // clipBehavior: Clip.none,
                          // alignment: Alignment.topRight,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              margin: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 40,
                              ),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppAssets.userAddIcon,
                                    height: 24,
                                    width: 24,
                                    color:
                                        model.currentStep == 0
                                            ? primaryColor
                                            : textGreyColor,
                                  ),
                                  Image.asset(
                                    AppAssets.notifIcon,
                                    height: 24,
                                    width: 24,
                                    color:
                                        model.currentStep == 1
                                            ? primaryColor
                                            : textGreyColor,
                                  ),
                                  Image.asset(
                                    AppAssets.searchIcon,
                                    height: 46,
                                    width: 46,
                                    color:
                                        model.currentStep == 2
                                            ? primaryColor
                                            : textGreyColor,
                                  ),
                                ],
                              ),
                            ),

                            CustomOnboardingTooltip(
                              onNext: model.nextStep,
                              onClose: model.closeTooltip,
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

              ///
              /// Right Drawer
              ///
            ),
      ),
    );
  }

  Widget bottomBar(CandidateRootScreenViewModel model) {
    return BottomAppBar(
      color: whiteColor,
      surfaceTintColor: whiteColor,
      elevation: 0.0,
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
  final VoidCallback onClose;
  final int currentIndex;
  final int totalSteps;
  final String title;
  final String description;
  final String iconPath;

  const CustomOnboardingTooltip({
    required this.onNext,
    required this.onClose,
    required this.currentIndex,
    required this.totalSteps,
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
          margin: const EdgeInsets.only(top: 35, left: 16, right: 16),
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
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: style16B.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: onClose,
                    child: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(description, style: style14M),
              const SizedBox(height: 16),
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
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:
                        currentIndex == 3
                            ? Image.asset("$iconsAssets/tick.png", scale: 3)
                            : Icon(Icons.arrow_forward, color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        currentIndex != 3
            ? Positioned(
              top: 10,
              right:
                  currentIndex == 0
                      ? 90
                      : currentIndex == 1
                      ? 50
                      : currentIndex == 2
                      ? 20
                      : 0,
              child: Image.asset(iconPath, scale: 4),
            )
            : Positioned(
              bottom: -15,
              right: 140,
              child: Image.asset(iconPath, scale: 4),
            ),
      ],
    );
  }
}
