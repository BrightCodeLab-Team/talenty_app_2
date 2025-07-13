// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
      'title': 'Crear Vacante',
      'description':
          'Crea una vacante en pocos pasos y encuentra al candidato ideal para tu empresa.',
      'icon': '$iconsAssets/polygon.png',
    },
    {
      'title': 'Buscador',
      'description':
          'Utiliza el buscador para encontrar rápidamente tus vacantes creadas.',
      'icon': '$iconsAssets/polygon.png',
    },
    {
      'title': 'Notificaciones',
      'description':
          '¡Tienes una nueva notificación! Revisa los detalles en la app y mantente al tanto de las actualizaciones',
      'icon': '$iconsAssets/polygon.png',
    },
    {
      'title': 'Buscador',
      'description':
          'Utiliza el buscador para encontrar rápidamente tus vacantes creadas.',
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
