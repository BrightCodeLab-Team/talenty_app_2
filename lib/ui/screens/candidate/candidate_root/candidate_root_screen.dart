// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/ui/custom_widgets/bottom_bar/bottom_navigation_bar.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_root/candidate_root_view_model.dart';

class CandidateRootScreen extends StatelessWidget {
  final int? selectedScreen;
  final bool isDirectNavigation;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CandidateRootScreen({
    super.key,
    this.selectedScreen = 0,
    this.isDirectNavigation = false,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRootScreenViewModel(selectedScreen),
      child: Consumer<CandidateRootScreenViewModel>(
        builder: (context, model, child) {
          // If this is direct navigation, show only the content screen
          if (isDirectNavigation) {
            return Scaffold(
              backgroundColor: whiteColor,
              body: model.allScreen[model.selectedScreen],
              bottomNavigationBar: _buildDirectContentBottomBar(model),
            );
          }

          // Otherwise show the full screen with onboarding etc.
          return Scaffold(
            backgroundColor: whiteColor,
            key: _scaffoldKey,
            body: Stack(
              alignment: Alignment.topRight,
              children: [
                model.currentStep == 3
                    ? model.allScreen[model.selectedScreen]
                    : Column(
                      children: [
                        Expanded(child: model.allScreen[model.selectedScreen]),
                        bottomBar(model),
                      ],
                    ),
                if (model.showTooltip) _buildTooltipOverlay(model),
              ],
            ),
            bottomNavigationBar:
                model.currentStep == 3 ? bottomBar(model) : null,
          );
        },
      ),
    );
  }

  Widget _buildDirectContentBottomBar(CandidateRootScreenViewModel model) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff9B9B9B).withOpacity(0.10),
            offset: Offset.zero,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(model, 0, AppAssets.home, "Inicio"),
          _buildBottomNavItem(model, 1, AppAssets.tips, "Tips"),
          _buildBottomNavItem(model, 2, AppAssets.vacancies, "Matches"),
          _buildBottomNavItem(model, 3, AppAssets.chat, "Chats"),
          _buildBottomNavItem(model, 4, AppAssets.menu, "Más"),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(
    CandidateRootScreenViewModel model,
    int index,
    String icon,
    String text,
  ) {
    return CustomBottomNavigator(
      currentIndex: model.selectedScreen,
      indexNumber: index,
      image: model.selectedScreen == index ? icon : icon,
      onPressed: () => model.updatedScreen(index),
      text: text,
    );
  }

  Widget _buildTooltipOverlay(CandidateRootScreenViewModel model) {
    return Stack(
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7),
            child: Container(color: blackColor.withOpacity(0.4)),
          ),
        ),
        if (model.currentStep == 4)
          Positioned(
            bottom: 100,
            left: 40,
            right: 40,
            child: _buildTooltipContent(model),
          )
        else if (model.currentStep == 3)
          Positioned(bottom: 100, left: -1, child: _buildTooltipContent(model))
        else
          Column(
            children: [const SizedBox(height: 70), _buildTooltipContent(model)],
          ),
      ],
    );
  }

  Widget _buildTooltipContent(CandidateRootScreenViewModel model) {
    return CustomOnboardingTooltip(
      onNext: model.nextStep,
      currentIndex: model.currentStep,
      totalSteps: model.onboardingSteps.length,
      title: model.onboardingSteps[model.currentStep]['title']!,
      description: model.onboardingSteps[model.currentStep]['description']!,
      iconPath: model.onboardingSteps[model.currentStep]['icon']!,
      number: model.onboardingSteps[model.currentStep]['number']!,
    );
  }

  Widget bottomBar(CandidateRootScreenViewModel model) {
    return _buildDirectContentBottomBar(model);
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.20), blurRadius: 10),
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
                          margin: const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xffF1F1F1),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1, color: Colors.brown),
                          ),
                          child: Text(
                            number,
                            style: GoogleFonts.notoSerif(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: brownColor,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
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
              const SizedBox(height: 25),
              Text(description, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 25),
              Row(
                children: List.generate(
                  totalSteps,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == currentIndex ? Colors.brown : Colors.grey,
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
                    child: Image.asset(
                      "$iconsAssets/circle_tick.png",
                      scale: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildPositionedIcon(),
      ],
    );
  }

  Widget _buildPositionedIcon() {
    if (currentIndex == 4) {
      return Positioned(
        bottom: -25,
        left: 0.0,
        right: 0.0,
        child: Center(child: Image.asset(iconPath, scale: 4)),
      );
    } else if (currentIndex != 3) {
      return Positioned(
        top: 15,
        right: _getRightPosition(),
        child: Image.asset(iconPath, scale: 4),
      );
    } else {
      return Positioned(
        top: 10,
        left: 40,
        child: Image.asset(iconPath, scale: 4),
      );
    }
  }

  double _getRightPosition() {
    switch (currentIndex) {
      case 0:
        return 85;
      case 1:
        return 50;
      case 2:
        return 8;
      default:
        return 0;
    }
  }
}
