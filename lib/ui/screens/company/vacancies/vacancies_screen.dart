// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_socail_button.dart';
import 'package:talenty_app/ui/screens/company/vacancies/vacancies_view_model.dart';

class VacanciesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VacanciesViewModel(),
      child: Consumer<VacanciesViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              /// Start Body
              ///
              body: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset(AppAssets.appLogo2, scale: 6)),
                    30.verticalSpace,
                    Text(
                    "Vacancies Posted by Your Recruiters".tr,
                      style: style24M,
                    ),
                    16.verticalSpace,
                    Text(
                    "Vacancies Posted by Your Recruiters".tr,
                      style: style16M,
                    ),
                    10.verticalSpace,

                    ///
                    /// List Data
                    ///
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.vacancies.length,
                        itemBuilder: (context, index) {
                          final vacancy = model.vacancies[index];
                          return _vacanciesCard(vacancy);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

///
/// Vacancies Card
///

Widget _vacanciesCard(VacancyModel vacancy) {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: blackColor.withOpacity(0.10),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///
        /// Top Row
        ///
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(vacancy.imageUrl ?? AppAssets.img2),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                5.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vacancy.title ?? "",
                      style: style16B.copyWith(color: lightBlackColor),
                    ),
                    Text(
                      vacancy.role ?? "",
                      style: style14M.copyWith(
                        fontWeight: FontWeight.w400,
                        color: textGreyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color:
                    vacancy.status == "Vacante Activa"
                        ? lightgreenColor1
                        : inActiveColor,

                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                vacancy.status ?? "Vacante Activa",
                style: style12M.copyWith(
                  color:
                      vacancy.status == "Vacante Activa"
                          ? darkgreenColor
                          : yelloBrownColor1,
                ),
              ),
            ),
          ],
        ),
        10.verticalSpace,

        ///
        /// Description
        ///
        Text(
          vacancy.description ?? "",
          style: style14M,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        10.verticalSpace,

        ///
        /// Date
        ///
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppAssets.calendar, scale: 4),
            Text(  'home'.tr, style: style14M),
            Text(  "start_date".tr, style: style14M),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppAssets.calendar, scale: 4),
            Text('  Vigencia: ', style: style14M),
            Text(  "start_date".tr, style: style14M),
          ],
        ),
        10.verticalSpace,
        Divider(color: dividerColor, thickness: 1),
        10.verticalSpace,

        ///
        /// Matches, price and location
        ///
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.match, scale: 4),
                1.horizontalSpace,
                Text('20_Matches'.tr, style: style14M),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.payments, scale: 4),
                1.horizontalSpace,
                Text('salary'.tr, style: style14M),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.location, scale: 4),
                1.horizontalSpace,
                Text('Remote'.tr, style: style14M),
              ],
            ),
          ],
        ),
        20.verticalSpace,

        ///
        /// Social  Button
        ///
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: CustomSocialButton(
            // width: 163,
            height: 40,
            text: "Transfer Vacancy".tr,
            icon: Image.asset(AppAssets.payments, scale: 4),
            backgroundColor: whiteColor,
            textColor: lightBlackColor,
            borderColor: lightBlackColor,
            onTap: () {},
          ),
        ),
      ],
    ),
  );
}
