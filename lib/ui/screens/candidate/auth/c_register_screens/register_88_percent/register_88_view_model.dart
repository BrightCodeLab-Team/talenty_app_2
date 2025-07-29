import 'package:flutter/material.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class CandidateRegister88PercentViewModel extends BaseViewModel {
  List<WorkExperienceEntry> workExperienceEntries = [WorkExperienceEntry()];
  bool isFormValid = false;

  bool _skipExperience = false;
  bool get skipExperience => _skipExperience;

  void setSkipExperience(bool value) {
    _skipExperience = value;
    if (value) {
      isFormValid = true;
    } else {
      validateAllEntries();
    }
    notifyListeners();
  }

  final List<String> secondDropDown = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];

  final List<String> thirdDropDown = List<String>.generate(
    50,
    (index) => (DateTime.now().year - index).toString(),
  );

  void toggleDropDown2(int index) {
    workExperienceEntries[index].dropDown2Open =
        !workExperienceEntries[index].dropDown2Open;
    notifyListeners();
  }

  void toggleDropDown3(int index) {
    workExperienceEntries[index].dropDown3Open =
        !workExperienceEntries[index].dropDown3Open;
    notifyListeners();
  }

  void setStartMonth(String value, int index) {
    workExperienceEntries[index].startMonth = value;
    workExperienceEntries[index].startMonthError = false;
    notifyListeners();
  }

  void setStartYear(String value, int index) {
    workExperienceEntries[index].startYear = value;
    workExperienceEntries[index].startYearError = false;
    notifyListeners();
  }

  void addWorkExperienceEntry() {
    workExperienceEntries.add(WorkExperienceEntry());
    validateAllEntries();
    notifyListeners();
  }

  void removeWorkExperienceEntry(int index) {
    if (workExperienceEntries.length > 1) {
      workExperienceEntries.removeAt(index);
    }
    validateAllEntries();
    notifyListeners();
  }

  void setPosition(String value, int index) {
    workExperienceEntries[index].position = value;
    workExperienceEntries[index].positionError = false;
    notifyListeners();
  }

  void setCompany(String value, int index) {
    workExperienceEntries[index].company = value;
    workExperienceEntries[index].companyError = false;
    notifyListeners();
  }

  void validateAllEntries() {
    bool allValid = true;

    for (var entry in workExperienceEntries) {
      if (entry.positionController.text.trim().isEmpty) {
        entry.positionError = true;
        allValid = false;
      } else {
        entry.positionError = false;
      }

      if (entry.companyController.text.trim().isEmpty) {
        entry.companyError = true;
        allValid = false;
      } else {
        entry.companyError = false;
      }

      if (entry.startMonth == null || entry.startMonth!.isEmpty) {
        entry.startMonthError = true;
        allValid = false;
      } else {
        entry.startMonthError = false;
      }

      if (entry.startYear == null || entry.startYear!.isEmpty) {
        entry.startYearError = true;
        allValid = false;
      } else {
        entry.startYearError = false;
      }
    }

    isFormValid = allValid;
    notifyListeners();
  }
}

class WorkExperienceEntry {
  TextEditingController positionController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  String? position;
  String? company;
  String? startMonth;
  String? startYear;

  bool positionError = false;
  bool companyError = false;
  bool startMonthError = false;
  bool startYearError = false;

  bool dropDown2Open = false;
  bool dropDown3Open = false;
}
