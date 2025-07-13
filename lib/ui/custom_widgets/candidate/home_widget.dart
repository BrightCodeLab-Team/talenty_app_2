import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';

///
///. custom widget used in candidate home screen showing jobs
///
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Color(0xFF28407B),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  // If the image is large, you might want to constrain its height or wrap it in Flexible
                  Image.asset(
                    vacancyModel.imageUrl ?? AppAssets.menulogo,
                    height: 186, // Example fixed height, adjust as needed
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vacancyModel.jobTitle ?? 'Job Title Null',
                    style: style14M.copyWith(
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines:
                        1, // Prevent text from taking too much vertical space
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    vacancyModel.jobSubTitle ?? 'Job SubTitle Null',
                    style: style14M.copyWith(color: lightBlackColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.payments,
                        scale: 4,
                        color: blackColor,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        // Use Flexible to prevent text overflow in row
                        child: Text(
                          "\$${vacancyModel.minSalary ?? 'nul'}-\$${vacancyModel.maxSalary ?? 'nul'}",
                          style: style14M.copyWith(color: lightBlackColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.location,
                        scale: 4,
                        color: blackColor,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        // Use Flexible to prevent text overflow in row
                        child: Text(
                          vacancyModel.location ?? 'Location Null',
                          style: style14M.copyWith(color: lightBlackColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(AppAssets.globeIcon, scale: 4),
                      SizedBox(width: 8),
                      Flexible(
                        // Use Flexible to prevent text overflow in row
                        child: Text(
                          vacancyModel.state ?? 'State Null',
                          style: style14M.copyWith(color: lightBlackColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
