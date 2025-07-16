import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/screens/candidate/auth/country_code/country_code_view_model.dart';

class CandidateRegistrationCountryCodeScreen extends StatefulWidget {
  const CandidateRegistrationCountryCodeScreen({Key? key}) : super(key: key);

  @override
  State<CandidateRegistrationCountryCodeScreen> createState() =>
      _CandidateRegistrationCountryCodeScreenState();
}

class _CandidateRegistrationCountryCodeScreenState
    extends State<CandidateRegistrationCountryCodeScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _confirmPhoneNumberController =
      TextEditingController();

  CountryCode _selectedCountryCode = CountryCode(
    code: 'MX',
    dialCode: '+52',
  ); // Default to Mexico as per your image

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _confirmPhoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true); // Make sure this is initialized once, typically in main.dart

    return ChangeNotifierProvider(
      create: (context) => CountryCodeViewModel(),
      child: Consumer<CountryCodeViewModel>(
        builder:
            (context, value, child) => Scaffold(
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
                            style: style14M.copyWith(color: textLightGreyColor),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          // Country Code Picker Container with adjusted size and shadow
                          Container(
                            height: 50.h, // Smaller height
                            decoration: BoxDecoration(
                              border: Border.all(color: borderGreyColor),
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                    0.1,
                                  ), // Subtle shadow
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(
                                    0,
                                    1,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: CountryCodePicker(
                              onChanged: (countryCode) {
                                setState(() {
                                  _selectedCountryCode = countryCode;
                                });
                              },
                              initialSelection: _selectedCountryCode.code,
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
                              searchStyle: style14M.copyWith(color: blackColor),
                              boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: borderGreyColor),
                              ),
                              dialogSize: Size(300.w, 400.h),
                            ),
                          ),
                          10.horizontalSpace, // Small spacing between picker and text field
                          // Flexible TextFormField
                          Expanded(
                            child: TextFormField(
                              controller: _phoneNumberController,
                              decoration: authFieldDecoration.copyWith(
                                hintText: '55-00-000-000',
                                // Removed suffixText as per image. If you want it for "obligatorio", put it back.
                                // The "*obligatorio" is already displayed above the field.
                                // suffixText: '*obligatorio',
                                suffixStyle: style14M.copyWith(
                                  color: borderGreyColor,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
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
                            style: style14M.copyWith(color: textLightGreyColor),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          // Country Code Picker Container with adjusted size and shadow
                          Container(
                            height: 50.h, // Smaller height
                            decoration: BoxDecoration(
                              border: Border.all(color: borderGreyColor),
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                    0.1,
                                  ), // Subtle shadow
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(
                                    0,
                                    1,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: CountryCodePicker(
                              onChanged: (countryCode) {
                                // You might want to update a separate state for the confirm field's country code,
                                // or link it to the first one if they should always be the same.
                                // For now, it simply updates nothing specific for the confirm field.
                              },
                              initialSelection: _selectedCountryCode.code,
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
                              searchStyle: style14M.copyWith(color: blackColor),
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
                              controller: _confirmPhoneNumberController,
                              decoration: authFieldDecoration.copyWith(
                                hintText: '55-00-000-000',
                                // Removed suffixText as per image.
                                // suffixText: '*obligatorio',
                                suffixStyle: style14M.copyWith(
                                  color: borderGreyColor,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
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
      ),
    );
  }
}
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
// ///
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:talenty_app/ui/screens/candidate/auth/country_code/country_code_view_model.dart';

// class CandidateRegistrationCountryCodeScreen extends StatefulWidget {
//   const CandidateRegistrationCountryCodeScreen({Key? key}) : super(key: key);

//   @override
//   State<CandidateRegistrationCountryCodeScreen> createState() =>
//       _CandidateRegistrationCountryCodeScreenState();
// }

// class _CandidateRegistrationCountryCodeScreenState
//     extends State<CandidateRegistrationCountryCodeScreen> {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _confirmPhoneController = TextEditingController();

//   CountryCode _selectedCountryCode = CountryCode(
//     name: 'Mexico',
//     flag: '🇲🇽',
//     code: '+52',
//   );

//   CountryCode _selectedConfirmCountryCode = CountryCode(
//     name: 'Mexico',
//     flag: '🇲🇽',
//     code: '+52',
//   );

//   final authFieldDecoration = InputDecoration(
//     filled: true,
//     fillColor: Colors.white,
//     hintText: 'Enter your email',
//     hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(color: Colors.grey[300]!),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(color: Colors.black, width: 1.2),
//     ),
//     disabledBorder: UnderlineInputBorder(
//       borderSide: BorderSide(color: Colors.grey[300]!),
//       borderRadius: BorderRadius.circular(10),
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Talenty',
//           style: TextStyle(
//             color: Colors.red,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 20.h),

//               // Page Title
//               Text(
//                 'Ingresa tu número celular',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),

//               SizedBox(height: 30.h),

//               // First Phone Number Section
//               Row(
//                 children: [
//                   Text(
//                     'Ingresa tu número celular',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Spacer(),
//                   Text(
//                     '*obligatorio',
//                     style: TextStyle(fontSize: 14, color: Colors.grey[500]),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 12.h),

//               // Phone Number Input Row
//               Row(
//                 children: [
//                   // Country Code Picker
//                   CountryCodeDropdown(
//                     selectedCountry: _selectedCountryCode,
//                     onChanged: (CountryCode country) {
//                       setState(() {
//                         _selectedCountryCode = country;
//                       });
//                     },
//                   ),

//                   SizedBox(width: 12.w),

//                   // Phone Number Input
//                   Expanded(
//                     child: TextFormField(
//                       controller: _phoneController,
//                       decoration: authFieldDecoration.copyWith(
//                         hintText: '55-00-000-000',
//                         contentPadding: EdgeInsets.symmetric(
//                           horizontal: 16.w,
//                           vertical: 16.h,
//                         ),
//                       ),
//                       keyboardType: TextInputType.phone,
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 30.h),

//               // Confirm Phone Number Section
//               Row(
//                 children: [
//                   Text(
//                     'Confirma tu número celular',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Spacer(),
//                   Text(
//                     '*obligatorio',
//                     style: TextStyle(fontSize: 14, color: Colors.grey[500]),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 12.h),

//               // Confirm Phone Number Input Row
//               Row(
//                 children: [
//                   // Country Code Picker for Confirmation
//                   CountryCodeDropdown(
//                     selectedCountry: _selectedConfirmCountryCode,
//                     onChanged: (CountryCode country) {
//                       setState(() {
//                         _selectedConfirmCountryCode = country;
//                       });
//                     },
//                   ),

//                   SizedBox(width: 12.w),

//                   // Confirm Phone Number Input
//                   Expanded(
//                     child: TextFormField(
//                       controller: _confirmPhoneController,
//                       decoration: authFieldDecoration.copyWith(
//                         hintText: '55-00-000-000',
//                         contentPadding: EdgeInsets.symmetric(
//                           horizontal: 16.w,
//                           vertical: 16.h,
//                         ),
//                       ),
//                       keyboardType: TextInputType.phone,
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 40.h),

//               // Privacy Notice
//               Text(
//                 'Tu número de celular será usado para que las empresas puedan contactarte y tener un trato directo contigo. En Talenty no compartimos tu información con otros usuarios.',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey[600],
//                   height: 1.5,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CountryCodeDropdown extends StatelessWidget {
//   final CountryCode selectedCountry;
//   final Function(CountryCode) onChanged;

//   const CountryCodeDropdown({
//     Key? key,
//     required this.selectedCountry,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56.h,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(10.r),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: Offset(0, 1),
//           ),
//         ],
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<CountryCode>(
//           value: selectedCountry,
//           onChanged: (CountryCode? country) {
//             if (country != null) {
//               onChanged(country);
//             }
//           },
//           items:
//               CountryData.countries.map<DropdownMenuItem<CountryCode>>((
//                 CountryCode country,
//               ) {
//                 return DropdownMenuItem<CountryCode>(
//                   value: country,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 12.w),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(country.flag, style: TextStyle(fontSize: 18)),
//                         SizedBox(width: 8.w),
//                         Text(
//                           country.code,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//           selectedItemBuilder: (BuildContext context) {
//             return CountryData.countries.map<Widget>((CountryCode country) {
//               return Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12.w),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(country.flag, style: TextStyle(fontSize: 18)),
//                     SizedBox(width: 8.w),
//                     Text(
//                       country.code,
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(width: 4.w),
//                     Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
//                   ],
//                 ),
//               );
//             }).toList();
//           },
//           icon: Container(),
//           dropdownColor: Colors.white,
//           elevation: 8,
//           borderRadius: BorderRadius.circular(10.r),
//           menuMaxHeight: 300.h,
//         ),
//       ),
//     );
//   }
// }
// ///
///
///
///
///