// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, unnecessary_underscores, no_leading_underscores_for_local_identifiers, deprecated_member_use, invalid_use_of_visible_for_testing_member, use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/bottom_bar/bottom_navigation_bar.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/home_widget.dart'
    show CustomCandidateHomeVacancyWidget;
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_menu.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_text_field.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_root/candidate_root_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_search/candidate_search.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_profile_screen.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_job_detail/company_job_detail_screen.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_home/candidate_home_view_model.dart';
import 'package:talenty_app/ui/screens/company/notifications/notification_screen.dart';

class CandidateHomeScreen extends StatefulWidget {
  @override
  State<CandidateHomeScreen> createState() => _CandidateHomeScreenState();
}

class _CandidateHomeScreenState extends State<CandidateHomeScreen> {
  final List<String> categories = [
    'Diseño Web',
    'Diseño Gráfico',
    'Desarrollo Mobile',
    'Marketing Digital',
  ];
  final List<String> federalEntities = [
    'Ciudad de México',
    'Jalisco',
    'Nuevo León',
  ];
  final List<String> municipalities = [
    'Benito Juárez',
    'Guadalajara',
    'Monterrey',
  ];

  List<String> workModalities = ['Híbrido', 'Presencial', 'Remoto'];
  String? selectedWorkModality;

  List<String> skills = [
    '🌐 Diseño web',
    '🎨 Diseño gráfico',
    'UI/UX',
    'Front-end',
    'Back-end',
    'Mobile Development',
  ];
  String? selectedSkill;

  // New state variables for dropdowns
  String? selectedCategory;
  String? selectedFederalEntity;
  String? selectedMunicipality;

  // Text editing controllers for salary range
  final TextEditingController _salaryMinController = TextEditingController();
  final TextEditingController _salaryMaxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (workModalities.isNotEmpty) {
      selectedWorkModality = workModalities[0];
    }
    // Initialize default values for dropdowns if needed, or leave null for 'hint'
    selectedCategory = null; // Default to hint
    selectedFederalEntity = federalEntities[0]; // Default to first item
    selectedMunicipality = municipalities[0]; // Default to first item
  }

  @override
  void dispose() {
    _salaryMinController.dispose();
    _salaryMaxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateHomeViewModel(),
      child: Consumer2<CandidateHomeViewModel, CandidateRootScreenViewModel>(
        builder:
            (context, model, rootModel, child) => Scaffold(
              ///
              /// App Bar
              ///
              appBar: _appBar(model),

              ///
              /// Start Body
              ///
              body: Stack(
                alignment: Alignment.topRight,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vacantes para ti",
                            style: style24M.copyWith(
                              fontFamily: GoogleFonts.lora().fontFamily,
                            ),
                          ),
                          10.verticalSpace,
                          Text(
                            "Con base en tu experiencia, habilidades y preferencias, hemos seleccionado las vacantes que podrían ser ideales para ti. ",
                            style: style14M.copyWith(color: textDarkGreyColor),
                          ),
                          20.verticalSpace,
                          Text(
                            "Categorías que podrían interesarte",
                            style: style16M,
                          ),
                          30.verticalSpace,
                          10.verticalSpace,
                          model.vacancies.isNotEmpty
                              ? _CategoriesAnimated(model: model)
                              : SizedBox(),
                          10.verticalSpace,
                          model.categorySelect == 0
                              ? GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                      childAspectRatio: 0.40,
                                    ),
                                itemCount:
                                    model.filtersApplied
                                        ? model.filteredVacancies.length
                                        : model.vacancies.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  final vacancy =
                                      model.filtersApplied
                                          ? model.filteredVacancies[index]
                                          : model.vacancies[index];

                                  return CustomCandidateHomeVacancyWidget(
                                    onTap: () {
                                      _showCustomJobDetailDialog(
                                        context,
                                        model,
                                        rootModel,
                                        model.filtersApplied
                                            ? model.vacancies.indexOf(vacancy)
                                            : index,
                                      );
                                    },
                                    vacancyModel: vacancy,
                                  );
                                },
                              )
                              : 20.verticalSpace,
                          50.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 90),
                    child: Image.asset(AppAssets.badgeIcon, scale: 4),
                  ),
                ],
              ),
            ),
      ),
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
                  ),
                  bottomNavigationBar: // This is the overlay that should appear over the swipable content
                      bottomBar(rootmodel),
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
    if (index < 0 || index >= model.vacancies.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final vacancy = model.vacancies[index];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.10),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                height: 296,
                decoration: BoxDecoration(
                  color: const Color(0xFF28407B),
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image:
                        vacancy.imageUrl != null && vacancy.imageUrl!.isNotEmpty
                            ? AssetImage(vacancy.imageUrl!)
                            : AssetImage(''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xff4E4E4E),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                      size: 20,
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: blackColor.withOpacity(0.2),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Viajes Premium',
                                  style: style14M.copyWith(
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  'Ver Perfil →',
                                  style: style12M.copyWith(
                                    color: textGreyColor,
                                    decoration: TextDecoration.none,
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
                Text(
                  '${vacancy.jobTitle}',
                  style: style24B.copyWith(decoration: TextDecoration.none),
                ),
                const SizedBox(height: 4),
                Text(
                  "${vacancy.location ?? 'set location'} •${vacancy.state ?? 'set state'}",
                  style: style14M.copyWith(decoration: TextDecoration.none),
                ),
                const SizedBox(height: 8),
                Text(
                  "\$${vacancy.minSalary ?? 'set min salary'}-\$${vacancy.maxSalary ?? 'set max salary'}",
                  style: style20B.copyWith(decoration: TextDecoration.none),
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
                    child: const Icon(Icons.close, color: whiteColor, size: 30),
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
                      border: Border.all(color: blackColor),
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
                      color: whiteColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(CandidateHomeViewModel model) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(
        AppAssets.appLogo2,
        height: 40,
        width: 114,
        color: candidatoPrimaryColor,
      ),
      actionsPadding: EdgeInsets.only(right: 20),
      actions: [
        GestureDetector(
          onTap: () {
            _showFilterBottomSheet(model);
          },
          child: Image.asset(
            AppAssets.filterIcon,
            height: 17,
            width: 16,
            color: iconColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 14.0),
          child: GestureDetector(
            onTap: () {
              Get.to(() => NotificationScreen());
            },
            child: Image.asset(
              AppAssets.notifIcon,
              height: 24,
              width: 24,
              color: iconColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => CandidateSearchScreen(allVacancies: model.vacancies));
          },
          child: Image.asset(
            AppAssets.searchIcon,
            height: 48,
            width: 25,
            color: iconColor,
          ),
        ),
      ],
    );
  }

  void _showFilterBottomSheet(CandidateHomeViewModel model) {
    final filterState = FilterState(); // Create local state for filters

    // Initialize filter state with default values
    filterState.selectedFederalEntity = federalEntities[0];
    filterState.selectedMunicipality = municipalities[0];
    filterState.selectedWorkModality =
        workModalities.isNotEmpty ? workModalities[0] : null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            void _selectWorkModality(String modality) {
              setModalState(() {
                filterState.selectedWorkModality = modality;
                // Reorder to show selected first
                workModalities.remove(modality);
                workModalities.insert(0, modality);
              });
            }

            void _selectSkill(String skill) {
              setModalState(() {
                if (filterState.selectedSkill == skill) {
                  filterState.selectedSkill = null;
                  skills.remove(skill);
                  skills.add(skill);
                } else {
                  filterState.selectedSkill = skill;
                  skills.remove(skill);
                  skills.insert(0, skill);
                }
              });
            }

            return DraggableScrollableSheet(
              initialChildSize: 0.9,
              minChildSize: 0.5,
              maxChildSize: 1.0,
              expand: false,
              builder: (_, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Filtrar por',
                                style: style24M.copyWith(
                                  color: darkPurpleColor,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text('Categoría que deseas', style: style16B),
                          const SizedBox(height: 8),

                          // Updated dropdown using filterState
                          CustomDropDownTextField(
                            borderColor:
                                filterState.dropDown1Error
                                    ? primaryColor
                                    : lightBlackColor,
                            hasDroppedDown: filterState.dropDown1,
                            onTap: () {
                              setModalState(() {
                                filterState.toggleDropDown1();
                                filterState.dropDown1Error = false;
                              });
                            },
                            text:
                                filterState.dropDownText1.isEmpty
                                    ? "Ej: Diseño Web"
                                    : filterState.dropDownText1,
                          ),
                          if (filterState.dropDown1Error)
                            Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(
                                'field_required'.tr,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          10.verticalSpace,
                          DropDownMenu(
                            isDroppedDown: filterState.dropDown1,
                            height: 180,
                            options: model.categories,
                            onItemTap: (val) {
                              setModalState(() {
                                filterState.setDropDownText1(val);
                                filterState.selectedCategory = val;
                                filterState.dropDown1Error = false;
                                filterState.toggleDropDown1();
                              });
                            },
                          ),

                          const SizedBox(height: 20),
                          Text(
                            'Rango de sueldo deseado',
                            style: style16B.copyWith(color: darkPurpleColor),
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: filterState.salaryMinController,
                                  decoration: authFieldDecoration.copyWith(
                                    hintText: 'De:',
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: filterState.salaryMaxController,
                                  decoration: authFieldDecoration.copyWith(
                                    hintText: 'A:',
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Ingresa una cantidad en pesos mexicanos',
                            style: style14M.copyWith(
                              color: textGreyColor.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Entidad Federativa',
                            style: style16B.copyWith(color: darkPurpleColor),
                          ),
                          const SizedBox(height: 8),

                          // Federal Entity Dropdown
                          CustomDropDownTextField(
                            borderColor:
                                filterState.dropDown2Error
                                    ? primaryColor
                                    : lightBlackColor,
                            hasDroppedDown: filterState.dropDown2,
                            onTap: () {
                              setModalState(() {
                                filterState.toggleDropDown2();
                                filterState.dropDown2Error = false;
                              });
                            },
                            text:
                                filterState.dropDownText2.isEmpty
                                    ? "--Selecciona uno--"
                                    : filterState.dropDownText2,
                          ),
                          if (filterState.dropDown2Error)
                            Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(
                                'field_required'.tr,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          10.verticalSpace,
                          DropDownMenu(
                            isDroppedDown: filterState.dropDown2,
                            height: 180,
                            options: federalEntities,
                            onItemTap: (val) {
                              setModalState(() {
                                filterState.setDropDownText2(val);
                                filterState.selectedFederalEntity = val;
                                filterState.dropDown2Error = false;
                                filterState.toggleDropDown2();
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Alcaldía o municipio',
                            style: style16B.copyWith(color: darkPurpleColor),
                          ),
                          const SizedBox(height: 8),
                          CustomDropDownTextField(
                            borderColor:
                                filterState.dropDown3Error
                                    ? primaryColor
                                    : lightBlackColor,
                            hasDroppedDown: filterState.dropDown2,
                            onTap: () {
                              setModalState(() {
                                filterState.toggleDropDown3();
                                filterState.dropDown3Error = false;
                              });
                            },
                            text:
                                filterState.dropDownText3.isEmpty
                                    ? "--Selecciona uno--"
                                    : filterState.dropDownText3,
                          ),
                          if (filterState.dropDown3Error)
                            Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(
                                'field_required'.tr,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          10.verticalSpace,
                          DropDownMenu(
                            isDroppedDown: filterState.dropDown3,
                            height: 180,
                            options: municipalities,
                            onItemTap: (val) {
                              setModalState(() {
                                filterState.setDropDownText3(val);
                                filterState.selectedFederalEntity = val;
                                filterState.dropDown3Error = false;
                                filterState.toggleDropDown3();
                              });
                            },
                          ),

                          const SizedBox(height: 20),
                          Text(
                            'Modalidad de trabajo',
                            style: style16B.copyWith(color: darkPurpleColor),
                          ),
                          const SizedBox(height: 8),
                          AnimatedChoiceChips<String>(
                            items: workModalities,
                            selectedItem: filterState.selectedWorkModality,
                            onSelected: _selectWorkModality,
                            labelBuilder: (modality) {
                              final isSelected =
                                  modality == filterState.selectedWorkModality;

                              return Row(
                                children: [
                                  Image.asset(
                                    AppAssets.location2,
                                    scale: 3,
                                    color: isSelected ? whiteColor : greyColor,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    modality,
                                    style: style14M.copyWith(
                                      color:
                                          isSelected ? whiteColor : greyColor,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Filtrar por habilidades',
                            style: style16B.copyWith(color: darkPurpleColor),
                          ),
                          const SizedBox(height: 8),
                          MultiSelectSkillsChips(
                            skills: skills,
                            selectedSkills: filterState.selectedSkills,
                            onSelectionChanged: (updatedSelection) {
                              setState(() {
                                filterState.selectedSkills = updatedSelection;
                              });
                            },
                          ),
                          20.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    setModalState(() {
                                      filterState.selectedWorkModality =
                                          workModalities.isNotEmpty
                                              ? workModalities[0]
                                              : null;
                                      filterState.selectedSkill = null;
                                      filterState.selectedCategory = null;
                                      filterState.selectedFederalEntity =
                                          federalEntities[0];
                                      filterState.selectedMunicipality =
                                          municipalities[0];
                                      filterState.salaryMinController.clear();
                                      filterState.salaryMaxController.clear();
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: Color(0xFFB4372F),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text(
                                    'Borrar filtros',
                                    style: TextStyle(color: Color(0xFFB4372F)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    model.applyFilters(
                                      category: filterState.selectedCategory,
                                      minSalary:
                                          filterState.salaryMinController.text,
                                      maxSalary:
                                          filterState.salaryMaxController.text,
                                      federalEntity:
                                          filterState.selectedFederalEntity,
                                      municipality:
                                          filterState.selectedMunicipality,
                                      workModality:
                                          filterState.selectedWorkModality,
                                      skill: filterState.selectedSkill,
                                    );
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: brownColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text(
                                    'Aplicar filtros',
                                    style: TextStyle(color: whiteColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _CategoriesAnimated extends StatefulWidget {
  final CandidateHomeViewModel model;

  const _CategoriesAnimated({required this.model});

  @override
  State<_CategoriesAnimated> createState() => _CategoriesAnimatedState();
}

class _CategoriesAnimatedState extends State<_CategoriesAnimated> {
  List<String> categories = [
    "Todos",
    "Arte y Diseño",
    "Programación y Tecnología",
    "Marketing y Ventas",
  ];

  ///
  ///
  ///
  ///
  ///
  // rootModel will be initialized in the build method

  ///
  ///
  ///

  @override
  Widget build(BuildContext context) {
    // final rootModel = Provider.of<CandidateRootScreenViewModel>(
    //   context,
    //   listen: false,
    // );
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          // Determine actual index considering selected item is moved to position 0
          int displayIndex = index;
          if (widget.model.categorySelect != 0 && index == 0) {
            displayIndex = widget.model.categorySelect;
          } else if (widget.model.categorySelect != 0 &&
              index <= widget.model.categorySelect) {
            displayIndex = index - 1;
          }

          final isSelected = widget.model.categorySelect == displayIndex;
          final isFirstTab = index == 0;
          final isSwappingTab = isSelected || isFirstTab;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              if (isSwappingTab) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(isSelected ? 1.0 : -1.0, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                  ),
                  child: child,
                );
              }
              return child;
            },
            child: GestureDetector(
              key: ValueKey('${categories[displayIndex]}_$isSelected'),
              onTap: () {
                // rootModel.nextStep();
                widget.model.onClickCategory(displayIndex);
                setState(() {}); // triggers instant rebuild
              },
              child: Container(
                margin: EdgeInsets.only(left: index == 0 ? 0 : 5),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                height: 34,
                decoration: BoxDecoration(
                  color: isSelected ? brownColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1.0, color: brownColor),
                ),
                child: DefaultTextStyle(
                  style: style12M.copyWith(
                    color: isSelected ? whiteColor : lightBlackColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child:
                            isSelected
                                ? Icon(
                                  Icons.cancel_outlined,
                                  key: ValueKey('cancel_icon_$displayIndex'),
                                  color: whiteColor,
                                  size: 15,
                                )
                                : const SizedBox(width: 0),
                      ),
                      if (isSelected) const SizedBox(width: 8),
                      Text(categories[displayIndex]),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget bottomBar(CandidateRootScreenViewModel model) {
  return Container(
    height: 70,
    decoration: BoxDecoration(
      color: whiteColor,
      boxShadow: [
        BoxShadow(
          color: Color(0xff9B9B9B).withOpacity(0.10),
          offset: Offset(0, 0),
          spreadRadius: 0,
          blurRadius: 10,
        ),
      ],
    ),

    // surfaceTintColor: whiteColor,
    // elevation: 0.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomBottomNavigator(
          currentIndex: model.selectedScreen,
          indexNumber: 0,
          image: model.selectedScreen == 0 ? AppAssets.home : AppAssets.home,
          onPressed: () {
            model.updatedScreen(0);
          },
          text: "Inicio",
        ),
        CustomBottomNavigator(
          currentIndex: model.selectedScreen,
          indexNumber: 1,
          image: model.selectedScreen == 1 ? AppAssets.tips : AppAssets.tips,
          onPressed: () {
            model.updatedScreen(1);
          },
          text: 'Tips',
        ),
        CustomBottomNavigator(
          currentIndex: model.selectedScreen,
          indexNumber: 2,
          image:
              model.selectedScreen == 2
                  ? AppAssets.vacancies
                  : AppAssets.vacancies,
          onPressed: () {
            model.updatedScreen(2);
          },
          text: "Matches",
        ),

        CustomBottomNavigator(
          currentIndex: model.selectedScreen,
          indexNumber: 3,
          image: model.selectedScreen == 3 ? AppAssets.chat : AppAssets.chat,
          onPressed: () {
            model.updatedScreen(3);
          },
          text: "Chats",
        ),
        CustomBottomNavigator(
          currentIndex: model.selectedScreen,
          indexNumber: 4,
          image: model.selectedScreen == 4 ? AppAssets.menu : AppAssets.menu,
          onPressed: () {
            model.updatedScreen(4);
          },
          text: "Más",
        ),
      ],
    ),
  );
}

class AnimatedChoiceChips<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final ValueChanged<T> onSelected;
  final Widget Function(T) labelBuilder;
  final Duration animationDuration;
  final Color selectedColor;
  final Color borderColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const AnimatedChoiceChips({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
    required this.labelBuilder,
    this.animationDuration = const Duration(milliseconds: 300),
    this.selectedColor = brownColor,
    this.borderColor = brownColor,
    this.selectedTextColor = whiteColor,
    this.unselectedTextColor = blackColor,
  }) : super(key: key);

  @override
  _AnimatedChoiceChipsState<T> createState() => _AnimatedChoiceChipsState<T>();
}

class _AnimatedChoiceChipsState<T> extends State<AnimatedChoiceChips<T>> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            widget.items.map((item) {
              final isSelected = widget.selectedItem == item;

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: AnimatedSwitcher(
                  duration: widget.animationDuration,
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: GestureDetector(
                    key: ValueKey('$item\_$isSelected'),
                    onTap: () => widget.onSelected(item),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? widget.selectedColor : whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              isSelected
                                  ? Colors.transparent
                                  : widget.borderColor,
                          width: 1.0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color:
                              isSelected
                                  ? widget.selectedTextColor
                                  : widget.unselectedTextColor,
                        ),
                        child: widget.labelBuilder(item),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class MultiSelectSkillsChips extends StatefulWidget {
  final List<String> skills;
  final List<String> selectedSkills;
  final ValueChanged<List<String>> onSelectionChanged;

  const MultiSelectSkillsChips({
    Key? key,
    required this.skills,
    required this.selectedSkills,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _MultiSelectSkillsChipsState createState() => _MultiSelectSkillsChipsState();
}

class _MultiSelectSkillsChipsState extends State<MultiSelectSkillsChips> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 50,
        child: Row(
          children:
              widget.skills.map((skill) {
                final isSelected = widget.selectedSkills.contains(skill);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        widget.selectedSkills.remove(skill);
                      } else {
                        widget.selectedSkills.add(skill);
                      }
                      widget.onSelectionChanged(widget.selectedSkills);
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: EdgeInsets.only(left: 8.0),
                    decoration: BoxDecoration(
                      color: isSelected ? lightbrownColor : whiteColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.25),
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                          blurRadius: 4,
                        ),
                      ],
                      border: Border.all(
                        color: isSelected ? brownColor : Colors.transparent,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          skill,
                          style: TextStyle(
                            color: isSelected ? darkPurpleColor : greyColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child:
                              isSelected
                                  ? Image.asset(AppAssets.closeIcon, scale: 3.5)
                                  : Icon(
                                    Icons.add,
                                    key: ValueKey('add_$skill'),
                                    color: greyColor,
                                    size: 18,
                                  ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
