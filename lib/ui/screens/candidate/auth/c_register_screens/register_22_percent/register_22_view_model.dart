import 'package:talenty_app/core/others/base_view_model.dart';

class CandidateRegister22PercentViewModel extends BaseViewModel {
  List<WorkExperienceEntry> workExperienceEntries = [WorkExperienceEntry()];
  bool isFormValid = false;

  // Add to CandidateRegister22PercentViewModel
  bool _skipExperience = false;

  bool get skipExperience => _skipExperience;

  void setSkipExperience(bool value) {
    _skipExperience = value;
    // If skipping experience, mark form as valid
    if (value) {
      isFormValid = true;
    } else {
      validateAllEntries();
    }
    notifyListeners();
  }

  // Dropdown options
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

  // Methods for dropdown toggles
  void toggleDropDown1(int index) {
    workExperienceEntries[index].dropDown1Open =
        !workExperienceEntries[index].dropDown1Open;
    notifyListeners();
  }

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

  void toggleDropDown4(int index) {
    workExperienceEntries[index].dropDown4Open =
        !workExperienceEntries[index].dropDown4Open;
    notifyListeners();
  }

  void toggleDropDown5(int index) {
    workExperienceEntries[index].dropDown5Open =
        !workExperienceEntries[index].dropDown5Open;
    notifyListeners();
  }

  // Methods for setting dates
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

  void setEndMonth(String value, int index) {
    workExperienceEntries[index].endMonth = value;
    workExperienceEntries[index].endMonthError = false;
    notifyListeners();
  }

  void setEndYear(String value, int index) {
    workExperienceEntries[index].endYear = value;
    workExperienceEntries[index].endYearError = false;
    notifyListeners();
  }

  // Existing methods...
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

  void setLocation(String value, int index) {
    workExperienceEntries[index].location = value;
    workExperienceEntries[index].locationError = false;
    notifyListeners();
  }

  void setIsRemote(bool value, int index) {
    workExperienceEntries[index].isRemote = value;
    if (value) {
      workExperienceEntries[index].location = null;
      workExperienceEntries[index].locationError = false;
    }
    notifyListeners();
  }

  void setIsCurrent(bool value, int index) {
    workExperienceEntries[index].isCurrent = value;
    if (value) {
      workExperienceEntries[index].endMonth = null;
      workExperienceEntries[index].endYear = null;
    }
    notifyListeners();
  }

  void validateAllEntries() {
    bool allValid = true;

    for (var entry in workExperienceEntries) {
      // Validate position
      if (entry.position == null || entry.position!.isEmpty) {
        entry.positionError = true;
        allValid = false;
      }
      // Only validate location if not remote
      if (!entry.isRemote &&
          (entry.location == null || entry.location!.isEmpty)) {
        entry.locationError = true;
        allValid = false;
      }
      // Validate company
      if (entry.company == null || entry.company!.isEmpty) {
        entry.companyError = true;
        allValid = false;
      }

      // Validate start month
      if (entry.startMonth == null || entry.startMonth!.isEmpty) {
        entry.startMonthError = true;
        allValid = false;
      }

      // Validate start year
      if (entry.startYear == null || entry.startYear!.isEmpty) {
        entry.startYearError = true;
        allValid = false;
      }

      // Validate end month/year (only if not current)
      if (!entry.isCurrent) {
        if (entry.endMonth == null || entry.endMonth!.isEmpty) {
          entry.endMonthError = true;
          allValid = false;
        }
        if (entry.endYear == null || entry.endYear!.isEmpty) {
          entry.endYearError = true;
          allValid = false;
        }
      }
    }

    isFormValid = allValid;
    notifyListeners();
  }
}

class WorkExperienceEntry {
  String? position;
  String? company;
  String? location;
  bool isRemote = false;
  bool isCurrent = false;

  String? startMonth;
  String? startYear;
  String? endMonth;
  String? endYear;

  bool positionError = false;
  bool companyError = false;
  bool locationError = false;
  bool startMonthError = false;
  bool startYearError = false;
  bool endMonthError = false;
  bool endYearError = false;

  bool dropDown1Open = false;
  bool dropDown2Open = false;
  bool dropDown3Open = false;
  bool dropDown4Open = false;
  bool dropDown5Open = false;
}
