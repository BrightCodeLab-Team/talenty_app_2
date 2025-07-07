// ignore_for_file: unnecessary_null_comparison, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class Register50ViewModel extends BaseViewModel {
  //4th screen controllers
  final TextEditingController numeroExteriorController =
      TextEditingController();
  final TextEditingController numeroInteriorController =
      TextEditingController();
  final TextEditingController coloniaController = TextEditingController();
  final TextEditingController calleController = TextEditingController();
  final TextEditingController codigoPostalController = TextEditingController();

  // Bool for hardcoded loader
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  String _dropDownText4 = '';
  String _dropDownText5 = '';

  String get dropDownText4 => _dropDownText4;
  String get dropDownText5 => _dropDownText5;

  void setDropDownText4(String value) {
    _dropDownText4 = value;
    notifyListeners();
  }

  void setDropDownText5(String value) {
    _dropDownText5 = value;
    notifyListeners();
  }

  /// ****** validation ******* ///
  ///

  bool dropDown4Error = false;
  bool dropDown5Error = false;

  bool _dropDown4 = false;
  bool _dropDown5 = false;

  bool get dropDown4 => _dropDown4;
  bool get dropDown5 => _dropDown5;

  bool exteriorNumberError = false;
  bool numerIntriorNumberError = false;
  bool coloniaError = false;
  bool calleError = false;
  bool postalCodeError = false;

  void updateFormValidity() {
    notifyListeners();
  }

  bool get isFormValid {
    return dropDownText4.isNotEmpty &&
        dropDownText5.isNotEmpty &&
        numeroExteriorController.text.trim().isNotEmpty &&
        coloniaController.text.trim().isNotEmpty &&
        calleController.text.trim().isNotEmpty &&
        codigoPostalController.text.trim().isNotEmpty;
  }

  void validateDropdown() {
    dropDown4Error = dropDownText4.isEmpty;
    dropDown5Error = dropDownText5.isEmpty;
    notifyListeners();
  }

  void validateTextFields() {
    exteriorNumberError = numeroExteriorController.text.trim().isEmpty;
    numerIntriorNumberError = numeroInteriorController.text.trim().isEmpty;
    coloniaError = coloniaController.text.trim().isEmpty;
    calleError = calleController.text.trim().isEmpty;
    postalCodeError = codigoPostalController.text.trim().isEmpty;
    notifyListeners();
  }

  ///
  /// Drop Downs
  ///

  void toggleDropDown4() {
    _dropDown4 = !_dropDown4;
    notifyListeners();
  }

  void toggleDropDown5() {
    _dropDown5 = !_dropDown5;
    notifyListeners();
  }

  void setDropDown4(bool value) {
    _dropDown4 = value;
    notifyListeners();
  }

  void setDropDown5(bool value) {
    _dropDown5 = value;
    notifyListeners();
  }

  void initializeListeners() {
    numeroExteriorController.addListener(() {
      if (exteriorNumberError && numeroExteriorController.text.isNotEmpty) {
        exteriorNumberError = false;
        notifyListeners();
      }
    });

    numeroInteriorController.addListener(() {
      if (numerIntriorNumberError && numeroInteriorController.text.isNotEmpty) {
        numerIntriorNumberError = false;
        notifyListeners();
      }
    });

    coloniaController.addListener(() {
      if (coloniaError && coloniaController.text.isNotEmpty) {
        coloniaError = false;
        notifyListeners();
      }
    });

    calleController.addListener(() {
      if (calleError && calleController.text.isNotEmpty) {
        calleError = false;
        notifyListeners();
      }
    });

    codigoPostalController.addListener(() {
      if (postalCodeError && codigoPostalController.text.isNotEmpty) {
        postalCodeError = false;
        notifyListeners();
      }
    });
  }

  // List of Options in Drop Downs

  List<String> employeeCountOptions = [
    'Más de 1,000 trabajadores',
    '501 a 800 empleados',
    '201-500 empleados',
    '51-200 empleados',
    '11-50 empleados',
    '1-10 empleados',
  ];

  /// Opciones para el dropdown de estados
  List<String> stateOptions = [
    'Aguascalientes',
    'Baja California',
    'Baja California Sur',
    'Campeche',
    'Chiapas',
    'Chihuahua',
    'Ciudad de México',
  ];

  /// Opciones para el dropdown de alcaldías/municipios de CDMX
  List<String> municipalityOptions = [
    'Álvaro Obregón',
    'Azcapotzalco',
    'Benito Juárez',
    'Coyoacán',
    'Cuajimalpa de Morelos',
  ];

  RegisterCompanyViewModel() {
    initializeListeners();
  }

  // String? validateDescription() {
  //   final value = descriptionController.text.trim();
  //   if (value.isEmpty) return 'enter_your_company_descrip'.tr;
  //   return null;
  // }

  ///
  /// Dispose
  ///

  @override
  void dispose() {
    numeroExteriorController.dispose();
    numeroInteriorController.dispose();
    coloniaController.dispose();
    calleController.dispose();
    codigoPostalController.dispose();
    super.dispose();
  }
}
