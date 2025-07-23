// ignore_for_file: strict_top_level_inference, use_function_type_syntax_for_parameters

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/widgets.dart';

import 'package:talenty_app/core/others/base_view_model.dart';

class CountryCodeViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPhoneNumberController = TextEditingController();
  bool phoneNumberError = false;
  bool confirmPhoneNumberError = false;
  bool countryCodeMismatchError = false;

  // 👇 New state variable
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  CountryCodeViewModel() {
    phoneNumberController.addListener(() {
      if (phoneNumberError &&
          RegExp(r'^\d{7,15}$').hasMatch(phoneNumberController.text.trim())) {
        phoneNumberError = false;
        notifyListeners();
      }
    });

    confirmPhoneNumberController.addListener(() {
      if (confirmPhoneNumberError &&
          confirmPhoneNumberController.text.trim() ==
              phoneNumberController.text.trim()) {
        confirmPhoneNumberError = false;
        notifyListeners();
      }

      if (countryCodeMismatchError &&
          selectedCountryCode.dialCode == confirmSelectedCountryCode.dialCode) {
        countryCodeMismatchError = false;
        notifyListeners();
      }
    });

    // Optional: keep this if you want to notify on any field change
    phoneNumberController.addListener(_onFormChanged);
    confirmPhoneNumberController.addListener(_onFormChanged);
  }

  void _onFormChanged() {
    notifyListeners();
  }

  CountryCode selectedCountryCode = CountryCode(code: 'MX', dialCode: '+52');
  CountryCode confirmSelectedCountryCode = CountryCode(
    code: 'MX',
    dialCode: '+52',
  );

  void validatePhoneFields() {
    phoneNumberError =
        phoneNumberController.text.trim().isEmpty ||
        !RegExp(r'^\d{7,15}$').hasMatch(phoneNumberController.text.trim());

    confirmPhoneNumberError =
        confirmPhoneNumberController.text.trim().isEmpty ||
        confirmPhoneNumberController.text.trim() !=
            phoneNumberController.text.trim();

    countryCodeMismatchError =
        selectedCountryCode.dialCode != confirmSelectedCountryCode.dialCode;

    notifyListeners();
  }

  void onChanged(CountryCode countryCode) {
    selectedCountryCode = countryCode;
    notifyListeners();
  }

  void onConfirmChanged(CountryCode countryCode) {
    confirmSelectedCountryCode = countryCode;
    notifyListeners();
  }

  bool validateButton() {
    final isValid = formKey.currentState?.validate() == true;
    return isValid &&
        phoneNumberController.text.isNotEmpty &&
        confirmPhoneNumberController.text.isNotEmpty &&
        selectedCountryCode.dialCode == confirmSelectedCountryCode.dialCode &&
        phoneNumberController.text == confirmPhoneNumberController.text;
  }

  /// Call this on "Continuar" button press to enable validation
  void enableAutoValidate() {
    autoValidateMode = AutovalidateMode.always;
    notifyListeners();
  }
}
