import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class MandatoryStudentRegViewModel extends BaseViewModel {
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
  String _dropDownText2 = '';
  String _dropDownText3 = '';
  String _dropDownText4 = '';
  String _dropDownText5 = '';

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
    nameController.addListener(_onFieldChanged);
  }

  void updateFormValidity() {
    isFormValid =
        nameController.text.trim().isNotEmpty &&
        dropDownText1.isNotEmpty &&
        dropDownText2.isNotEmpty &&
        dropDownText3.isNotEmpty &&
        dropDownText4.isNotEmpty &&
        dropDownText5.isNotEmpty &&
        isCheckboxChecked;
    notifyListeners();
  }

  void _onFieldChanged() {
    if (nameErrorFlag && validateEmail() == null) {
      nameErrorFlag = false;
    }
    updateFormValidity(); // <-- add this
    notifyListeners();
  }
}
