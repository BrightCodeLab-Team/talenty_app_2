// // ignore_for_file: use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:provider/provider.dart';
// import 'package:talenty_app/core/constants/colors.dart';
// import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
// import 'package:talenty_app/ui/custom_widgets/custom_text_field.dart';
// import 'package:talenty_app/ui/screens/theme/lang_theme_provider.dart';

// class LangThemeSwitcher extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final langThemeProvider = Provider.of<LanThemeProvider>(context);
//     final theme = Theme.of(context);
//     final textTheme = theme.textTheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("switcher_title".tr),
//         actions: [
//           IconButton(
//             icon: Icon(
//               langThemeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
//             ),
//             onPressed: () => langThemeProvider.toggleTheme(),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: theme.cardColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!.sample_container,
//                     style: textTheme.titleLarge,
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     AppLocalizations.of(context)!.adapts_to_theme,
//                     style: textTheme.bodyMedium,
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.info_outline),
//                       const SizedBox(width: 8),
//                       Text(
//                         AppLocalizations.of(context)!.info_text,
//                         style: textTheme.bodyMedium,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             KlButton(
//               style: KlButtonStyle.login,
//               textColor: blackColor,
//               buttonColor: greenColor,
//             ),
//             KlButton(
//               style: KlButtonStyle.fullButton,
//               textColor: blackColor,
//               buttonColor: greenColor,
//             ),
//             KlButton(
//               style: KlButtonStyle.continueBtn,
//               textColor: blackColor,
//               buttonColor: greenColor,
//             ),
//             KlTextInputField(
//               style: KlTextInputFieldStyle.email,
//               hintText: 'Email',
//             ),

//             KlTextInputField(
//               style: KlTextInputFieldStyle.phoneNumber,
//               hintText: 'phone',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
