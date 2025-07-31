// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';

///
///. custom widget used in candidate home screen showing jobs
// ///
// class CustomCandidateHomeVacancyWidget extends StatelessWidget {
//   final JobVacancyModel vacancyModel;
//   final VoidCallback? onTap;
//   const CustomCandidateHomeVacancyWidget({
//     super.key,
//     required this.vacancyModel,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16.0),
//           boxShadow: [
//             BoxShadow(
//               color: blackColor.withOpacity(0.50),
//               spreadRadius: 0,
//               blurRadius: 4,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               height: 186,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("${vacancyModel.imageUrl}"),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     vacancyModel.jobTitle ?? 'Job Title Null',
//                     style: style14M.copyWith(
//                       color: blackColor,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     maxLines:
//                         2, // Prevent text from taking too much vertical space
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     vacancyModel.jobSubTitle ?? 'Job SubTitle Null',
//                     style: style14M.copyWith(color: lightBlackColor),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         AppAssets.payments,
//                         height: 20,
//                         width: 20,
//                         color: blackColor,
//                       ),
//                       SizedBox(width: 8),
//                       Flexible(
//                         // Use Flexible to prevent text overflow in row
//                         child: Text(
//                           "\$${vacancyModel.minSalary ?? 'nul'}-\$${vacancyModel.maxSalary ?? 'nul'}",
//                           style: style14M.copyWith(color: lightBlackColor),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         AppAssets.location,
//                         height: 20,
//                         width: 20,
//                         color: blackColor,
//                       ),
//                       SizedBox(width: 8),
//                       Flexible(
//                         // Use Flexible to prevent text overflow in row
//                         child: Text(
//                           vacancyModel.location ?? 'Location Null',
//                           style: style14M.copyWith(color: lightBlackColor),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(AppAssets.globeIcon, height: 18, width: 18),
//                       SizedBox(width: 8),
//                       Flexible(
//                         // Use Flexible to prevent text overflow in row
//                         child: Text(
//                           vacancyModel.state ?? 'State Null',
//                           style: style14M.copyWith(color: lightBlackColor),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustomCandidateHomeVacancyWidget extends StatelessWidget {
  final JobVacancyModel vacancyModel;
  final VoidCallback? onTap;
  const CustomCandidateHomeVacancyWidget({
    super.key,
    required this.vacancyModel,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minHeight: 350, // Set minimum height to prevent overflow
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.50),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 186,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${vacancyModel.imageUrl}"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 40, // Limit title height
                    ),
                    child: Text(
                      vacancyModel.jobTitle ?? 'Job Title Null',
                      style: style14M.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 20, // Limit subtitle height
                    ),
                    child: Text(
                      vacancyModel.jobSubTitle ?? 'Job SubTitle Null',
                      style: style14M.copyWith(color: lightBlackColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildInfoRow(
                    AppAssets.payments,
                    "\$${vacancyModel.minSalary ?? 'nul'}-\$${vacancyModel.maxSalary ?? 'nul'}",
                  ),
                  SizedBox(height: 8),
                  _buildInfoRow(
                    AppAssets.location,
                    vacancyModel.location ?? 'Location Null',
                  ),
                  SizedBox(height: 8),
                  _buildInfoRow(
                    AppAssets.globeIcon,
                    vacancyModel.state ?? 'State Null',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon, height: 20, width: 20, color: blackColor),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: style14M.copyWith(color: lightBlackColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
