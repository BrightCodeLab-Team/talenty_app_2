// ignore_for_file: strict_top_level_inference, prefer_final_fields, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_11_screen.dart';

class CandidateRegister11PercentViewModel extends BaseViewModel {
  TextEditingController nameController = TextEditingController();

  UniversityModel? selectedUniversityModel; // <-- Add this to your ViewModel
  TextEditingController universityController = TextEditingController();
  bool isUniversitySelected = false;

  List<UniversityEntry> universityEntries = [UniversityEntry()];

  void addUniversityEntry() {
    universityEntries.add(UniversityEntry());
    validateAllEntries(); // Add this line
    notifyListeners();
  }

  void removeUniversityEntry(int index) {
    if (universityEntries.length > 1) {
      universityEntries.removeAt(index);
    }
    validateAllEntries(); // Add this line
    notifyListeners();
  }

  void selectUniversity(UniversityModel university, int index) {
    universityEntries[index].selectedUniversity = university;
    universityEntries[index].universityController.text = university.name;
    universityEntries[index].isUniversitySelected = true;
    notifyListeners();
  }

  void clearSelectedUniversity(int index) {
    universityEntries[index].selectedUniversity = null;
    universityEntries[index].universityController.clear();
    universityEntries[index].isUniversitySelected = false;
    notifyListeners();
  }

  // Add all the toggle/set methods with index parameter
  void toggleDropDown1(int index) {
    universityEntries[index].dropDown1Open =
        !universityEntries[index].dropDown1Open;
    notifyListeners();
  }

  void setDegree(String value, int index) {
    universityEntries[index].degree = value;
    notifyListeners();
  }

  void setIsCurrent(bool value, int index) {
    universityEntries[index].isCurrent = value;
    notifyListeners();
  }

  void setStartMonth(String value, int index) {
    universityEntries[index].startMonth = value;
    notifyListeners();
  }

  void setEndMonth(String value, int index) {
    universityEntries[index].endMonth = value;
    notifyListeners();
  }

  void setStartYear(String value, int index) {
    universityEntries[index].startYear = value;
    notifyListeners();
  }

  void setEndYear(String value, int index) {
    universityEntries[index].endYear = value;
    notifyListeners();
  }
  // Add similar methods for all other fields...

  // Error handling methods
  void setDropDown1Error(bool value, int index) {
    universityEntries[index].dropDown1Error = value;
    notifyListeners();
  }

  // Add method to set career
  void setCareer(String value, int index) {
    universityEntries[index].career = value;
    universityEntries[index].careerError = false;
    notifyListeners();
  }

  ///
  /// Bool
  ///
  bool nameErrorFlag = false;
  bool dropDown1Error = false;
  bool dropDown2Error = false;
  bool dropDown3Error = false;
  bool dropDown4Error = false;
  bool dropDown5Error = false;
  bool isFormValid = false;
  bool isCheckboxChecked = false;
  bool _dropDown1 = false;
  bool _dropDown2 = false;
  bool _dropDown3 = false;
  bool _dropDown4 = false;
  bool _dropDown5 = false;

  bool get dropDown1 => _dropDown1;
  bool get dropDown2 => _dropDown2;
  bool get dropDown3 => _dropDown3;
  bool get dropDown4 => _dropDown4;
  bool get dropDown5 => _dropDown5;

  ///
  /// String
  ///
  String? get nameError => nameErrorFlag ? validateEmail() : null;
  String _dropDownText1 = '';
  String _dropDownText2 = 'Selecciona';
  String _dropDownText3 = 'Selecciona';
  String _dropDownText4 = 'Selecciona';
  String _dropDownText5 = 'Selecciona';

  String get dropDownText1 => _dropDownText1;
  String get dropDownText2 => _dropDownText2;
  String get dropDownText3 => _dropDownText3;
  String get dropDownText4 => _dropDownText4;
  String get dropDownText5 => _dropDownText5;

  String? validateEmail() {
    final name = nameController.text.trim();
    if (name.isEmpty) return 'enterValidEmail'.tr;

    return null;
  }

  CandidateRegister11PercentViewModel() {
    init();
  }

  List<UniversityModel> universityList = [
    UniversityModel(
      name: 'Universidad Nacional Autónoma de México',
      logoUrl:
          'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/092020/unam_azul.png?NjLgPWqC_ROp.uig6Qyl44l1e02tEsDB&itok=04fU54oB',
    ),
    UniversityModel(
      name: 'Tecnológico de Monterrey',
      logoUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Logo_del_ITESM.svg/2085px-Logo_del_ITESM.svg.png',
    ),
    UniversityModel(
      name: 'Universidad de Guadalajara',
      logoUrl:
          'https://lh6.googleusercontent.com/proxy/UWGColDExCy8WdECAcrKF3d_L69vJW362AiXmPuWdVt-nPX2t6KkJWRDTfiBdf4Lo-JqrE_KSMiWLR9Rp5K6PHAErkPJTtHROhWz67zzFD3R09dD7xIlbdQaLoObpdt6Rs3zzcwe',
    ),
  ];

  ///
  ///  data for drop down 1
  ///
  List<String> firstDropdown = [
    'Primaria',
    'Secudaria',
    'Preparatoria/Baachillerota',
    'Licenciatura',
    'Especialidad',
    'Maestría',
    'Doctorado',
    'Postdoctorado',
  ];

  ///
  ///  data for drop down 1
  ///
  List<String> secondDropDown = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Augosto',
    'Septiembre',
    'Ocyubre',
    'Noviembre',
    'Deciembre',
  ];

  ///
  ///  data for drop down 1
  ///
  List<String> thirdDropDown = [
    '1915',
    '1916',
    '1917',
    '1918',
    '1919',
    '1920',
    '1921',
    '1922',
    '1923',
    '1924',
    '1925',
    '1926',
    '1927',
    '1928',
    '1929',
    '1930',
    '1931',
    '1932',
    '1933',
    '1934',
    '1935',
    '1936',
    '1937',
    '1938',
    '1939',
    '1940',
    '1941',
    '1942',
    '1943',
    '1944',
    '1945',
    '1946',
    '1947',
    '1948',
    '1949',
    '1950',
    '1951',
    '1952',
    '1953',
    '1954',
    '1955',
    '1956',
    '1957',
    '1958',
    '1959',
    '1960',
    '1961',
    '1962',
    '1963',
    '1964',
    '1965',
    '1966',
    '1967',
    '1968',
    '1969',
    '1970',
    '1971',
    '1972',
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
  ];

  void toggleDropDown2(int index) {
    universityEntries[index].dropDown2Open =
        !universityEntries[index].dropDown2Open;
    notifyListeners();
  }

  void toggleDropDown3(int index) {
    universityEntries[index].dropDown3Open =
        !universityEntries[index].dropDown3Open;
    notifyListeners();
  }

  void toggleDropDown4(int index) {
    universityEntries[index].dropDown4Open =
        !universityEntries[index].dropDown4Open;
    notifyListeners();
  }

  void toggleDropDown5(int index) {
    universityEntries[index].dropDown5Open =
        !universityEntries[index].dropDown5Open;
    notifyListeners();
  }

  setDropDownText1(String value) {
    _dropDownText1 = value;
    notifyListeners();
  }

  void setDropDown2Error(bool value, int index) {
    universityEntries[index].dropDown2Error = value;
    notifyListeners();
  }

  void setDropDown3Error(bool value, int index) {
    universityEntries[index].dropDown3Error = value;
    notifyListeners();
  }

  void setDropDown4Error(bool value, int index) {
    universityEntries[index].dropDown4Error = value;
    notifyListeners();
  }

  void setDropDown5Error(bool value, int index) {
    universityEntries[index].dropDown5Error = value;
    notifyListeners();
  }

  setDropDownText2(String value) {
    _dropDownText2 = value;
    notifyListeners();
  }

  setDropDownText3(String value) {
    _dropDownText3 = value;
    notifyListeners();
  }

  setDropDownText4(String value) {
    _dropDownText4 = value;
    notifyListeners();
  }

  setDropDownText5(String value) {
    _dropDownText5 = value;
    notifyListeners();
  }

  ///
  ///
  ///
  void validateDropdowns() {
    dropDown1Error = dropDownText1.trim().isEmpty;
    dropDown2Error = dropDownText2.trim().isEmpty;
    dropDown3Error = dropDownText3.trim().isEmpty;
    dropDown4Error = dropDownText4.trim().isEmpty;
    dropDown5Error = dropDownText5.trim().isEmpty;
    notifyListeners();
  }

  init() {
    nameController.addListener(_onFieldChanged);
  }

  // In CandidateRegister11PercentViewModel

  // Update the isAllEntriesValid method to include validation checks
  // In CandidateRegister11PercentViewModel

  // Add this comprehensive validation method
  validateAllEntries() {
    bool allValid = true;

    for (var i = 0; i < universityEntries.length; i++) {
      final entry = universityEntries[i];

      if (entry.isCurrent) {
        // If currently studying, end date is not required
        entry.dropDown4Error = false;
        entry.dropDown5Error = false;
      } else {
        // If not currently studying, validate end date
        if (entry.endMonth == null || entry.endMonth!.isEmpty) {
          entry.dropDown4Error = true;
          allValid = false;
        }
        if (entry.endYear == null || entry.endYear!.isEmpty) {
          entry.dropDown5Error = true;
          allValid = false;
        }
      }

      // Validate career field
      if (entry.career == null || entry.career!.isEmpty) {
        entry.careerError = true;
        allValid = false;
      } else {
        entry.careerError = false;
      }

      // Validate university selection
      if (entry.selectedUniversity == null) {
        allValid = false;
      }

      // Validate degree
      if (entry.degree == null || entry.degree!.isEmpty) {
        entry.dropDown1Error = true;
        allValid = false;
      } else {
        entry.dropDown1Error = false;
      }

      // Validate start month
      if (entry.startMonth == null || entry.startMonth!.isEmpty) {
        entry.dropDown2Error = true;
        allValid = false;
      } else {
        entry.dropDown2Error = false;
      }

      // Validate start year
      if (entry.startYear == null || entry.startYear!.isEmpty) {
        entry.dropDown3Error = true;
        allValid = false;
      } else {
        entry.dropDown3Error = false;
      }

      // Validate end month (unless currently studying)
      if (!entry.isCurrent &&
          (entry.endMonth == null || entry.endMonth!.isEmpty)) {
        entry.dropDown4Error = true;
        allValid = false;
      } else {
        entry.dropDown4Error = false;
      }

      // Validate end year (unless currently studying)
      if (!entry.isCurrent &&
          (entry.endYear == null || entry.endYear!.isEmpty)) {
        entry.dropDown5Error = true;
        allValid = false;
      } else {
        entry.dropDown5Error = false;
      }
    }

    isFormValid = allValid;
    notifyListeners();
  }

  // Add this method to validate a specific entry
  validateEntry(int index) {
    final entry = universityEntries[index];

    entry.dropDown1Error = entry.degree == null || entry.degree!.isEmpty;
    entry.dropDown2Error =
        entry.startMonth == null || entry.startMonth!.isEmpty;
    entry.dropDown3Error = entry.startYear == null || entry.startYear!.isEmpty;
    entry.dropDown4Error = entry.endMonth == null || entry.endMonth!.isEmpty;
    entry.dropDown5Error = entry.endYear == null || entry.endYear!.isEmpty;

    notifyListeners();
  }

  // Update the updateFormValidity method
  void updateFormValidity() {
    isFormValid = validateAllEntries();
    notifyListeners();
  }

  ///
  ///
  ///
  void _onFieldChanged() {
    if (nameErrorFlag && validateEmail() == null) {
      nameErrorFlag = false;
    }
    updateFormValidity(); // <-- add this
    notifyListeners();
  }
}

class UniversityEntry {
  String? career; // Add this field
  UniversityModel? selectedUniversity;
  bool careerError = false; // Add error state
  TextEditingController universityController = TextEditingController();
  FocusNode universityFocusNode = FocusNode();
  bool isUniversitySelected = false;

  String? degree;
  String? startMonth;
  String? startYear;
  String? endMonth;
  String? endYear;
  bool isCurrent = false;

  bool dropDown1Open = false;
  bool dropDown2Open = false;
  bool dropDown3Open = false;
  bool dropDown4Open = false;
  bool dropDown5Open = false;

  bool dropDown1Error = false;
  bool dropDown2Error = false;
  bool dropDown3Error = false;
  bool dropDown4Error = false;
  bool dropDown5Error = false;
}
