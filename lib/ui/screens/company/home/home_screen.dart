// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/custom_your_vacancies.dart';
import 'package:talenty_app/ui/screens/company/create_vacancy/create_vacancy_screen.dart';

import 'package:talenty_app/ui/screens/company/home/home_view_model.dart';
import 'package:talenty_app/ui/screens/company/notifications/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              /// Start Body
              ///
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 40,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// Header
                      ///
                      _header(),

                      20.verticalSpace,

                      Text("Mis Vacantes", style: style24M),
                      10.verticalSpace,
                      Text(
                        "En esta sección podrás ver todas las vacantes que has creado tú mismo. ",
                        style: style14M,
                      ),
                      20.verticalSpace,

                      Text("Tus Categorías", style: style14M),
                      10.verticalSpace,

                      ///
                      /// Categories
                      ///
                      model.vacancies.isNotEmpty && model.vacancies != null
                          ? _categories(model: model)
                          : SizedBox(),

                      10.verticalSpace,
                      Text("Tus Vacantes", style: style14M),
                      model.vacancies.isNotEmpty && model.vacancies != null
                          ? GestureDetector(
                            onTap: () {
                              Get.to(() => CreateVacancyScreen());
                            },
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                width: 211,
                                height: 54,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.0,
                                    color: lightBlackColor,
                                  ),
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [
                                    Image.asset(
                                      AppAssets.userAddIcon,
                                      height: 24,
                                      width: 24,
                                    ),
                                    5.horizontalSpace,
                                    Text("Crear vacante", style: style16M),
                                  ],
                                ),
                              ),
                            ),
                          )
                          : Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Text(
                                "Todo empieza con un match.",
                                style: style24M.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                      ///
                      /// Vacancies
                      ///
                      model.vacancies.isNotEmpty && model.vacancies != null
                          ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.vacancies.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CustomYourVacancies(
                                vacancyModel: model.vacancies[index],
                              );
                            },
                          )
                          : Column(
                            children: [
                              Image.asset(AppAssets.vacancyEmpty),
                              30.verticalSpace,
                              Text(
                                "Publique su vacante en TALENTY y multiplique sus oportunidades de encontrar al candidato ideal.",
                                style: style16M,
                              ),
                              30.verticalSpace,
                              Center(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  width: 211,
                                  height: 54,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2.0,
                                      color: primaryColor,
                                    ),
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,

                                    children: [
                                      Image.asset(
                                        AppAssets.userAddIcon,
                                        height: 24,
                                        width: 24,
                                        color: whiteColor,
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        "Crear Vacante",
                                        style: style16M.copyWith(
                                          color: whiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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

_header() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(AppAssets.appLogo2, scale: 6),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.userAddIcon, height: 24, width: 24),
          Image.asset(AppAssets.searchIcon, height: 46, width: 46),
          GestureDetector(
            onTap: () {
              Get.to(() => NotificationScreen());
            },
            child: Image.asset(AppAssets.notifIcon, height: 24, width: 24),
          ),
        ],
      ),
    ],
  );
}

_categories({required HomeViewModel model}) {
  List<String> categries = [
    "Todos",
    "Arte y Diseño",
    "Programación y Tecnología",
  ];
  return SizedBox(
    height: 38,

    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: categries.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            model.onClickCategory(index);
          },
          child: Container(
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            height: 34,
            decoration: BoxDecoration(
              color: model.categorySelect == index ? brownColor : transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.0, color: brownColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  categries[index],
                  style: style12M.copyWith(
                    color:
                        model.categorySelect == index
                            ? whiteColor
                            : lightBlackColor,
                  ),
                ),
                model.categorySelect == index ? 5.horizontalSpace : SizedBox(),
                model.categorySelect == index
                    ? Icon(Icons.close, color: whiteColor, size: 20)
                    : SizedBox(),
              ],
            ),
          ),
        );
      },
    ),
  );
}
