// ignore_for_file: use_key_in_widget_constructors

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/add_photo_to_profile/add_photo_screen.dart';
import 'package:talenty_app/ui/screens/candidate/auth/country_code/country_code_view_model.dart';

class CandidateRegistrationCountryCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountryCodeViewModel(),
      child: Consumer<CountryCodeViewModel>(
        builder:
            (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Image.asset(AppAssets.appLogo2, scale: 4),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: model.formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.verticalSpace,
                        // First phone number input section
                        Row(
                          children: [
                            Text(
                              'Ingresa tu número celular',
                              style: style16B.copyWith(color: blackColor),
                            ),
                            const Spacer(),
                            Text(
                              '*obligatorio',
                              style: style14M.copyWith(
                                color: textLightGreyColor,
                              ),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            // Country Code Picker Container with adjusted size and shadow
                            Container(
                              height: 40.h, // Smaller height
                              width: 130,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: borderGreyColor),
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColor.withOpacity(
                                      0.3,
                                    ), // Subtle shadow
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                    offset: const Offset(
                                      0,
                                      4,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CountryCodePicker(
                                onChanged: (countryCode) {
                                  model.onChanged(countryCode);
                                },
                                initialSelection:
                                    model.selectedCountryCode.code,
                                favorite: const [
                                  '+52',
                                  'MX',
                                ], // Example favorites
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                showDropDownButton: true,
                                padding: EdgeInsets.zero,
                                alignLeft: false,
                                textStyle: style14M.copyWith(color: blackColor),
                                dialogTextStyle: style14M.copyWith(
                                  color: blackColor,
                                ),
                                searchStyle: style14M.copyWith(
                                  color: blackColor,
                                ),
                                boxDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: borderGreyColor),
                                ),
                                dialogSize: Size(300.w, 400.h),
                              ),
                            ),
                            10.horizontalSpace, // Small spacing between picker and text field
                            ///
                            /// Phone Number
                            ///
                            Expanded(
                              child: TextFormField(
                                controller: model.phoneNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: authFieldDecoration.copyWith(
                                  hintText: '55-00-000-000',
                                  errorText:
                                      model.phoneNumberError
                                          ? 'Ingrese un número de teléfono válido'
                                          : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        // Second phone number confirmation section
                        Row(
                          children: [
                            Text(
                              'Confirma tu número celular',
                              style: style16B.copyWith(color: blackColor),
                            ),
                            const Spacer(),
                            Text(
                              '*obligatorio',
                              style: style14M.copyWith(
                                color: textLightGreyColor,
                              ),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            // Country Code Picker Container with adjusted size and shadow
                            Container(
                              height: 40.h, // Smaller height
                              width: 130,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: borderGreyColor),
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColor.withOpacity(
                                      0.3,
                                    ), // Subtle shadow
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                    offset: const Offset(
                                      0,
                                      4,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CountryCodePicker(
                                onChanged: (countryCode) {
                                  model.onConfirmChanged(countryCode);
                                },
                                initialSelection:
                                    model.confirmSelectedCountryCode.code,
                                favorite: const ['+52', 'MX'],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                showDropDownButton: true,
                                padding: EdgeInsets.zero,
                                alignLeft: false,
                                textStyle: style14M.copyWith(color: blackColor),
                                dialogTextStyle: style14M.copyWith(
                                  color: blackColor,
                                ),
                                searchStyle: style14M.copyWith(
                                  color: blackColor,
                                ),
                                boxDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: borderGreyColor),
                                ),
                                dialogSize: Size(300.w, 400.h),
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: TextFormField(
                                controller: model.confirmPhoneNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: authFieldDecoration.copyWith(
                                  hintText: 'Confirmar número',
                                  errorText:
                                      model.confirmPhoneNumberError
                                          ? 'Phone numbers do not match'
                                          : model.countryCodeMismatchError
                                          ? 'Country codes do not match'
                                          : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        30.verticalSpace,
                        Text(
                          'Tu número de celular será usado para que las empresas puedan contactarte y tener un trato directo contigo. En Talenty no compartimos tu información con otros usuarios.',
                          style: style14M.copyWith(color: textLightGreyColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15,
                  bottom: 30,
                ),
                child: CustomButton(
                  onTap: () {
                    model.validatePhoneFields();
                    if (!model.phoneNumberError &&
                        !model.confirmPhoneNumberError &&
                        !model.countryCodeMismatchError) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CandidateAddPhotoScreen(),
                        ),
                      );
                    }
                  },

                  text: 'Continuar',
                  backgroundColor:
                      model.validateButton() ? primaryColor : greyColor,
                ),
              ),
            ),
      ),
    );
  }
}
