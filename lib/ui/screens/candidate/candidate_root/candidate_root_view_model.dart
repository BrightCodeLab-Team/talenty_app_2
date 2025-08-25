// ignore_for_file: prefer_const_constructors, strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/enums/view_state.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_home/candidate_home_screen.dart';
import 'package:talenty_app/ui/screens/candidate/mas/main_menu_screen/candidate_mas_screen.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_matches/candidate_matches_screen.dart';
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
      'title': 'Filtrados',
      'description':
          'Aquí podrás personalizar tus resultados de búsqueda con filtros como tu localidad, habilidades o preferencias. Encuentra vacantes que realmente se adapten a ti.',
      'icon': '$iconsAssets/polygon.png',
      'number': "$iconsAssets/num1.svg",
    },
    {
      'title': 'Notificaciones',
      'description':
          'Mantente al día con nuevas ofertas, matches y actualizaciones importantes. Revisa esta sección para no perder oportunidades clave.',
      'icon': '$iconsAssets/polygon.png',
      'number': AppAssets.num2,
    },
    {
      'title': 'Búsqueda',
      'description':
          'Utiliza palabras clave para encontrar vacantes específicas. Ideal si ya sabes qué tipo de trabajo estás buscando.',
      'icon': '$iconsAssets/polygon.png',
      'number': AppAssets.num3,
    },
    {
      'title': 'Categorías',
      'description':
          'Explora ofertas laborales organizadas por áreas o industrias. Filtrar por categoría te ahorra tiempo y mejora la precisión de tu búsqueda.',
      'icon': '$iconsAssets/polygon.png',
      'number': AppAssets.num4,
    },
    {
      'title': 'Explora con la barra de búsqueda',
      'description':
          'Desde aquí podrás navegar fácilmente por la app: accede a tips para mejorar tu perfil, revisa tus matches con empresas, chatea con reclutadores y actualiza tu información en el perfil. Todo lo que necesitas dentro de la app.',
      'icon': '$iconsAssets/polygon2.png',
      'number': AppAssets.num5,
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
