// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/custom_widgets/divider.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_job_detail/company_job_detail_screen.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_profile_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/home/candidate_home_view_model.dart';

class CompanyProfileScreen extends StatefulWidget {
  // final JobVacancyModel jobVacancyModel;
  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) =>
              //CompanyProfileViewModel(),
              CandidateHomeViewModel(),

      child: Consumer<
        CandidateHomeViewModel

        //CompanyProfileViewModel
      >(
        builder:
            (context, model, child) => Scaffold(
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 250,

                      ///
                      ///. top image
                      ///
                      decoration: BoxDecoration(
                        color: const Color(0xFF28407B),
                        image: DecorationImage(
                          image: AssetImage(AppAssets.menulogo),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ///
                          ///. back arrow on top left
                          ///
                          Positioned(
                            top: 8,
                            left: 8,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 230,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),

                      ///
                      ///. status and company or industry  name just below circle company logo
                      ///
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          50.verticalSpace,
                          Align(
                            alignment: Alignment.topCenter,
                            child: Transform.translate(
                              offset: const Offset(0, -50),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                padding: const EdgeInsets.fromLTRB(
                                  20,
                                  55,
                                  20,
                                  15,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [],
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Viajes Premium',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Industria Turística',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          ///
                          ///. tab bar
                          ///
                          TabBar(
                            controller: _tabController,
                            labelColor: primaryColor,
                            unselectedLabelColor: textGreyColor.withOpacity(
                              0.4,
                            ),
                            indicatorColor: primaryColor,
                            indicatorWeight: 4,
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: greyColor.withOpacity(0.4),
                            dividerHeight: 4,
                            tabs: [
                              Tab(text: 'Vacantes'),
                              Tab(text: 'Nosotros'),
                              Tab(text: 'Empleados'),
                            ],
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          20.verticalSpace,

                          ///
                          ///. tab bar view
                          ///
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                firstTabBarView(model),
                                secondTabBarView(),
                                thirdTabBarView(),
                              ],
                            ),
                          ),
                          30.verticalSpace,
                        ],
                      ),
                    ),
                  ),

                  ///
                  ///. top company logo in circle above top image
                  ///
                  Positioned(
                    top: 220 - (80 / 2),
                    left: MediaQuery.of(context).size.width / 2 - (80 / 2),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: whiteColor),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(AppAssets.menulogo),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  ///
  ///. first tab bar view
  ///
  Padding firstTabBarView(
    //CompanyProfileViewModel model
    CandidateHomeViewModel model,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: model.vacancies.length,
        itemBuilder: (context, index) {
          return CustomJobVacancyCard(
            onTap: () {
              Get.to(
                CompanyJobDetailScreen(
                  jobVacancyModel: JobVacancyModel(),

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
            jobVacancyModel: model.vacancies[index],
          );
        },
      ),
    );
  }

  ///
  ///. second tab bar view
  ///
  secondTabBarView() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text('Descripción', style: style16B),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              'En Viajes Premium®, somos la única empresa que garantiza las mejores experiencias de viaje. Con 19 años en el mercado, te ofrecemos vivencias mágicas e inolvidables en una amplia variedad de destinos en México y alrededor del mundo. Estamos en constante expansión, trabajando en la incorporación de nuevos destinos para brindarte experiencias aún más excepcionales.',
              style: style14M.copyWith(color: lightBlackColor),
            ),
          ),
          10.verticalSpace,
          CustomDivider(),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text('Misión', style: style16B),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              'Omega 306, Romero de Terreros, Coyoacán, 04310 Ciudad de México, CDMX',
              style: style14M.copyWith(color: blackColor),
            ),
          ),
          10.verticalSpace,
          CustomDivider(),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text('Sector', style: style16B),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text('Privado', style: style14M.copyWith(color: blackColor)),
          ),
          10.verticalSpace,
          CustomDivider(),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text('Nùmro de empleados', style: style16B),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text('14000', style: style14M.copyWith(color: blackColor)),
          ),
        ],
      ),
    );
  }

  ///
  ///. third tab bar view
  ///

  GestureDetector thirdTabBarView() {
    return GestureDetector(
      onTap: () {
        print('navigate to user profile');
      },
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: 70.h,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: borderGreyColor),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage(AppAssets.img2),
                ),
                title: Text(
                  'Jesús Arellano',
                  style: style18B.copyWith(color: blackColor),
                ),
                subtitle: Text(
                  'Recursos Humanos',
                  style: style14M.copyWith(color: blackColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

///
///
///. custom job vacancy card
///
///

class CustomJobVacancyCard extends StatelessWidget {
  final JobVacancyModel jobVacancyModel;
  final VoidCallback? onTap;

  const CustomJobVacancyCard({required this.jobVacancyModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        jobVacancyModel.imageUrl ?? AppAssets.menulogo,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            jobVacancyModel.jobTitle ?? 'Job Title',
                            style: style16B.copyWith(color: blackColor),
                          ),
                          Spacer(),
                          Container(
                            color: darkBlueColor.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              child: Text(
                                '¡Match!',
                                style: style12M.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            jobVacancyModel.jobSubTitle ?? 'Company Name',
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                          Text(' • ', style: style14M),
                          Expanded(
                            child: Text(
                              jobVacancyModel.location ?? 'location',
                              style: style14M.copyWith(color: textGreyColor),
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
            const SizedBox(height: 10),
            Text(
              jobVacancyModel.jobDescription ?? 'No description provided.',
              style: style14M.copyWith(color: blackColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              jobVacancyModel.jobPostedTime ?? 'Unknown time',
              style: style14M.copyWith(color: textGreyColor),
            ),
            10.verticalSpace,
            CustomDivider(),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.people_alt_outlined,
                      size: 18,
                      color: lightPurpleColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      jobVacancyModel.matches ?? '0 Matches',
                      style: style12M.copyWith(color: lightBlackColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.money, size: 18, color: lightPurpleColor),
                    const SizedBox(width: 5),
                    Text(
                      '\$${jobVacancyModel.minSalary ?? ''} - \$${jobVacancyModel.maxSalary ?? ''}',
                      style: style12M.copyWith(color: lightBlackColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: lightPurpleColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      jobVacancyModel.state ?? 'Unknown',
                      style: style12M.copyWith(color: lightBlackColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
