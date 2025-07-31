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

              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  // If the image is large, you might want to constrain its height or wrap it in Flexible
                  Image.asset(
                    vacancyModel.imageUrl ?? AppAssets.cImg1,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vacancyModel.jobTitle ?? 'Job Title Null',
                    style: style14M.copyWith(
                      color: darkPurpleColor,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines:
                        2, // Prevent text from taking too much vertical space
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppAssets.payments2,
                        scale: 4,
                        color: darkPurpleColor,
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
                        AppAssets.location2,
                        scale: 4,
                        color: darkPurpleColor,
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
