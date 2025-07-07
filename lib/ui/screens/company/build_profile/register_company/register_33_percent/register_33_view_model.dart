import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class Register33ViewModel extends BaseViewModel {
  ///
  /// Controllers 33 screen
  ///
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController imssController = TextEditingController();
  final TextEditingController razonSocialController = TextEditingController();
  int rfcControllerLength = 0;
  int imssControllerLength = 0;
  int razonSocialControllerLength = 0;
  bool rfcErrorFlag = false;
  bool imssErrorFlag = false;
  bool razonSocialErrorFlag = false;

  bool dropDown1Error = false;
  bool dropDown2Error = false;
  bool dropDown3Error = false;

  bool _dropDown1 = false;
  bool _dropDown2 = false;
  bool _dropDown3 = false;

  bool get dropDown1 => _dropDown1;
  bool get dropDown2 => _dropDown2;
  bool get dropDown3 => _dropDown3;

  String _dropDownText1 = '';
  String _dropDownText2 = '';
  String _dropDownText3 = '';

  String get dropDownText1 => _dropDownText1;
  String get dropDownText2 => _dropDownText2;
  String get dropDownText3 => _dropDownText3;

  List<String> employeeCountOptions = [
    'Más de 1,000 trabajadores',
    '501 a 800 empleados',
    '201-500 empleados',
    '51-200 empleados',
    '11-50 empleados',
    '1-10 empleados',
  ];
  List<String> industryOptions = [
    'Arte y Diseño',
    'Programación y Tecnología',
    'Marketing y Publicidad',
    'Recursos Humanos y Administración',
    'Salud y Bienestar',
  ];
  List<String> sectorOptions = ['Público', 'Privado'];

  void toggleDropDown1() {
    _dropDown1 = !_dropDown1;
    notifyListeners();
  }

  void toggleDropDown2() {
    _dropDown2 = !_dropDown2;
    notifyListeners();
  }

  void toggleDropDown3() {
    _dropDown3 = !_dropDown3;
    notifyListeners();
  }

  void setDropDown1(bool value) {
    _dropDown1 = value;
    notifyListeners();
  }

  void setDropDown2(bool value) {
    _dropDown2 = value;
    notifyListeners();
  }

  void setDropDown3(bool value) {
    _dropDown3 = value;
    notifyListeners();
  }

  void setDropDownText1(String value) {
    _dropDownText1 = value;
    notifyListeners();
  }

  void setDropDownText2(String value) {
    _dropDownText2 = value;
    notifyListeners();
  }

  void setDropDownText3(String value) {
    _dropDownText3 = value;
    notifyListeners();
  }

  Register33ViewModel() {
    rfcController.addListener(_updaterfcControllerLength);
    imssController.addListener(_updateimssControllerLength);
    razonSocialController.addListener(_updaterazonSocialControllerLength);
    init();
  }

  init() {
    rfcController.addListener(() {
      if (rfcErrorFlag) {
        rfcErrorFlag = false;
        notifyListeners();
      }
    });

    imssController.addListener(() {
      if (imssErrorFlag) {
        imssErrorFlag = false;
        notifyListeners();
      }
    });

    razonSocialController.addListener(() {
      if (razonSocialErrorFlag) {
        razonSocialErrorFlag = false;
        notifyListeners();
      }
    });
  }

  static final _rfcRegExp = RegExp(r'^[A-ZÑ&]{3,4}\d{6}[A-Z0-9]{2}[0-9A]?$');
  static final _imssRegExp = RegExp(r'^[A-Za-z][0-9]{10}$');
  // Update your validation methods
  String? validateRfc() {
    final value = rfcController.text.trim().toUpperCase();
    if (value.isEmpty) return 'field_required'.tr;
    if (value.length > 15) return 'Maximum 15 characters allowed';
    if (!_rfcRegExp.hasMatch(value)) return 'invalid_rfc_format'.tr;
    return null;
  }

  String? validateImss() {
    final value = imssController.text.trim();
    if (value.isEmpty) return 'field_required'.tr;
    if (value.length > 15) return 'Maximum 15 characters allowed';
    if (!_imssRegExp.hasMatch(value)) return 'invalid_imss_format'.tr;
    return null;
  }

  String? validateRazonSocial() {
    final value = razonSocialController.text.trim();
    if (value.isEmpty) return 'field_required'.tr;
    if (value.length > 50) return 'Maximum 50 characters allowed';
    return null;
  }

  String? get rfcError => rfcErrorFlag ? validateRfc() : null;
  String? get imssError => imssErrorFlag ? validateImss() : null;
  String? get razonSocialError =>
      razonSocialErrorFlag ? validateRazonSocial() : null;

  void validateDropdowns() {
    dropDown1Error = dropDownText1.trim().isEmpty;
    dropDown2Error = dropDownText2.trim().isEmpty;
    dropDown3Error = dropDownText3.trim().isEmpty;
    notifyListeners();
  }

  bool get isFormCompletelyValid {
    // Check dropdowns
    bool dropdownsValid =
        dropDownText1.isNotEmpty &&
        dropDownText2.isNotEmpty &&
        dropDownText3.isNotEmpty;

    // Check text fields
    bool textFieldsValid =
        validateRfc() == null &&
        validateImss() == null &&
        validateRazonSocial() == null;

    return dropdownsValid && textFieldsValid;
  }

  void _updaterfcControllerLength() {
    rfcControllerLength = rfcController.text.length;
    notifyListeners();
  }

  void _updateimssControllerLength() {
    imssControllerLength = imssController.text.length;
    notifyListeners();
  }

  void _updaterazonSocialControllerLength() {
    razonSocialControllerLength = razonSocialController.text.length;
    notifyListeners();
  }

  void validateForm() {
    rfcErrorFlag = true;
    imssErrorFlag = true;
    razonSocialErrorFlag = true;

    // Explicitly validate each field to ensure error flags are set
    validateRfc();
    validateImss();
    validateRazonSocial();

    notifyListeners();
  }

  @override
  void dispose() {
    rfcController.dispose();
    imssController.dispose();
    razonSocialController.dispose();

    super.dispose();
  }
}
