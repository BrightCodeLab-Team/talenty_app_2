import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class CandidateRegister22PercentViewModel extends BaseViewModel {
  TextEditingController nameController = TextEditingController();

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
  bool isCheckboxChecked1 = false;
  bool isCheckboxChecked2 = false;
  bool isCheckboxChecked3 = false;
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

  MandatoryStudentRegViewModel() {
    init();
  }

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

  // List<String> year = List.generate(
  //   DateTime.now().year - 1950 + 1,
  //   (index) => (1950 + index).toString(),
  // );

  toggleDropDown1() {
    _dropDown1 = !_dropDown1;
    notifyListeners();
  }

  toggleDropDown2() {
    _dropDown2 = !_dropDown2;
    notifyListeners();
  }

  toggleDropDown3() {
    _dropDown3 = !_dropDown3;
    notifyListeners();
  }

  toggleDropDown4() {
    _dropDown4 = !_dropDown4;
    notifyListeners();
  }

  toggleDropDown5() {
    _dropDown5 = !_dropDown5;
    notifyListeners();
  }

  setDropDownText1(String value) {
    _dropDownText1 = value;
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

  ///
  ///
  ///
  void updateFormValidity() {
    isFormValid =
        nameController.text.trim().isNotEmpty &&
        dropDownText1.isNotEmpty &&
        dropDownText2.isNotEmpty &&
        dropDownText3.isNotEmpty &&
        dropDownText4.isNotEmpty &&
        dropDownText5.isNotEmpty &&
        isCheckboxChecked1 &&
        isCheckboxChecked2 &&
        isCheckboxChecked3;
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
