import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_profile_screen.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_job_detail/company_job_detail_screen.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_home/candidate_home_view_model.dart';

class CandidateMatchesScreen extends StatefulWidget {
  const CandidateMatchesScreen({super.key});

  @override
  State<CandidateMatchesScreen> createState() => _CandidateMatchesScreenState();
}

class _CandidateMatchesScreenState extends State<CandidateMatchesScreen> {
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
            Text(
              'Mis matches',
              style: style24M.copyWith(color: darkPurpleColor),
            ),
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
            Text(
              'Les matches',
              style: style24M.copyWith(color: darkPurpleColor),
            ),
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
            },
          ),
        ),
      ],
    );
  }

  ///
  ///
  ///

  void _showCustomJobDetailDialog(
    BuildContext context,
    CandidateHomeViewModel model,
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
            return GestureDetector(
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

                if (details.primaryVelocity! > 300 || _swipeOffset > 100) {
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
                        Positioned.fill(
                          child: Center(
                            child: Transform.scale(
                              scale: 1,
                              child: Opacity(
                                opacity: 1.0,
                                child: _buildJobDetailContent(
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
                              ),
                            ),
                          ),
                        ),
                      Transform.translate(
                        offset: Offset(_isSwiping ? _swipeOffset * 0.7 : 0, 0),
                        child: Transform.rotate(
                          angle: _isSwiping ? _swipeOffset * 0.0008 : 0,
                          child: Opacity(
                            opacity:
                                _isSwiping
                                    ? (1 -
                                            ((_swipeOffset.abs() /
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
                      if (_isSwiping && _swipeImage.isNotEmpty)
                        IgnorePointer(
                          child: Container(
                            color: Colors.black.withOpacity(
                              0.5 * (_swipeOffset.abs() / 100).clamp(0.0, 1.0),
                            ),
                            child: Center(
                              child: Opacity(
                                opacity: (_swipeOffset.abs() / 100).clamp(
                                  0.0,
                                  1.0,
                                ),
                                child: Image.asset(
                                  _swipeImage,
                                  scale: 4,
                                  fit: BoxFit.contain,
                                  errorBuilder: (_, __, ___) => SizedBox(),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
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
    if (index < 0 || index >= model.vacancies.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final vacancy = model.vacancies[index];
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
