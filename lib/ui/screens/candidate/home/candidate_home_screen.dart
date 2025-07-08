// ignore_for_file: use_key_in_widget_constructors

import 'dart:math';

import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_search/candidate_search.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/comapny_profile_screen.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_job_detail/company_job_detail_screen.dart';
import 'package:talenty_app/ui/screens/candidate/home/candidate_home_view_model.dart';
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
    '--Selecciona uno--',
    'Ciudad de México',
    'Jalisco',
    'Nuevo León',
  ];
  final List<String> municipalities = [
    'Selecciona una opción',
    'Benito Juárez',
    'Guadalajara',
    'Monterrey',
  ];

  List<String> workModalities = ['Híbrido', 'Presencial', 'Remoto'];
  String? selectedWorkModality;

  List<String> skills = [
    'Diseño web',
    'Diseño gráfico',
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
      child: Consumer<CandidateHomeViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 40, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _header(model),
                      10.verticalSpace,
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
                      10.verticalSpace,
                      model.vacancies.isNotEmpty && model.vacancies != null
                          ? _categories(model: model)
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
                                  childAspectRatio: 0.37,
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
                                    model.filtersApplied
                                        ? model.vacancies.indexOf(
                                          vacancy,
                                        ) // Get original index
                                        : index,
                                  );
                                },
                                vacancyModel: vacancy,
                              );
                            },
                          )
                          : model.categorySelect == 1
                          ? Text('2')
                          : Text('3'),
                      // Consider replacing this with a relevant widget for other categories
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///. dialogue box
  ///

  void _showCustomJobDetailDialog(
    BuildContext context,
    CandidateHomeViewModel model,
    int index,
  ) {
    // Create animation controller for swipe effects
    final AnimationController _swipeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: Navigator.of(context),
    );

    // Track swipe state
    double _swipeOffset = 0;
    String _swipeImage = '';

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
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragStart: (details) {
            _swipeController.reset();
          },
          onHorizontalDragUpdate: (details) {
            _swipeOffset = details.delta.dx;
            if (_swipeOffset > 0) {
              _swipeImage = AppAssets.noMeGustImg; // Right swipe image
            } else {
              _swipeImage = AppAssets.meGustaImg; // Left swipe image
            }
          },
          onHorizontalDragEnd: (details) {
            if (_swipeOffset.abs() > 20) {
              _swipeController.forward().then((_) {
                Future.delayed(Duration(seconds: 1), () {
                  _swipeController.reverse();
                });
              });
            }
            _swipeOffset = 0;
          },
          child: AnimatedBuilder(
            animation: _swipeController,
            builder: (context, child) {
              if (_swipeController.value > 0) {
                return Center(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Image.asset(_swipeImage, fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                );
              }

              return Transform.translate(
                offset: Offset(_swipeOffset, 0),
                child: Opacity(
                  opacity: 1 - _swipeController.value,
                  child: Center(
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
                                        image: AssetImage(
                                          model.vacancies[index].imageUrl ?? '',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 20.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                        padding: EdgeInsets.all(8.2),
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    15.verticalSpace,
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(CompanyProfileScreen());
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: blackColor.withOpacity(
                                                    0.2,
                                                  ),
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
                                                  model
                                                          .vacancies[index]
                                                          .imageUrl ??
                                                      '',
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
                                                      style:
                                                          style14M.copyWith(),
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
                                            iconType:
                                                IconType.continueAnimation,
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
                                      spacing: 8.w,
                                      runSpacing: 8.h,
                                      children: List.generate(
                                        model.tagItemsList.length,
                                        (index) {
                                          return CustomIconTextTag(
                                            item: model.tagItemsList[index],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                            jobVacancyModel:
                                                model.vacancies[index],
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
                                          child: Image.asset(
                                            AppAssets.eyeIcon,
                                            scale: 4,
                                          ),
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
                                    15.verticalSpace,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    ).then((_) {
      _swipeController.dispose();
    });
  }

  ///
  ///. header
  ///
  _header(CandidateHomeViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.appLogo2, scale: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //   Image.asset(AppAssets.filter, height: 24, width: 24),
            GestureDetector(
              onTap: () {
                _showFilterBottomSheet(model);
              },
              child: Icon(Icons.filter_alt_rounded),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => CandidateSearchScreen(allVacancies: model.vacancies),
                );
              },
              child: Image.asset(AppAssets.searchIcon, height: 46, width: 46),
            ),
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

  ///
  ///. bottom sheet
  ///
  // Method to show the filter bottom sheet
  void _showFilterBottomSheet(CandidateHomeViewModel model) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            void _selectWorkModality(String modality) {
              setModalState(() {
                selectedWorkModality = modality;
                workModalities.remove(modality);
                workModalities.insert(0, modality);
              });
            }

            void _selectSkill(String skill) {
              setModalState(() {
                if (selectedSkill == skill) {
                  selectedSkill = null;
                  skills.remove(skill);
                  skills.add(skill);
                } else {
                  selectedSkill = skill;
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
                    color: Colors.white,
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
                                style: style24M.copyWith(color: blackColor),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          Text(
                            'Categoría que deseas',
                            style: style16B.copyWith(),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            decoration: authFieldDecoration.copyWith(
                              hintText: 'EJ: Diseño Web',
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                            ),
                            value: selectedCategory, // Use the state variable
                            items:
                                categories.map((String category) {
                                  return DropdownMenuItem<String>(
                                    value: category,
                                    child: Text(category),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setModalState(() {
                                // Update state
                                selectedCategory = newValue;
                              });
                            },
                          ),
                          const SizedBox(height: 20),

                          Text(
                            'Rango de sueldo deseado',
                            style: style16B.copyWith(color: blackColor),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller:
                                      _salaryMinController, // Assign controller
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
                                  controller:
                                      _salaryMaxController, // Assign controller
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
                            style: style16B.copyWith(color: blackColor),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            decoration: authFieldDecoration.copyWith(
                              hintText: '--Selecciona uno--',
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                            ),
                            value:
                                selectedFederalEntity, // Use the state variable
                            items:
                                federalEntities.map((String entity) {
                                  return DropdownMenuItem<String>(
                                    value: entity,
                                    child: Text(entity),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setModalState(() {
                                // Update state
                                selectedFederalEntity = newValue;
                              });
                            },
                          ),
                          const SizedBox(height: 20),

                          Text(
                            'Alcaldía o municipio',
                            style: style16B.copyWith(color: blackColor),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            decoration: authFieldDecoration.copyWith(
                              hintText: 'Selecciona una opción',
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                            ),
                            value:
                                selectedMunicipality, // Use the state variable
                            items:
                                municipalities.map((String municipality) {
                                  return DropdownMenuItem<String>(
                                    value: municipality,
                                    child: Text(municipality),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setModalState(() {
                                // Update state
                                selectedMunicipality = newValue;
                              });
                            },
                          ),
                          const SizedBox(height: 20),

                          Text(
                            'Modalidad de trabajo',
                            style: style16B.copyWith(color: blackColor),
                          ),
                          const SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  workModalities.map((modality) {
                                    final isSelected =
                                        selectedWorkModality == modality;
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: ChoiceChip(
                                        label: Row(
                                          children: [
                                            Icon(
                                              modality == 'Híbrido'
                                                  ? Icons.location_on
                                                  : modality == 'Presencial'
                                                  ? Icons.business_center
                                                  : Icons.home_work,
                                              color:
                                                  isSelected
                                                      ? Colors.white
                                                      : Colors.black,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(modality),
                                          ],
                                        ),
                                        selected: isSelected,
                                        selectedColor: primaryColor,
                                        backgroundColor: Colors.white,
                                        labelStyle: TextStyle(
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),

                                        side: BorderSide(
                                          color:
                                              isSelected
                                                  ? Colors.transparent
                                                  : Colors.grey.shade400,
                                        ),
                                        avatarBorder: Border.all(
                                          color: primaryColor,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        showCheckmark:
                                            false, // Removed checkmark
                                        elevation: 5.0,
                                        // ADJUSTED shadowColor opacity
                                        shadowColor: blackColor.withOpacity(
                                          0.4,
                                        ),
                                        onSelected: (bool selected) {
                                          if (selected) {
                                            _selectWorkModality(modality);
                                          }
                                        },
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ),
                          const SizedBox(height: 20),

                          Text(
                            'Filtrar por habilidades',
                            style: style16B.copyWith(color: blackColor),
                          ),
                          const SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  skills.map((skill) {
                                    final isSelected = selectedSkill == skill;
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: ChoiceChip(
                                        label: Row(
                                          children: [
                                            Icon(
                                              skill == 'Diseño web'
                                                  ? Icons.public
                                                  : skill == 'Diseño gráfico'
                                                  ? Icons.palette
                                                  : Icons.lightbulb_outline,
                                              color:
                                                  isSelected
                                                      ? Colors.white
                                                      : Colors.black,
                                              size: 18,
                                            ),

                                            const SizedBox(width: 4),
                                            Text(skill),
                                          ],
                                        ),
                                        selected: isSelected,
                                        selectedColor: primaryColor,
                                        backgroundColor: Colors.white,
                                        labelStyle: TextStyle(
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),
                                        side: BorderSide(
                                          color:
                                              isSelected
                                                  ? Colors.transparent
                                                  : Colors.grey.shade400,
                                        ),
                                        avatarBorder: Border.all(
                                          color: primaryColor,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        showCheckmark:
                                            false, // Removed checkmark
                                        elevation: 5.0,
                                        // ADJUSTED shadowColor opacity
                                        shadowColor: blackColor.withOpacity(
                                          0.4,
                                        ),
                                        onSelected: (bool selected) {
                                          _selectSkill(skill);
                                        },
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ),
                          const SizedBox(height: 30),

                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    setModalState(() {
                                      // Reset chip selections
                                      selectedWorkModality =
                                          workModalities.isNotEmpty
                                              ? workModalities[0]
                                              : null;
                                      selectedSkill = null;

                                      // Reset dropdowns to their initial/default values
                                      selectedCategory = null;
                                      selectedFederalEntity =
                                          federalEntities[0];
                                      selectedMunicipality = municipalities[0];

                                      // Clear text fields
                                      _salaryMinController.clear();
                                      _salaryMaxController.clear();

                                      // Reset skill order (if they were manipulated)
                                      skills = [
                                        'Diseño web',
                                        'Diseño gráfico',
                                        'UI/UX',
                                        'Front-end',
                                        'Back-end',
                                        'Mobile Development',
                                      ];
                                      // Reset work modality order if it was manipulated
                                      workModalities = [
                                        'Híbrido',
                                        'Presencial',
                                        'Remoto',
                                      ];
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
                                    // Apply filters

                                    model.applyFilters(
                                      category: selectedCategory,
                                      minSalary: _salaryMinController.text,
                                      maxSalary: _salaryMaxController.text,
                                      federalEntity: selectedFederalEntity,
                                      municipality: selectedMunicipality,
                                      workModality: selectedWorkModality,
                                      skill: selectedSkill,
                                    );

                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text(
                                    'Aplicar filtros',
                                    style: TextStyle(color: Colors.white),
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

  ///
  ///
  ///
  ///
}

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
              padding: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Color(0xFF28407B),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  // If the image is large, you might want to constrain its height or wrap it in Flexible
                  Image.asset(
                    vacancyModel.imageUrl ?? AppAssets.menulogo,
                    height: 186, // Example fixed height, adjust as needed
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vacancyModel.jobTitle ?? 'Job Title Null',
                    style: style14M.copyWith(
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines:
                        1, // Prevent text from taking too much vertical space
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
                    children: [
                      Image.asset(
                        AppAssets.payments,
                        scale: 4,
                        color: blackColor,
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
                        AppAssets.location,
                        scale: 4,
                        color: blackColor,
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

_categories({required CandidateHomeViewModel model}) {
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
              color:
                  model.categorySelect == index
                      ? brownColor
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.0, color: brownColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                model.categorySelect == index
                    ? Icon(Icons.cancel_outlined, color: whiteColor, size: 20)
                    : SizedBox(),
                model.categorySelect == index ? 3.horizontalSpace : SizedBox(),
                Text(
                  categries[index],
                  style: style12M.copyWith(
                    color:
                        model.categorySelect == index
                            ? whiteColor
                            : lightBlackColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
