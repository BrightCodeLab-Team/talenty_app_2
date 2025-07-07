import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/comapny_profile_screen.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_job_detail/company_job_detail_screen.dart';
import 'package:talenty_app/ui/screens/candidate/home/candidate_home_screen.dart';
import 'package:talenty_app/ui/screens/candidate/home/candidate_home_view_model.dart';

class CandidateSearchScreen extends StatefulWidget {
  final List<JobVacancyModel> allVacancies;

  const CandidateSearchScreen({super.key, required this.allVacancies});

  @override
  State<CandidateSearchScreen> createState() => _CandidateSearchScreenState();
}

class _CandidateSearchScreenState extends State<CandidateSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<JobVacancyModel> filteredVacancies = [];

  @override
  void initState() {
    super.initState();
    filteredVacancies = [];
  }

  void _filterJobs(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredVacancies = [];
      } else {
        filteredVacancies =
            widget.allVacancies
                .where(
                  (job) =>
                      job.jobTitle!.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }
  ////
  ///
  ///
  ///
  ///
  ///
  ///

  ///
  //   onPressed: () => _filterJobs(_searchController.text),
  //  onSubmitted: (value) => _filterJobs(value),
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateHomeViewModel(),
      child: Consumer<CandidateHomeViewModel>(
        builder:
            (context, model, child) => Scaffold(
              // appBar: AppBar(
              //   backgroundColor: whiteColor,
              //   titleSpacing: 0.0, // Remove default title spacing
              //   centerTitle: false,
              //   title: Padding(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 16.w,
              //     ), // Add some horizontal padding
              //     child: SizedBox(
              //       height: 40.h,
              //       width: double.infinity,
              //       child: TextFormField(
              //         onFieldSubmitted: (value) => _filterJobs(value),
              //         controller: _searchController,
              //         onTap: () => _filterJobs(_searchController.text),
              //         decoration: authFieldDecoration.copyWith(
              //           suffixIcon: IconButton(
              //             // Using IconButton for better tap area for suffix
              //             icon: Icon(Icons.close),
              //             onPressed: () {
              //               navigator!.pop();
              //             },
              //           ),
              //           hintText: 'Search...',
              //           hintStyle: style16M.copyWith(color: blackColor),
              //           prefixIcon: Image.asset(AppAssets.searchIcon, scale: 4),
              //           contentPadding: EdgeInsets.symmetric(
              //             vertical: 8.h,
              //             horizontal: 10.w,
              //           ), // Adjust content padding
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      10.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ), // Add some horizontal padding
                        child: SizedBox(
                          height: 40.h,
                          width: double.infinity,
                          child: TextFormField(
                            onFieldSubmitted: (value) => _filterJobs(value),
                            controller: _searchController,
                            onTap: () => _filterJobs(_searchController.text),
                            decoration: authFieldDecoration.copyWith(
                              suffixIcon: IconButton(
                                // Using IconButton for better tap area for suffix
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  navigator!.pop();
                                },
                              ),
                              hintText: 'Search...',
                              hintStyle: style16M.copyWith(color: blackColor),
                              prefixIcon: Image.asset(
                                AppAssets.searchIcon,
                                scale: 4,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 10.w,
                              ), // Adjust content padding
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Center(child: _buildSearchResults(model)),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }

  Widget _buildSearchResults(CandidateHomeViewModel model) {
    if (_searchController.text.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.searchIcon, height: 100, width: 100),
            SizedBox(height: 20),
            Text(
              'Search for jobs',
              style: style20B.copyWith(color: textDarkGreyColor),
            ),
            SizedBox(height: 8),
            Text(
              'Find your dream job by searching for keywords',
              style: style14M.copyWith(color: textGreyColor),
            ),
          ],
        ),
      );
    }

    if (filteredVacancies.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.vacancyEmpty, height: 100, width: 100),
            SizedBox(height: 20),
            Text(
              'No jobs found',
              style: style20B.copyWith(color: textDarkGreyColor),
            ),
            SizedBox(height: 8),
            Text(
              'Try different keywords or filters',
              style: style14M.copyWith(color: textGreyColor),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(16),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 0.37,
      ),
      itemCount: filteredVacancies.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return CustomCandidateHomeVacancyWidget(
          onTap: () {
            _showCustomJobDetailDialog(context, model, index);
          },
          vacancyModel: filteredVacancies[index],
        );
      },
    );
  }

  void _showCustomJobDetailDialog(
    BuildContext context,
    CandidateHomeViewModel model,
    int index,
  ) {
    final job = filteredVacancies[index]; // Use the filtered list instead

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (
        BuildContext buildContext,
        Animation animation,
        Animation secondaryAnimation,
      ) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              height: MediaQuery.of(buildContext).size.height * 0.9,
              width: MediaQuery.of(buildContext).size.width * 0.98,
              margin: EdgeInsets.symmetric(horizontal: 20),
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
                          height: 180,
                          decoration: BoxDecoration(
                            color: Color(0xFF28407B),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                            image: DecorationImage(
                              image: AssetImage(job.imageUrl ?? ''),
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
                            child: Container(
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
                                    job.imageUrl ?? '',
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
                          ),
                          15.verticalSpace,
                          Text('${job.jobTitle}', style: style24B.copyWith()),
                          SizedBox(height: 4),
                          Text(
                            "${job.location ?? 'set location'} •${job.state ?? 'set state'}",
                            style: style14M.copyWith(),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "\$${job.minSalary ?? 'set min salary'}-\$${job.maxSalary ?? 'set max salary'}",
                            style: style20B,
                          ),
                          SizedBox(height: 16),
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: List.generate(model.tagItemsList.length, (
                              index,
                            ) {
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
                                  jobVacancyModel: job, // Use the filtered job
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
