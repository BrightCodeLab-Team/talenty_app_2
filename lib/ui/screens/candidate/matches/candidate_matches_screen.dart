import 'dart:math';

import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/comapny_profile_screen.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_job_detail/company_job_detail_screen.dart';
import 'package:talenty_app/ui/screens/candidate/home/candidate_home_view_model.dart';

class CandidateMatchesScreen extends StatelessWidget {
  const CandidateMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateHomeViewModel(),
      child: Consumer<CandidateHomeViewModel>(
        builder:
            (context, model, child) => DefaultTabController(
              length: 2, // People & Groups
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  centerTitle: true,
                  title: Image.asset(AppAssets.appLogo2, scale: 6),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        isScrollable: false,
                        labelColor: primaryColor,
                        unselectedLabelColor: Colors.black54,
                        indicatorColor: primaryColor,
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        tabs: const [
                          Tab(text: 'Mis Match'),
                          Tab(text: 'Lis intereas'),
                        ],
                      ),
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    15.verticalSpace,
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TabBarView(
                          children: [
                            model.vacancies.isEmpty
                                ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AppAssets.appLogo2,
                                          scale: 6,
                                        ),
                                        5.verticalSpace,
                                        Text(
                                          textAlign: TextAlign.center,
                                          '¡Estás al día! No hay más vacantes interesadas por ahora, pero sigue explorando para descubrir nuevas oportunidades. ¡Tu próximo match está a solo un swipe de distancia!.',
                                          style: style14M.copyWith(
                                            color: textGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                : firstTabBarView(model),
                            model.vacancies.isEmpty
                                ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AppAssets.appLogo2,
                                          scale: 6,
                                        ),
                                        5.verticalSpace,
                                        Text(
                                          textAlign: TextAlign.center,
                                          '¡Estás al día! No hay más vacantes interesadas por ahora, pero sigue explorando para descubrir nuevas oportunidades. ¡Tu próximo match está a solo un swipe de distancia!.',
                                          style: style14M.copyWith(
                                            color: textGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                : secondTabBarView(model),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///. first tab bar view
  ///
  Widget firstTabBarView(CandidateHomeViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Mis matches', style: style24M.copyWith(color: blackColor)),
            Spacer(),
            Image.asset(AppAssets.badgeIcon, scale: 4),
          ],
        ),
        5.verticalSpace,
        Text(
          '¡Felicidades! Tienes matches con reclutadores. Explora las vacantes, muestra tu interés y da el siguiente paso hacia tu próxima oportunidad.',
          style: style14M.copyWith(color: textGreyColor),
        ),
        10.verticalSpace,
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: model.vacancies.length,
            itemBuilder: (context, index) {
              return CustomJobVacancyCard(
                onTap: () {
                  Get.to(
                    CompanyJobDetailScreen(
                      jobVacancyModel: model.vacancies[index],
                      index: index,
                      fromFirstTab: true,
                    ),
                  );
                },
                jobVacancyModel: model.vacancies[index],
              );
            },
          ),
        ),
      ],
    );
  }

  ///
  ///. second tab bar view
  ///
  Widget secondTabBarView(CandidateHomeViewModel model) {
    String _truncateWithEllipsis(int cutoff, String text) {
      return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}...';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Les matches', style: style24M.copyWith(color: blackColor)),
            Spacer(),
            Image.asset(AppAssets.badgeIcon, scale: 4),
          ],
        ),
        5.verticalSpace,
        Text(
          'En esta sección, encontrarás las vacantes de empresas que han mostrado interés en tu perfil. ¡El match está a solo un . swipe de distancia!',
          style: style14M.copyWith(color: textGreyColor),
        ),
        10.verticalSpace,
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: model.vacancies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _showCustomJobDetailDialog(context, model, index);
                },
                child: Container(
                  //  height: MediaQuery.of(buildContext).size.height * 0.9,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ), // Add horizontal margin for spacing
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 180, // Adjust height to match the image
                              decoration: BoxDecoration(
                                color: Color(
                                  0xFF28407B,
                                ), // Dark blue background
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    model.vacancies[index].imageUrl ?? '',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'VIAJES',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ' | ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'PREMIUM®',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // MOVED PART STARTS HERE

                        // MOVED PART ENDS HERE
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.verticalSpace,

                              //
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _truncateWithEllipsis(
                                      15,
                                      model.vacancies[index].jobTitle ?? '',
                                    ),
                                    style:
                                        style20B
                                            .copyWith(), // Remove the double-dot `..`
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),

                                  Spacer(),
                                  Container(
                                    color: darkgreenColor.withOpacity(0.1),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 2,
                                      ),
                                      child: Text(
                                        'Gran oportunidad',
                                        style: style12M.copyWith(
                                          color: darkgreenColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              4.verticalSpace,
                              Text(
                                "\$${model.vacancies[index].minSalary ?? 'set min salary'}-\$${model.vacancies[index].maxSalary ?? 'set max salary'} por mes",
                                style: style14M,
                              ),
                              4.verticalSpace,
                              Row(
                                children: [
                                  Image.asset(AppAssets.location, scale: 4),
                                  Text(
                                    "${model.vacancies[index].location ?? 'set location'} •${model.vacancies[index].state ?? 'set state'}",
                                    style: style14M.copyWith(
                                      color: textGreyColor,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'vijes premium',
                                    style: style14M.copyWith(
                                      color: textGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                              4.verticalSpace,
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.experienceIcon,
                                    scale: 4,
                                  ),
                                  2.horizontalSpace,
                                  Text(
                                    "Experiencia: ${model.vacancies[index].requiresExperience ?? 'set experiencia'}",
                                    style: style14M.copyWith(
                                      color: textGreyColor,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Presencial',
                                    style: style14M.copyWith(
                                      color: textGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                              5.verticalSpace,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );

              //  CustomJobVacancyCard(
              //   onTap: () {
              //     Get.to(
              //       CompanyJobDetailScreen(
              //         jobVacancyModel: model.vacancies[index],
              //         index: index,
              //       ),
              //     );
              //   },
              //   jobVacancyModel: model.vacancies[index],
              // );
            },
          ),
        ),
      ],
    );
  }

  ///
  ///. detail dialog box fir tabbar view 2
  ///
  void _showCustomJobDetailDialog(
    BuildContext context,
    CandidateHomeViewModel model,
    int index,
  ) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54, // Darkens the background
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (
        BuildContext buildContext,
        Animation animation,
        Animation secondaryAnimation,
      ) {
        return Center(
          child: Material(
            type: MaterialType.transparency, // Make Material transparent
            child: Container(
              height: MediaQuery.of(buildContext).size.height * 0.9,
              width:
                  MediaQuery.of(buildContext).size.width *
                  0.98, // Adjust width as needed
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ), // Add horizontal margin for spacing
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 180, // Adjust height to match the image
                          decoration: BoxDecoration(
                            color: Color(0xFF28407B), // Dark blue background
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                model.vacancies[index].imageUrl ?? '',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'VIAJES',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    ' | ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'PREMIUM®',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(buildContext).pop();
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // MOVED PART STARTS HERE

                    // MOVED PART ENDS HERE
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.verticalSpace,
                          GestureDetector(
                            onTap: () {
                              Get.to(CompanyProfileScreen());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: blackColor.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        model.vacancies[index].imageUrl ?? '',
                                        height: 30,
                                        width: 30,
                                      ),
                                      SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Viajes Premium',
                                            style: style14M.copyWith(),
                                          ),
                                          Text(
                                            'Ver Perfil →',
                                            style: style12M.copyWith(
                                              color: textGreyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                AnimateIcon(
                                  key: UniqueKey(),
                                  onTap: () {},
                                  iconType: IconType.continueAnimation,
                                  height: 70,
                                  width: 70,
                                  color: Color.fromRGBO(
                                    Random.secure().nextInt(255),
                                    Random.secure().nextInt(255),
                                    Random.secure().nextInt(255),
                                    1,
                                  ),
                                  animateIcon: AnimateIcons.add,
                                ),
                                Text(''),
                              ],
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            '${model.vacancies[index].jobTitle}',
                            style: style24B..copyWith(),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${model.vacancies[index].location ?? 'set location'} •${model.vacancies[index].state ?? 'set state'}",
                            style: style14M.copyWith(),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "\$${model.vacancies[index].minSalary ?? 'set min salary'}-\$${model.vacancies[index].maxSalary ?? 'set max salary'}",
                            style: style20B,
                          ),
                          SizedBox(height: 16),
                          Wrap(
                            spacing: 8.w, // Horizontal spacing
                            runSpacing: 8.h, // Vertical spacing for new rows
                            children: List.generate(model.tagItemsList.length, (
                              index,
                            ) {
                              // Display data using index
                              return CustomIconTextTag(
                                item: model.tagItemsList[index],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Handle dismiss/dislike action
                              Navigator.of(buildContext).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: pinkColor,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                CompanyJobDetailScreen(
                                  jobVacancyModel: model.vacancies[index],

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
                                  ///
                                  ///
                                  index: index,
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: blackColor),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(15),
                              child: Center(
                                child: Image.asset(AppAssets.eyeIcon, scale: 4),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle favorite/like action
                              Navigator.of(buildContext).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: greenColor,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          15.verticalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
