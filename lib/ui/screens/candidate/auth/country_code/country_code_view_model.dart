import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class CountryCodeViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPhoneNumberController = TextEditingController();
  CountryCodeViewModel() {
    phoneNumberController.addListener(_onFormChanged);
    confirmPhoneNumberController.addListener(_onFormChanged);
  }

  void _onFormChanged() {
    notifyListeners();
  }

  ///
  /// validate phone number
  ///
  String? validatePhoneNumber(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }

  ///
  ///  validate confirm phone number
  ///
  String? validateConfirmPhoneNumber(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please confirm your phone number';
    } else if (phoneNumberController.text !=
        confirmPhoneNumberController.text) {
      return 'Phone numbers do not match';
    }
    return null;
  }

  ///
  ///. validate button
  ///
  bool validateButton() {
    final currentState = formKey.currentState;
    if (currentState != null && currentState.validate()) {
      return true;
    }
    return false;
  }
}

// class CountryCode {
//   final String name;
//   final String flag;
//   final String code;

//   CountryCode({required this.name, required this.flag, required this.code});

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is CountryCode && other.code == code;
//   }

//   @override
//   int get hashCode => code.hashCode;
// }

////
///
///
///
// class CountryData {
//   static final List<CountryCode> countries = [
//     CountryCode(name: 'Mexico', flag: '🇲🇽', code: '+52'),
//     CountryCode(name: 'Afghanistan', flag: '🇦🇫', code: '+93'),
//     CountryCode(name: 'Aland Islands', flag: '🇦🇽', code: '+358 18'),
//     CountryCode(name: 'Albania', flag: '🇦🇱', code: '+355'),
//     CountryCode(name: 'Algeria', flag: '🇩🇿', code: '+213'),
//     CountryCode(name: 'American Samoa', flag: '🇦🇸', code: '+1 684'),
//     CountryCode(name: 'Andorra', flag: '🇦🇩', code: '+376'),
//     CountryCode(name: 'Angola', flag: '🇦🇴', code: '+244'),
//     CountryCode(name: 'Anguilla', flag: '🇦🇮', code: '+1 264'),
//     CountryCode(name: 'Antarctica', flag: '🇦🇶', code: '+672'),
//     CountryCode(name: 'Antigua and Barbuda', flag: '🇦🇬', code: '+1 268'),
//     CountryCode(name: 'Argentina', flag: '🇦🇷', code: '+54'),
//     CountryCode(name: 'Armenia', flag: '🇦🇲', code: '+374'),
//     CountryCode(name: 'Aruba', flag: '🇦🇼', code: '+297'),
//     CountryCode(name: 'Australia', flag: '🇦🇺', code: '+61'),
//     CountryCode(name: 'Austria', flag: '🇦🇹', code: '+43'),
//     CountryCode(name: 'Azerbaijan', flag: '🇦🇿', code: '+994'),
//     CountryCode(name: 'Bahamas', flag: '🇧🇸', code: '+1 242'),
//     CountryCode(name: 'Bahrain', flag: '🇧🇭', code: '+973'),
//     CountryCode(name: 'Bangladesh', flag: '🇧🇩', code: '+880'),
//     CountryCode(name: 'Barbados', flag: '🇧🇧', code: '+1 246'),
//     CountryCode(name: 'Belarus', flag: '🇧🇾', code: '+375'),
//     CountryCode(name: 'Belgium', flag: '🇧🇪', code: '+32'),
//     CountryCode(name: 'Belize', flag: '🇧🇿', code: '+501'),
//     CountryCode(name: 'Benin', flag: '🇧🇯', code: '+229'),
//     CountryCode(name: 'Bermuda', flag: '🇧🇲', code: '+1 441'),
//     CountryCode(name: 'Bhutan', flag: '🇧🇹', code: '+975'),
//     CountryCode(name: 'Bolivia', flag: '🇧🇴', code: '+591'),
//     CountryCode(name: 'Bosnia and Herzegovina', flag: '🇧🇦', code: '+387'),
//     CountryCode(name: 'Botswana', flag: '🇧🇼', code: '+267'),
//     CountryCode(name: 'Brazil', flag: '🇧🇷', code: '+55'),
//     CountryCode(
//       name: 'British Indian Ocean Territory',
//       flag: '🇮🇴',
//       code: '+246',
//     ),
//     CountryCode(name: 'British Virgin Islands', flag: '🇻🇬', code: '+1 284'),
//     CountryCode(name: 'Brunei', flag: '🇧🇳', code: '+673'),
//     CountryCode(name: 'Bulgaria', flag: '🇧🇬', code: '+359'),
//     CountryCode(name: 'Burkina Faso', flag: '🇧🇫', code: '+226'),
//     CountryCode(name: 'Burundi', flag: '🇧🇮', code: '+257'),
//     CountryCode(name: 'Cambodia', flag: '🇰🇭', code: '+855'),
//     CountryCode(name: 'Cameroon', flag: '🇨🇲', code: '+237'),
//     CountryCode(name: 'Canada', flag: '🇨🇦', code: '+1'),
//     CountryCode(name: 'Cape Verde', flag: '🇨🇻', code: '+238'),
//     CountryCode(name: 'Cayman Islands', flag: '🇰🇾', code: '+1 345'),
//     CountryCode(name: 'Central African Republic', flag: '🇨🇫', code: '+236'),
//     CountryCode(name: 'Chad', flag: '🇹🇩', code: '+235'),
//     CountryCode(name: 'Chile', flag: '🇨🇱', code: '+56'),
//     CountryCode(name: 'China', flag: '🇨🇳', code: '+86'),
//     CountryCode(name: 'Christmas Island', flag: '🇨🇽', code: '+61'),
//     CountryCode(name: 'Cocos Islands', flag: '🇨🇨', code: '+61'),
//     CountryCode(name: 'Colombia', flag: '🇨🇴', code: '+57'),
//     CountryCode(name: 'Comoros', flag: '🇰🇲', code: '+269'),
//     CountryCode(name: 'Cook Islands', flag: '🇨🇰', code: '+682'),
//     CountryCode(name: 'Costa Rica', flag: '🇨🇷', code: '+506'),
//     CountryCode(name: 'Croatia', flag: '🇭🇷', code: '+385'),
//     CountryCode(name: 'Cuba', flag: '🇨🇺', code: '+53'),
//     CountryCode(name: 'Curacao', flag: '🇨🇼', code: '+599'),
//     CountryCode(name: 'Cyprus', flag: '🇨🇾', code: '+357'),
//     CountryCode(name: 'Czech Republic', flag: '🇨🇿', code: '+420'),
//     CountryCode(
//       name: 'Democratic Republic of the Congo',
//       flag: '🇨🇩',
//       code: '+243',
//     ),
//     CountryCode(name: 'Denmark', flag: '🇩🇰', code: '+45'),
//     CountryCode(name: 'Djibouti', flag: '🇩🇯', code: '+253'),
//     CountryCode(name: 'Dominica', flag: '🇩🇲', code: '+1 767'),
//     CountryCode(name: 'Dominican Republic', flag: '🇩🇴', code: '+1 809'),
//     CountryCode(name: 'East Timor', flag: '🇹🇱', code: '+670'),
//     CountryCode(name: 'Ecuador', flag: '🇪🇨', code: '+593'),
//     CountryCode(name: 'Egypt', flag: '🇪🇬', code: '+20'),
//     CountryCode(name: 'El Salvador', flag: '🇸🇻', code: '+503'),
//     CountryCode(name: 'Equatorial Guinea', flag: '🇬🇶', code: '+240'),
//     CountryCode(name: 'Eritrea', flag: '🇪🇷', code: '+291'),
//     CountryCode(name: 'Estonia', flag: '🇪🇪', code: '+372'),
//     CountryCode(name: 'Ethiopia', flag: '🇪🇹', code: '+251'),
//     CountryCode(name: 'Falkland Islands', flag: '🇫🇰', code: '+500'),
//     CountryCode(name: 'Faroe Islands', flag: '🇫🇴', code: '+298'),
//     CountryCode(name: 'Fiji', flag: '🇫🇯', code: '+679'),
//     CountryCode(name: 'Finland', flag: '🇫🇮', code: '+358'),
//     CountryCode(name: 'France', flag: '🇫🇷', code: '+33'),
//     CountryCode(name: 'French Polynesia', flag: '🇵🇫', code: '+689'),
//     CountryCode(name: 'Gabon', flag: '🇬🇦', code: '+241'),
//     CountryCode(name: 'Gambia', flag: '🇬🇲', code: '+220'),
//     CountryCode(name: 'Georgia', flag: '🇬🇪', code: '+995'),
//     CountryCode(name: 'Germany', flag: '🇩🇪', code: '+49'),
//     CountryCode(name: 'Ghana', flag: '🇬🇭', code: '+233'),
//     CountryCode(name: 'Gibraltar', flag: '🇬🇮', code: '+350'),
//     CountryCode(name: 'Greece', flag: '🇬🇷', code: '+30'),
//     CountryCode(name: 'Greenland', flag: '🇬🇱', code: '+299'),
//     CountryCode(name: 'Grenada', flag: '🇬🇩', code: '+1 473'),
//     CountryCode(name: 'Guam', flag: '🇬🇺', code: '+1 671'),
//     CountryCode(name: 'Guatemala', flag: '🇬🇹', code: '+502'),
//     CountryCode(name: 'Guernsey', flag: '🇬🇬', code: '+44'),
//     CountryCode(name: 'Guinea', flag: '🇬🇳', code: '+224'),
//     CountryCode(name: 'Guinea-Bissau', flag: '🇬🇼', code: '+245'),
//     CountryCode(name: 'Guyana', flag: '🇬🇾', code: '+592'),
//     CountryCode(name: 'Haiti', flag: '🇭🇹', code: '+509'),
//     CountryCode(name: 'Honduras', flag: '🇭🇳', code: '+504'),
//     CountryCode(name: 'Hong Kong', flag: '🇭🇰', code: '+852'),
//     CountryCode(name: 'Hungary', flag: '🇭🇺', code: '+36'),
//     CountryCode(name: 'Iceland', flag: '🇮🇸', code: '+354'),
//     CountryCode(name: 'India', flag: '🇮🇳', code: '+91'),
//     CountryCode(name: 'Indonesia', flag: '🇮🇩', code: '+62'),
//     CountryCode(name: 'Iran', flag: '🇮🇷', code: '+98'),
//     CountryCode(name: 'Iraq', flag: '🇮🇶', code: '+964'),
//     CountryCode(name: 'Ireland', flag: '🇮🇪', code: '+353'),
//     CountryCode(name: 'Isle of Man', flag: '🇮🇲', code: '+44'),
//     CountryCode(name: 'Israel', flag: '🇮🇱', code: '+972'),
//     CountryCode(name: 'Italy', flag: '🇮🇹', code: '+39'),
//     CountryCode(name: 'Ivory Coast', flag: '🇨🇮', code: '+225'),
//     CountryCode(name: 'Jamaica', flag: '🇯🇲', code: '+1 876'),
//     CountryCode(name: 'Japan', flag: '🇯🇵', code: '+81'),
//     CountryCode(name: 'Jersey', flag: '🇯🇪', code: '+44'),
//     CountryCode(name: 'Jordan', flag: '🇯🇴', code: '+962'),
//     CountryCode(name: 'Kazakhstan', flag: '🇰🇿', code: '+7'),
//     CountryCode(name: 'Kenya', flag: '🇰🇪', code: '+254'),
//     CountryCode(name: 'Kiribati', flag: '🇰🇮', code: '+686'),
//     CountryCode(name: 'Kosovo', flag: '🇽🇰', code: '+383'),
//     CountryCode(name: 'Kuwait', flag: '🇰🇼', code: '+965'),
//     CountryCode(name: 'Kyrgyzstan', flag: '🇰🇬', code: '+996'),
//     CountryCode(name: 'Laos', flag: '🇱🇦', code: '+856'),
//     CountryCode(name: 'Latvia', flag: '🇱🇻', code: '+371'),
//     CountryCode(name: 'Lebanon', flag: '🇱🇧', code: '+961'),
//     CountryCode(name: 'Lesotho', flag: '🇱🇸', code: '+266'),
//     CountryCode(name: 'Liberia', flag: '🇱🇷', code: '+231'),
//     CountryCode(name: 'Libya', flag: '🇱🇾', code: '+218'),
//     CountryCode(name: 'Liechtenstein', flag: '🇱🇮', code: '+423'),
//     CountryCode(name: 'Lithuania', flag: '🇱🇹', code: '+370'),
//     CountryCode(name: 'Luxembourg', flag: '🇱🇺', code: '+352'),
//     CountryCode(name: 'Macao', flag: '🇲🇴', code: '+853'),
//     CountryCode(name: 'Macedonia', flag: '🇲🇰', code: '+389'),
//     CountryCode(name: 'Madagascar', flag: '🇲🇬', code: '+261'),
//     CountryCode(name: 'Malawi', flag: '🇲🇼', code: '+265'),
//     CountryCode(name: 'Malaysia', flag: '🇲🇾', code: '+60'),
//     CountryCode(name: 'Maldives', flag: '🇲🇻', code: '+960'),
//     CountryCode(name: 'Mali', flag: '🇲🇱', code: '+223'),
//     CountryCode(name: 'Malta', flag: '🇲🇹', code: '+356'),
//     CountryCode(name: 'Marshall Islands', flag: '🇲🇭', code: '+692'),
//     CountryCode(name: 'Mauritania', flag: '🇲🇷', code: '+222'),
//     CountryCode(name: 'Mauritius', flag: '🇲🇺', code: '+230'),
//     CountryCode(name: 'Mayotte', flag: '🇾🇹', code: '+262'),
//     CountryCode(name: 'Micronesia', flag: '🇫🇲', code: '+691'),
//     CountryCode(name: 'Moldova', flag: '🇲🇩', code: '+373'),
//     CountryCode(name: 'Monaco', flag: '🇲🇨', code: '+377'),
//     CountryCode(name: 'Mongolia', flag: '🇲🇳', code: '+976'),
//     CountryCode(name: 'Montenegro', flag: '🇲🇪', code: '+382'),
//     CountryCode(name: 'Montserrat', flag: '🇲🇸', code: '+1 664'),
//     CountryCode(name: 'Morocco', flag: '🇲🇦', code: '+212'),
//     CountryCode(name: 'Mozambique', flag: '🇲🇿', code: '+258'),
//     CountryCode(name: 'Myanmar', flag: '🇲🇲', code: '+95'),
//     CountryCode(name: 'Namibia', flag: '🇳🇦', code: '+264'),
//     CountryCode(name: 'Nauru', flag: '🇳🇷', code: '+674'),
//     CountryCode(name: 'Nepal', flag: '🇳🇵', code: '+977'),
//     CountryCode(name: 'Netherlands', flag: '🇳🇱', code: '+31'),
//     CountryCode(name: 'New Caledonia', flag: '🇳🇨', code: '+687'),
//     CountryCode(name: 'New Zealand', flag: '🇳🇿', code: '+64'),
//     CountryCode(name: 'Nicaragua', flag: '🇳🇮', code: '+505'),
//     CountryCode(name: 'Niger', flag: '🇳🇪', code: '+227'),
//     CountryCode(name: 'Nigeria', flag: '🇳🇬', code: '+234'),
//     CountryCode(name: 'Niue', flag: '🇳🇺', code: '+683'),
//     CountryCode(name: 'Norfolk Island', flag: '🇳🇫', code: '+672'),
//     CountryCode(name: 'North Korea', flag: '🇰🇵', code: '+850'),
//     CountryCode(name: 'Northern Mariana Islands', flag: '🇲🇵', code: '+1 670'),
//     CountryCode(name: 'Norway', flag: '🇳🇴', code: '+47'),
//     CountryCode(name: 'Oman', flag: '🇴🇲', code: '+968'),
//     CountryCode(name: 'Pakistan', flag: '🇵🇰', code: '+92'),
//     CountryCode(name: 'Palau', flag: '🇵🇼', code: '+680'),
//     CountryCode(name: 'Palestine', flag: '🇵🇸', code: '+970'),
//     CountryCode(name: 'Panama', flag: '🇵🇦', code: '+507'),
//     CountryCode(name: 'Papua New Guinea', flag: '🇵🇬', code: '+675'),
//     CountryCode(name: 'Paraguay', flag: '🇵🇾', code: '+595'),
//     CountryCode(name: 'Peru', flag: '🇵🇪', code: '+51'),
//     CountryCode(name: 'Philippines', flag: '🇵🇭', code: '+63'),
//     CountryCode(name: 'Pitcairn', flag: '🇵🇳', code: '+64'),
//     CountryCode(name: 'Poland', flag: '🇵🇱', code: '+48'),
//     CountryCode(name: 'Portugal', flag: '🇵🇹', code: '+351'),
//     CountryCode(name: 'Puerto Rico', flag: '🇵🇷', code: '+1 787'),
//     CountryCode(name: 'Qatar', flag: '🇶🇦', code: '+974'),
//     CountryCode(name: 'Republic of the Congo', flag: '🇨🇬', code: '+242'),
//     CountryCode(name: 'Reunion', flag: '🇷🇪', code: '+262'),
//     CountryCode(name: 'Romania', flag: '🇷🇴', code: '+40'),
//     CountryCode(name: 'Russia', flag: '🇷🇺', code: '+7'),
//     CountryCode(name: 'Rwanda', flag: '🇷🇼', code: '+250'),
//     CountryCode(name: 'Saint Barthelemy', flag: '🇧🇱', code: '+590'),
//     CountryCode(name: 'Saint Helena', flag: '🇸🇭', code: '+290'),
//     CountryCode(name: 'Saint Kitts and Nevis', flag: '🇰🇳', code: '+1 869'),
//     CountryCode(name: 'Saint Lucia', flag: '🇱🇨', code: '+1 758'),
//     CountryCode(name: 'Saint Martin', flag: '🇲🇫', code: '+590'),
//     CountryCode(name: 'Saint Pierre and Miquelon', flag: '🇵🇲', code: '+508'),
//     CountryCode(
//       name: 'Saint Vincent and the Grenadines',
//       flag: '🇻🇨',
//       code: '+1 784',
//     ),
//     CountryCode(name: 'Samoa', flag: '🇼🇸', code: '+685'),
//     CountryCode(name: 'San Marino', flag: '🇸🇲', code: '+378'),
//     CountryCode(name: 'Sao Tome and Principe', flag: '🇸🇹', code: '+239'),
//     CountryCode(name: 'Saudi Arabia', flag: '🇸🇦', code: '+966'),
//     CountryCode(name: 'Senegal', flag: '🇸🇳', code: '+221'),
//     CountryCode(name: 'Serbia', flag: '🇷🇸', code: '+381'),
//     CountryCode(name: 'Seychelles', flag: '🇸🇨', code: '+248'),
//     CountryCode(name: 'Sierra Leone', flag: '🇸🇱', code: '+232'),
//     CountryCode(name: 'Singapore', flag: '🇸🇬', code: '+65'),
//     CountryCode(name: 'Sint Maarten', flag: '🇸🇽', code: '+1 721'),
//     CountryCode(name: 'Slovakia', flag: '🇸🇰', code: '+421'),
//     CountryCode(name: 'Slovenia', flag: '🇸🇮', code: '+386'),
//     CountryCode(name: 'Solomon Islands', flag: '🇸🇧', code: '+677'),
//     CountryCode(name: 'Somalia', flag: '🇸🇴', code: '+252'),
//     CountryCode(name: 'South Africa', flag: '🇿🇦', code: '+27'),
//     CountryCode(name: 'South Korea', flag: '🇰🇷', code: '+82'),
//     CountryCode(name: 'South Sudan', flag: '🇸🇸', code: '+211'),
//     CountryCode(name: 'Spain', flag: '🇪🇸', code: '+34'),
//     CountryCode(name: 'Sri Lanka', flag: '🇱🇰', code: '+94'),
//     CountryCode(name: 'Sudan', flag: '🇸🇩', code: '+249'),
//     CountryCode(name: 'Suriname', flag: '🇸🇷', code: '+597'),
//     CountryCode(name: 'Swaziland', flag: '🇸🇿', code: '+268'),
//     CountryCode(name: 'Sweden', flag: '🇸🇪', code: '+46'),
//     CountryCode(name: 'Switzerland', flag: '🇨🇭', code: '+41'),
//     CountryCode(name: 'Syria', flag: '🇸🇾', code: '+963'),
//     CountryCode(name: 'Taiwan', flag: '🇹🇼', code: '+886'),
//     CountryCode(name: 'Tajikistan', flag: '🇹🇯', code: '+992'),
//     CountryCode(name: 'Tanzania', flag: '🇹🇿', code: '+255'),
//     CountryCode(name: 'Thailand', flag: '🇹🇭', code: '+66'),
//     CountryCode(name: 'Togo', flag: '🇹🇬', code: '+228'),
//     CountryCode(name: 'Tokelau', flag: '🇹🇰', code: '+690'),
//     CountryCode(name: 'Tonga', flag: '🇹🇴', code: '+676'),
//     CountryCode(name: 'Trinidad and Tobago', flag: '🇹🇹', code: '+1 868'),
//     CountryCode(name: 'Tunisia', flag: '🇹🇳', code: '+216'),
//     CountryCode(name: 'Turkey', flag: '🇹🇷', code: '+90'),
//     CountryCode(name: 'Turkmenistan', flag: '🇹🇲', code: '+993'),
//     CountryCode(name: 'Turks and Caicos Islands', flag: '🇹🇨', code: '+1 649'),
//     CountryCode(name: 'Tuvalu', flag: '🇹🇻', code: '+688'),
//     CountryCode(name: 'U.S. Virgin Islands', flag: '🇻🇮', code: '+1 340'),
//     CountryCode(name: 'Uganda', flag: '🇺🇬', code: '+256'),
//     CountryCode(name: 'Ukraine', flag: '🇺🇦', code: '+380'),
//     CountryCode(name: 'United Arab Emirates', flag: '🇦🇪', code: '+971'),
//     CountryCode(name: 'United Kingdom', flag: '🇬🇧', code: '+44'),
//     CountryCode(name: 'United States', flag: '🇺🇸', code: '+1'),
//     CountryCode(name: 'Uruguay', flag: '🇺🇾', code: '+598'),
//     CountryCode(name: 'Uzbekistan', flag: '🇺🇿', code: '+998'),
//     CountryCode(name: 'Vanuatu', flag: '🇻🇺', code: '+678'),
//     CountryCode(name: 'Vatican', flag: '🇻🇦', code: '+379'),
//     CountryCode(name: 'Venezuela', flag: '🇻🇪', code: '+58'),
//     CountryCode(name: 'Vietnam', flag: '🇻🇳', code: '+84'),
//     CountryCode(name: 'Wallis and Futuna', flag: '🇼🇫', code: '+681'),
//     CountryCode(name: 'Western Sahara', flag: '🇪🇭', code: '+212'),
//     CountryCode(name: 'Yemen', flag: '🇾🇪', code: '+967'),
//     CountryCode(name: 'Zambia', flag: '🇿🇲', code: '+260'),
//     CountryCode(name: 'Zimbabwe', flag: '🇿🇼', code: '+263'),
//   ];
// }
