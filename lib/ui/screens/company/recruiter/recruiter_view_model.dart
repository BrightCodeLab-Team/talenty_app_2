import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/recruite.dart';
import 'package:talenty_app/core/constants/colors.dart';

class RecruiterViewModel extends ChangeNotifier {
  List<RecruiterModel> _filteredRecruiters = [];
  List<RecruiterModel> get recruiters => _filteredRecruiters;
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  RecruiterViewModel() {
    _filteredRecruiters = _allRecruiters;
  }

  void searchRecruiter(String query) {
    if (query.isEmpty) {
      _filteredRecruiters = _allRecruiters;
      _isSearching = false;
    } else {
      _filteredRecruiters =
          _allRecruiters.where((recruiter) {
            final nameMatch = recruiter.name.toLowerCase().contains(
              query.toLowerCase(),
            );
            final roleMatch = recruiter.role.toLowerCase().contains(
              query.toLowerCase(),
            );
            return nameMatch || roleMatch;
          }).toList();
      _isSearching = true;
    }
    notifyListeners();
  }

  final List<RecruiterModel> _allRecruiters = [
    RecruiterModel(
      name: "Jessica Gonzalez",
      role: "Recursos Humanos",
      imageUrl: AppAssets.img2, // AppAssets.img2
      description:
          "Soy profesional en Recursos Humanos con experiencia en reclutamiento y desarrollo...",
      createdDate: "30 de marzo del 2025",
      tags: [
        TagModel(
          label: "Activa",
          value: "activa",
          count: 10,
          color: lightgreenColor,
        ),
        TagModel(
          label: "Pausada",
          value: "pausada",
          count: 2,
          color: yelloBrownColor,
        ),
        TagModel(
          label: "Finalizada",
          value: "finalizada",
          count: 1,
          color: primaryColor,
        ),
      ],
    ),

    RecruiterModel(
      name: "Awais Khan",
      role: "Flutter Developer",
      imageUrl: AppAssets.img2, // AppAssets.img2
      description:
          "Soy profesional en Recursos Humanos con experiencia en reclutamiento y desarrollo...",
      createdDate: "30 de marzo del 2025",
      tags: [
        TagModel(
          label: "Activa",
          value: "activa",
          count: 10,
          color: lightgreenColor,
        ),
        TagModel(
          label: "Pausada",
          value: "pausada",
          count: 2,
          color: yelloBrownColor,
        ),
        TagModel(
          label: "Finalizada",
          value: "finalizada",
          count: 1,
          color: primaryColor,
        ),
      ],
    ),
  ];
}
