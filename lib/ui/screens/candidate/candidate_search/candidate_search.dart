import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/home_widget.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_matches/candidate_matches_screen.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_root/candidate_root_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_profile_screen.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_job_detail/company_job_detail_screen.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_home/candidate_home_view_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CandidateHomeViewModel()),
        ChangeNotifierProvider(create: (_) => CandidateRootScreenViewModel(0)),
      ],
      child: Consumer2<CandidateHomeViewModel, CandidateRootScreenViewModel>(
        builder:
            (context, model, rootModel, child) => Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      10.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SizedBox(
                          height: 60.h,
                          width: double.infinity,
                          child: TextFormField(
                            onFieldSubmitted: (value) => _filterJobs(value),
                            controller: _searchController,
                            onTap: () => _filterJobs(_searchController.text),
                            decoration: authFieldDecoration.copyWith(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  navigator!.pop();
                                },
                              ),
                              hintText: 'Search...',
                              hintStyle: style16M.copyWith(
                                color: darkPurpleColor,
                              ),
                              prefixIcon: Image.asset(
                                AppAssets.searchIcon,
                                scale: 4,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 10.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Center(child: _buildSearchResults(model, rootModel)),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }

  Widget _buildSearchResults(
    CandidateHomeViewModel model,
    CandidateRootScreenViewModel rootModel,
  ) {
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
            _showCustomJobDetailDialog(context, model, rootModel, index);
          },
          vacancyModel: filteredVacancies[index],
        );
      },
    );
  }

  void _showCustomJobDetailDialog(
    BuildContext context,
    CandidateHomeViewModel model,
    CandidateRootScreenViewModel rootmodel,
    int initialIndex,
  ) {
    int currentIndex = initialIndex;
    final AnimationController _swipeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: Navigator.of(context),
    );
    String _swipeImage = AppAssets.meGustaImg; // Initialize with default
    bool _isSwiping = false;
    double _swipeOffset = 0.0;

    void _handleSwipe(bool isRightSwipe, StateSetter setState) {
      if (!_swipeController.isAnimating) {
        _swipeController.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              setState(() {
                if (isRightSwipe) {
                  currentIndex =
                      currentIndex > 0
                          ? currentIndex - 1
                          : model.vacancies.length - 1;
                } else {
                  currentIndex =
                      currentIndex < model.vacancies.length - 1
                          ? currentIndex + 1
                          : 0;
                }
                _isSwiping = false;
                _swipeOffset = 0.0;
                _swipeImage = '';
                _swipeController.reset();
              });
            }
          });
        });
      }
    }

    void _triggerSwipe(bool isRightSwipe, StateSetter setState) {
      setState(() {
        _isSwiping = true;
        _swipeOffset = isRightSwipe ? 150.0 : -150.0;
        _swipeImage =
            isRightSwipe ? AppAssets.meGustaImg : AppAssets.noMeGustImg;
      });
      Future.delayed(const Duration(milliseconds: 100), () {
        _handleSwipe(isRightSwipe, setState);
      });
    }

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Stack(
              children: [
                Scaffold(
                  body: Stack(
                    children: [
                      Column(
                        children: [
                          // Fixed logo at the top (not swipable)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Image.asset(
                                AppAssets.appLogo2,
                                scale: 8,
                                color: candidatoPrimaryColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onHorizontalDragStart: (details) {
                                setState(() {
                                  _isSwiping = true;
                                  _swipeOffset = 0.0;
                                  _swipeController.reset();
                                });
                              },
                              onHorizontalDragUpdate: (details) {
                                if (!_isSwiping) return;
                                setState(() {
                                  _swipeOffset += details.delta.dx;
                                  if (_swipeOffset > 50) {
                                    _swipeImage = AppAssets.meGustaImg;
                                  } else if (_swipeOffset < -50) {
                                    _swipeImage = AppAssets.noMeGustImg;
                                  } else {
                                    _swipeImage = '';
                                  }
                                });
                              },
                              onHorizontalDragEnd: (details) {
                                if (!_isSwiping) return;

                                if (details.primaryVelocity! > 300 ||
                                    _swipeOffset > 100) {
                                  _handleSwipe(true, setState);
                                } else if (details.primaryVelocity! < -300 ||
                                    _swipeOffset < -100) {
                                  _handleSwipe(false, setState);
                                } else {
                                  setState(() {
                                    _isSwiping = false;
                                    _swipeOffset = 0.0;
                                    _swipeImage = '';
                                    _swipeController.reset();
                                  });
                                }
                              },
                              child: AnimatedBuilder(
                                animation: _swipeController,
                                builder: (context, child) {
                                  return Stack(
                                    children: [
                                      if (_isSwiping)
                                        _buildJobDetailContent(
                                          context,
                                          model,
                                          _swipeOffset > 0
                                              ? (currentIndex > 0
                                                  ? currentIndex - 1
                                                  : model.vacancies.length - 1)
                                              : (currentIndex <
                                                      model.vacancies.length - 1
                                                  ? currentIndex + 1
                                                  : 0),
                                          onSwipeLeft: () {
                                            _triggerSwipe(false, setState);
                                          },
                                          onSwipeRight: () {
                                            _triggerSwipe(true, setState);
                                          },
                                        ),
                                      Transform.translate(
                                        offset: Offset(
                                          _isSwiping ? _swipeOffset * 0.7 : 0,
                                          0,
                                        ),
                                        child: Transform.rotate(
                                          angle:
                                              _isSwiping
                                                  ? _swipeOffset * 0.0008
                                                  : 0,
                                          child: Opacity(
                                            opacity:
                                                _isSwiping
                                                    ? (1 -
                                                            ((_swipeOffset
                                                                        .abs() /
                                                                    MediaQuery.of(
                                                                      context,
                                                                    ).size.width) *
                                                                0.8))
                                                        .clamp(0.3, 1.0)
                                                    : 1.0,
                                            child: _buildJobDetailContent(
                                              context,
                                              model,
                                              currentIndex,
                                              onSwipeLeft: () {
                                                _triggerSwipe(false, setState);
                                              },
                                              onSwipeRight: () {
                                                _triggerSwipe(true, setState);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      // This is the overlay that should appear over the swipable content
                      if (_isSwiping && _swipeImage.isNotEmpty)
                        Positioned.fill(
                          child: IgnorePointer(
                            child: Container(
                              color: blackColor.withOpacity(
                                0.5 *
                                    (_swipeOffset.abs() / 100).clamp(0.0, 1.0),
                              ),
                              child: Center(
                                child: Opacity(
                                  opacity: (_swipeOffset.abs() / 100).clamp(
                                    0.0,
                                    1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  ///
                  /// bottom Navigation Bar
                  ///
                  bottomNavigationBar: bottomBar(rootmodel, setState),
                ),

                // This is the overlay that should appear over the swipable content
                if (_isSwiping && _swipeImage.isNotEmpty)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Container(
                        color: blackColor.withOpacity(
                          0.5 * (_swipeOffset.abs() / 100).clamp(0.0, 1.0),
                        ),
                        child: Center(
                          child: Opacity(
                            opacity: (_swipeOffset.abs() / 100).clamp(0.0, 1.0),
                            child: Image.asset(
                              _swipeImage,
                              scale: 4,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => SizedBox(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    ).then((_) {
      _swipeController.dispose();
    });
  }

  Widget _buildJobDetailContent(
    BuildContext context,
    CandidateHomeViewModel model,
    int index, {
    VoidCallback? onSwipeLeft,
    VoidCallback? onSwipeRight,
  }) {
    if (index < 0 || index >= filteredVacancies.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final vacancy = filteredVacancies[index];
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.98,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 5),
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
                        color: const Color(0xFF28407B),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          image:
                              vacancy.imageUrl != null &&
                                      vacancy.imageUrl!.isNotEmpty
                                  ? AssetImage(vacancy.imageUrl!)
                                  : AssetImage(''),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
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
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.all(8.2),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
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
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => Get.to(CompanyProfileScreen()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkPurpleColor.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    vacancy.imageUrl?.isNotEmpty == true
                                        ? vacancy.imageUrl!
                                        : '',
                                    height: 30,
                                    width: 30,
                                    errorBuilder:
                                        (_, __, ___) => Icon(Icons.business),
                                  ),
                                  const SizedBox(width: 8),
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text('${vacancy.jobTitle}', style: style24B.copyWith()),
                      const SizedBox(height: 4),
                      Text(
                        "${vacancy.location ?? 'set location'} •${vacancy.state ?? 'set state'}",
                        style: style14M.copyWith(),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "\$${vacancy.minSalary ?? 'set min salary'}-\$${vacancy.maxSalary ?? 'set max salary'}",
                        style: style20B,
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: List.generate(model.tagItemsList.length, (i) {
                          return CustomIconTextTag(item: model.tagItemsList[i]);
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (onSwipeLeft != null) onSwipeLeft();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: pinkColor,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(15),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => CompanyJobDetailScreen(
                              jobVacancyModel: vacancy,
                              index: index,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: darkPurpleColor),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Center(
                            child: Image.asset(
                              AppAssets.eyeIcon,
                              scale: 4,
                              errorBuilder:
                                  (_, __, ___) => Icon(Icons.remove_red_eye),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onSwipeRight != null) onSwipeRight();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: greenColor,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(15),
                          child: const Icon(
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
  }
}
