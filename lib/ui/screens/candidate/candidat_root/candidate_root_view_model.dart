// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/enums/view_state.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat.dart';
import 'package:talenty_app/ui/screens/candidate/home/candidate_home_screen.dart';
import 'package:talenty_app/ui/screens/candidate/mas/main_menu_screen/candidate_mas_screen.dart';
import 'package:talenty_app/ui/screens/candidate/matches/candidate_matches_screen.dart';
import 'package:talenty_app/ui/screens/common/tips/tips_screen.dart';

class CandidateRootScreenViewModel extends BaseViewModel {
  final PageController pageController = PageController(initialPage: 0);
  bool showTooltip = true;
  int currentStep = 0;

  CandidateRootScreenViewModel(val) {
    updatedScreen(val);
    notifyListeners();
  }

  int selectedScreen = 0;

  List<Widget> allScreen = [
    CandidateHomeScreen(),
    TipsScreen(),
    CandidateMatchesScreen(),
    CandidateChatScreen(),
    CandidateMasScreen(),
  ];

  updatedScreen(int index) {
    setState(ViewState.busy);
    selectedScreen = index;
    setState(ViewState.idle);
    notifyListeners();
  }

  final List<Map<String, String>> onboardingSteps = [
    {
      'title': 'Create vacancy'.tr,
      'description':
          'Create a vacancy in just a few steps and find the ideal candidate for your company.'.tr,
      'icon': '$iconsAssets/polygon.png',
    },
    {
      'title': 'Search engine'.tr,
      'description':
          'Use the search engine to quickly find your created vacancies.'.tr,
      'icon': '$iconsAssets/polygon.png',
    },
    {
      'title': 'notifications'.tr,
      'description':
          'You have a new notification! Check the details in the app and stay up to date with updates.'.tr,
      'icon': '$iconsAssets/polygon.png',
    },
    {
      'title': 'Search engine'.tr,
      'description':
          'Use the search engine to quickly find your created vacancies.'.tr,
      'icon': '$iconsAssets/polygon2.png',
    },
  ];

  void nextStep() {
    if (currentStep < onboardingSteps.length - 1) {
      currentStep++;
    } else {
      showTooltip = false;
    }
    notifyListeners();
  }

  void closeTooltip() {
    showTooltip = false;
    notifyListeners();
  }
}
