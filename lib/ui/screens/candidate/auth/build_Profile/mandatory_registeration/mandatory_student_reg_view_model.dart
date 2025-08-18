// ignore_for_file: strict_top_level_inference

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class MandatoryStudentRegViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController optionalController = TextEditingController();
  TextEditingController federativeEntityController = TextEditingController();
  TextEditingController cologneController = TextEditingController();

  ///
  /// Bool
  ///
  bool emailErrorFlag = false;
  bool middleNameErrorFlag = false;
  bool lastNameErrorFlag = false;
  bool optionalErrorFlag = false;
  bool federativeEntityErrorFlag = false;
  bool cologneErrorFlag = false;

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
  String? get emailError => emailErrorFlag ? validateEmail() : null;
  String? get middleNameError =>
      middleNameErrorFlag ? validateMiddleName() : null;
  String? get lastNameError => lastNameErrorFlag ? validateLastName() : null;

  String? get federativeEntityError =>
      federativeEntityErrorFlag ? federativeEntityValidation() : null;
  String? get cologneError => cologneErrorFlag ? cologneValidation() : null;
  String _dropDownText1 = '';
  String _dropDownText2 = '';
  String _dropDownText3 = '';
  String _dropDownText4 = '';
  String _dropDownText5 = '';

  String get dropDownText1 => _dropDownText1;
  String get dropDownText2 => _dropDownText2;
  String get dropDownText3 => _dropDownText3;
  String get dropDownText4 => _dropDownText4;
  String get dropDownText5 => _dropDownText5;
  // email
  String? validateEmail() {
    final email = emailController.text.trim();
    if (email.isEmpty) return 'enterValidEmail'.tr;

    return null;
  }

  // middle name
  String? validateMiddleName() {
    final middleName = middleNameController.text.trim();
    if (middleName.isEmpty) return 'enter valid middle name'.tr;

    return null;
  }

  // last name
  String? validateLastName() {
    final lastName = lastNameController.text.trim();
    if (lastName.isEmpty) return 'enter valid last name'.tr;

    return null;
  }
  // federativeEntity

  String? federativeEntityValidation() {
    final federativeEntity = federativeEntityController.text.trim();
    if (federativeEntity.isEmpty) return 'enter valid federativeEntity'.tr;

    return null;
  }

  // cologne
  String? cologneValidation() {
    final cologne = cologneController.text.trim();
    if (cologne.isEmpty) return 'enter valid cologne'.tr;

    return null;
  }

  MandatoryStudentRegViewModel() {
    init();
  }

  List<String> day = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];

  List<String> month = [
    'January',
    'Febuary',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  ///
  ///  data for drop down 4
  ///
  List<String> fourthDropdown = [
    'Aguascalients',
    'Baja California',
    'Baja California Sur',
    'Campeche',
    'Chiapas',
    'Chihuahua',
    'Ciudad de Mexico',
    'Coahuila',
    'Colima',
    'Durango',
    'Estado de México',
    'Guerrero',
    'Hidalgo',
    'Jalisco',
    'Michoacan',
    'Morlos',
    'Nayarit',
    'Noevo lèon',
    'Oaxaca,',
    'Puebla',
    'Queretaro',
    'Quintana Roo',
    'San Luis Potosi',
    'Sinaloa',
    'Sonora',
    'Tabasco',
    'Tamaulipas',
    'Tlaxcala',
    'Veracruz',
    'Yucatan',
    'Zacatecas',
  ];

  ///
  ///  data for drop down 5
  ///
  List<String> fifthDropdown = [
    'Azcapotzalco',
    'Coyoacán',
    'Cuajimalpa de Morlos',
    'Gustavo A, Medero',
    'Iztacalco',
    'Lamagdalena Contreras',
    'Milpa Alta',
    'Alvaro Obrigon',
    'TláHuac',
    'Tlalpan',
    'Xochimilco',
    'Benito juárez',
    'Cuauhtémoc',
    'Miguel Hidalgo',
    'Venustiano Carranza',
  ];

  ///
  ///  data for drop down 6
  ///
  List<String> sixthDropdown = [
    'Arte y Dieseño',
    'Programación y Technol0gía',
    'Marketing y Publicidad',
    'Recursos Humanos y Administración',
    'Salud y Bienstar',
    'Educación y Formación',
    'Logísticat y Transporte',
    'Ingeneiría y Construcción',
    'Ventos y Atención al Cliente'
        'Finanzas y Economía',
    'Oficios y Trabajo Manual ',
    'Alimentación y Hotelería',
    'Cienciay Technología',
  ];
  List<String> year = List.generate(
    DateTime.now().year - 1950 + 1,
    (index) => (1950 + index).toString(),
  );

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

  void validateDropdowns() {
    dropDown1Error = dropDownText1.trim().isEmpty;
    dropDown2Error = dropDownText2.trim().isEmpty;
    dropDown3Error = dropDownText3.trim().isEmpty;
    dropDown4Error = dropDownText4.trim().isEmpty;
    dropDown5Error = dropDownText5.trim().isEmpty;
    notifyListeners();
  }

  init() {
    emailController.addListener(_onFieldChanged);
    middleNameController.addListener(_onFieldChanged);
    lastNameController.addListener(_onFieldChanged);
    optionalController.addListener(_onFieldChanged);
    federativeEntityController.addListener(_onFieldChanged);
    cologneController.addListener(_onFieldChanged);
  }

  void updateFormValidity() {
    isFormValid =
        emailController.text.trim().isNotEmpty &&
        middleNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty &&
        optionalController.text.trim().isNotEmpty &&
        federativeEntityController.text.trim().isNotEmpty &&
        cologneController.text.trim().isNotEmpty &&
        dropDownText1.isNotEmpty &&
        dropDownText2.isNotEmpty &&
        dropDownText3.isNotEmpty &&
        dropDownText4.isNotEmpty &&
        dropDownText5.isNotEmpty &&
        isCheckboxChecked;
    notifyListeners();
  }

  void _onFieldChanged() {
    if (emailErrorFlag && validateEmail() == null) {
      emailErrorFlag = false;
    } else if (middleNameErrorFlag && validateMiddleName() == null) {
      emailErrorFlag = false;
    } else if (lastNameErrorFlag && validateLastName() == null) {
      emailErrorFlag = false;
    } else if (federativeEntityErrorFlag &&
        federativeEntityValidation() == null) {
      federativeEntityErrorFlag = false;
    } else if (cologneErrorFlag && cologneValidation() == null) {
      cologneErrorFlag = false;
    }

    updateFormValidity(); // <-- add this
    notifyListeners();
  }
}
