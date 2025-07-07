// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';

class CustomYourVacancies extends StatelessWidget {
  final VacancyModel vacancyModel;
  const CustomYourVacancies({required this.vacancyModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.2),
        border: Border.all(width: 1.0, color: lightBlackColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          /// Profile Details
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(
                          vacancyModel.imageUrl ?? AppAssets.img,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  5.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vacancyModel.title ?? " ",
                        style: style14M.copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        vacancyModel.description ?? "",
                        style: style16B.copyWith(color: lightBlackColor),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color:
                      vacancyModel.status == "Vacante Activa"
                          ? lightgreenColor1
                          : lightgreyColor,

                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  vacancyModel.status ?? "Vacante Activa",
                  style: style12M.copyWith(
                    color:
                        vacancyModel.status == "Vacante Activa"
                            ? darkgreenColor
                            : greyColor,
                  ),
                ),
              ),
            ],
          ),
          20.verticalSpace,

          ///
          /// Time
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.calendar, scale: 4),
              Text('  Inicio: ', style: style14M),
              Text(
                vacancyModel.startDate ?? "",
                style: style16B.copyWith(
                  color: lightBlackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.calendar, scale: 4),
              Text('  Vigencia: ', style: style14M),
              Text(
                vacancyModel.endDate ?? "",
                style: style16B.copyWith(
                  color: lightBlackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: secondaryColor,
            ),

            child: Text("${vacancyModel.matches} Match obtenidos"),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2.0, color: lightgreyColor),
            ),
            height: 60,
            child: Row(
              children: [
                _buildIconTile(Icons.more_vert),
                _buildVerticalDivider(),
                _buildIconTile(Icons.visibility),
                _buildVerticalDivider(),
                _buildIconTile(Icons.edit),
              ],
            ),
          ),

          CustomButton(
            backgroundColor: primaryColor,
            text: "Explorar candidatos",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _buildIconTile(IconData icon) {
  return Expanded(
    child: Center(child: Icon(icon, color: lightgreyColor, size: 24)),
  );
}

Widget _buildVerticalDivider() {
  return Container(width: 1, height: 40, color: lightgreyColor);
}
