// ignore_for_file: prefer_function_declarations_over_variables

import 'package:get/get_utils/get_utils.dart';

class KlValidators {
  //-------------------------------Name Validation--------------------------------
  static final String? Function(String?) emailValitador = (value) {
    if (value == null || value.isEmpty) {
      return "enterValidEmail".tr;
    } else if (value.contains('@') && value.endsWith('.com')) {
      return null;
    }
    return 'invalidEmail'.tr;
  };

  static final String? Function(String?) logInPasswordValidator = (value) {
    if (value!.isEmpty || value.trim().isEmpty) {
      return 'enterValidPassword'.tr;
    } else if (value.length < 6) {
      return ("invalidPassword".tr);
    } else {
      return null;
    }
  };
  //  if (value == null || value.isEmpty) {
  //                           return "Please enter your password";
  //                         } else {
  //                           RegExp regex = RegExp(
  //                               r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{6,}$');
  //                           var passNonNullValue = value;
  //                           if (passNonNullValue.isEmpty) {
  //                             return ("Password is required");
  // } else if (passNonNullValue.length < 6) {
  //   return ("Password Must be more than 5 characters");
  // } else if (!regex.hasMatch(passNonNullValue)) {
  //                             return ("Invalid Password");
  //                           }
  //                           return null;
  //                         }
  //                       },

  static final String? Function(String?) firstNameValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterName'.tr;
    }
    return null;
  };
  static final String? Function(String?) diseaseNameValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterDiseaseName'.tr;
    }
    return null;
  };

  static final String? Function(String?) descriptionValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterdiseaseDescription'.tr;
    }
    return null;
  };

  static final String? Function(String?) remediesValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterreamedies'.tr;
    }
    return null;
  };

  static final String? Function(String?) weatherValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterWeather'.tr;
    }
    return null;
  };

  static final String? Function(String?) secondNameValidator = (secondName) {
    if (secondName!.isEmpty || secondName.trim().isEmpty) {
      return 'enterlastName'.tr;
    }
    return null;
  };
  static final String? Function(String?) locationNameValidator = (firstName) {
    if (firstName!.isEmpty || firstName.trim().isEmpty) {
      return 'enterLocation'.tr;
    }
    return null;
  };
}
