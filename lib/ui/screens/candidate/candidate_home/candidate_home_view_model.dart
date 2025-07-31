// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';

class CandidateHomeViewModel extends BaseViewModel {
  int categorySelect = 0;
  bool dropDown1Error = false;
  bool dropDown2Error = false;
  bool dropDown3Error = false;

  bool _dropDown1 = false;
  bool _dropDown2 = false;
  bool _dropDown3 = false;

  bool get dropDown1 => _dropDown1;
  bool get dropDown2 => _dropDown2;
  bool get dropDown3 => _dropDown3;

  String _dropDownText1 = '';
  String _dropDownText2 = '';
  String _dropDownText3 = '';
  String _dropDownText4 = '';
  String _dropDownText5 = '';

  String get dropDownText1 => _dropDownText1;
  String get dropDownText2 => _dropDownText2;
  String get dropDownText3 => _dropDownText3;
  String get dropDownText4 => _dropDownText4;
  String get dropDownText5 => _dropDownText5;

  List<String> categories = [
    'Diseño Web',
    'Diseño Gráfico',
    'Desarrollo Mobile',
    'Marketing Digital',
  ];

  toggleDropDown1() {
    _dropDown1 = !_dropDown1;
    notifyListeners();
  }

  toggleDropDown2() {
    _dropDown2 = !_dropDown2;
    notifyListeners();
  }

  toggleDropDown3() {
    _dropDown3 = !_dropDown3;
    notifyListeners();
  }

  setDropDownText1(String value) {
    _dropDownText1 = value;
    notifyListeners();
  }

  onClickCategory(index) {
    categorySelect = index;
    notifyListeners();
  }

  final List<TagItem> tagItemsList = [
    TagItem('🖥️ Creación de contenido'),
    TagItem('💻 Google Analytics'),
    TagItem('💻 Marketing Digital'),
  ];

  ///
  ///. filtering logics
  ///

  List<JobVacancyModel> filteredVacancies = [];
  bool filtersApplied = false;

  void applyFilters({
    String? category,
    String? minSalary,
    String? maxSalary,
    String? federalEntity,
    String? municipality,
    String? workModality,
    String? skill,
  }) {
    filteredVacancies =
        vacancies.where((vacancy) {
          // Salary filter - handle string comparison
          bool salaryMatch = true;
          if (minSalary != null && minSalary.isNotEmpty ||
              maxSalary != null && maxSalary.isNotEmpty) {
            // Convert filter values to numbers safely
            final filterMin = double.tryParse(minSalary ?? '0') ?? 0;
            final filterMax = double.tryParse(maxSalary ?? '999999') ?? 999999;

            // Convert vacancy values to numbers safely
            final vacancyMin = double.tryParse(vacancy.minSalary ?? '0') ?? 0;
            final vacancyMax = double.tryParse(vacancy.maxSalary ?? '0') ?? 0;

            // Check if vacancy range overlaps with filter range
            salaryMatch = vacancyMax >= filterMin && vacancyMin <= filterMax;
          }

          // Location filters
          bool locationMatch = true;
          if (federalEntity != null && federalEntity != '--Selecciona uno--') {
            locationMatch = (vacancy.state?.toLowerCase() ?? '').contains(
              federalEntity.toLowerCase(),
            );
          }
          if (municipality != null && municipality != 'Selecciona una opción') {
            locationMatch =
                locationMatch &&
                (vacancy.municipality?.toLowerCase() ?? '').contains(
                  municipality.toLowerCase(),
                );
          }

          // Work modality filter
          bool modalityMatch = true;
          if (workModality != null) {
            modalityMatch = (vacancy.workMode?.toLowerCase() ?? '').contains(
              workModality.toLowerCase(),
            );
          }

          // Skill filter
          bool skillMatch = true;
          if (skill != null) {
            skillMatch = (vacancy.technicalSkills?.toLowerCase() ?? '')
                .contains(skill.toLowerCase());
          }

          return salaryMatch && locationMatch && modalityMatch && skillMatch;
        }).toList();

    filtersApplied = true;
    notifyListeners();
  }

  ///
  ///
  ///
  final List<JobVacancyModel> vacancies = [
    // Remote job in California with Flutter skills (matches first category)
    JobVacancyModel(
      jobTitle: 'Marketing intern',
      jobSubTitle: 'Viajes Premium',
      imageUrl: AppAssets.cImg06,
      state: 'California',
      municipality: 'San Francisco',
      neighborhood: 'SOMA',
      workingHours: '8',
      jobType: 'Tiempo completo',
      startDate: '2025-08-01',
      endDate: '2025-12-31',
      workMode: 'Remote',
      workSchedule: 'Flexible',
      canStartImmediately: 'Yes',
      requiresExperience: '2+ Years',
      workDays: 'Monday to Friday',
      minSalary: '5000',
      maxSalary: '8000',
      paymentFrequency: 'Monthly',
      benefits: 'Health Insurance, Remote Work',
      softSkills: 'Teamwork, Communication',
      technicalSkills: 'Flutter, Dart, Mobile Development',
      maxSkillSelections: '5',
      jobDescription: 'Flutter developer needed for mobile app development.',
      location: 'Remote',
      jobPostedTime: '2025-07-01',
      matches: '90%',
    ),

    JobVacancyModel(
      jobTitle: 'Coordinador de Marketing',
      jobSubTitle: 'Rappi',
      imageUrl: AppAssets.cImg2,
      state: 'New York',
      municipality: 'Brooklyn',
      neighborhood: 'Williamsburg',
      workingHours: '8',
      jobType: 'Tiempo completo',
      startDate: '2025-07-15',
      endDate: '2025-10-15',
      workMode: 'On-Site',
      workSchedule: '9 AM - 6 PM',
      canStartImmediately: 'No',
      requiresExperience: '1+ Years',
      workDays: 'Monday to Friday',
      minSalary: '4000',
      maxSalary: '6000',
      paymentFrequency: 'Biweekly',
      benefits: 'Creative Environment, Equipment Provided',
      softSkills: 'Creativity, Attention to Detail',
      technicalSkills: 'Adobe Photoshop, Illustrator, UI/UX',
      maxSkillSelections: '4',
      jobDescription: 'Graphic designer for marketing materials and branding.',
      location: 'Brooklyn, NY',
      jobPostedTime: '2025-06-25',
      matches: '85%',
    ),
    JobVacancyModel(
      jobTitle: 'Flutter Developer',
      jobSubTitle: 'MVVM',
      imageUrl: AppAssets.cImg07,
      state: 'California',
      municipality: 'San Francisco',
      neighborhood: 'SOMA',
      workingHours: '8',
      jobType: 'Tiempo completo',
      startDate: '2025-08-01',
      endDate: '2025-12-31',
      workMode: 'Remote',
      workSchedule: 'Flexible',
      canStartImmediately: 'Yes',
      requiresExperience: '2+ Years',
      workDays: 'Monday to Friday',
      minSalary: '5000',
      maxSalary: '8000',
      paymentFrequency: 'Monthly',
      benefits: 'Health Insurance, Remote Work',
      softSkills: 'Teamwork, Communication',
      technicalSkills: 'Flutter, Dart, Mobile Development',
      maxSkillSelections: '5',
      jobDescription: 'Flutter developer needed for mobile app development.',
      location: 'Remote',
      jobPostedTime: '2025-07-01',
      matches: '90%',
    ),

    // Hybrid Data Analyst in Texas (matches third category)
    JobVacancyModel(
      jobTitle: 'Especialista en Marketing Digital',
      jobSubTitle: 'BBVA',
      imageUrl: AppAssets.cImg03,
      state: 'Texas',
      municipality: 'Austin',
      neighborhood: 'Downtown',
      workingHours: '7',
      jobType: 'Tiempo completo',
      startDate: '2025-09-01',
      endDate: '2026-03-01',
      workMode: 'Hybrid',
      workSchedule: 'Flexible',
      canStartImmediately: 'Yes',
      requiresExperience: 'No',
      workDays: 'Monday to Friday',
      minSalary: '3000',
      maxSalary: '5000',
      paymentFrequency: 'Monthly',
      benefits: 'Training, Career Growth',
      softSkills: 'Analytical Thinking, Problem Solving',
      technicalSkills: 'SQL, Python, Excel, Data Visualization',
      maxSkillSelections: '6',
      jobDescription:
          'Entry-level data analyst position with training provided.',
      location: 'Austin, TX',
      jobPostedTime: '2025-07-02',
      matches: '88%',
    ),

    // Digital Marketing in Jalisco (matches fourth category)
    JobVacancyModel(
      jobTitle: 'Empaquetador',
      jobSubTitle: 'Pepsi',
      imageUrl: AppAssets.cImg4,
      state: 'Jalisco',
      municipality: 'Guadalajara',
      neighborhood: 'Centro',
      workingHours: '6',
      jobType: 'tiempo parcial',
      startDate: '2025-09-01',
      endDate: '2026-03-01',
      workMode: 'Remote',
      workSchedule: 'Flexible',
      canStartImmediately: 'Yes',
      requiresExperience: 'No',
      workDays: 'Monday to Friday',
      minSalary: '2000',
      maxSalary: '4000',
      paymentFrequency: 'Monthly',
      benefits: 'Flexible Hours, Creative Freedom',
      softSkills: 'Creativity, Communication',
      technicalSkills: 'Social Media, SEO, Content Creation',
      maxSkillSelections: '5',
      jobDescription: 'Manage social media and digital marketing campaigns.',
      location: 'Remote',
      jobPostedTime: '2025-07-02',
      matches: '92%',
    ),

    // Part-time Frontend Developer in Nuevo León
    JobVacancyModel(
      jobTitle: 'Frontend Developer',
      jobSubTitle: 'React Specialist',
      imageUrl: AppAssets.cImg1,
      state: 'Nuevo León',
      municipality: 'Monterrey',
      neighborhood: 'San Pedro',
      workingHours: '6',
      jobType: 'tiempo parcial',
      startDate: '2025-08-15',
      endDate: '2025-12-15',
      workMode: 'Hybrid',
      workSchedule: 'Flexible',
      canStartImmediately: 'Yes',
      requiresExperience: '1+ Years',
      workDays: 'Monday to Friday',
      minSalary: '3500',
      maxSalary: '5500',
      paymentFrequency: 'Monthly',
      benefits: 'Flexible Schedule, Tech Equipment',
      softSkills: 'Problem Solving, Teamwork',
      technicalSkills: 'React, JavaScript, HTML/CSS',
      maxSkillSelections: '5',
      jobDescription: 'Part-time frontend developer for web applications.',
      location: 'Monterrey, NL',
      jobPostedTime: '2025-07-10',
      matches: '87%',
    ),

    // On-site Backend Developer in Ciudad de México
    JobVacancyModel(
      jobTitle: 'Backend Developer',
      jobSubTitle: 'Node.js Expert',
      imageUrl: AppAssets.cImg05,
      state: 'Ciudad de México',
      municipality: 'Benito Juárez',
      neighborhood: 'Nápoles',
      workingHours: '8',
      jobType: 'Tiempo completo',
      startDate: '2025-08-01',
      endDate: '2025-12-31',
      workMode: 'On-Site',
      workSchedule: '9 AM - 6 PM',
      canStartImmediately: 'No',
      requiresExperience: '3+ Years',
      workDays: 'Monday to Friday',
      minSalary: '1000',
      maxSalary: '2000',
      paymentFrequency: 'Monthly',
      benefits: 'Health Insurance, Bonuses',
      softSkills: 'Problem Solving, Communication',
      technicalSkills: 'Node.js, MongoDB, API Development',
      maxSkillSelections: '6',
      jobDescription: 'Senior backend developer for enterprise applications.',
      location: 'Mexico City',
      jobPostedTime: '2025-07-05',
      matches: '95%',
    ),
  ];
}

class FilterState {
  bool dropDown1 = false; // For category
  bool dropDown2 = false; // For federal entity
  bool dropDown3 = false; // For municipality

  bool dropDown1Error = false;

  bool dropDown2Error = false;
  bool dropDown3Error = false;
  String dropDownText1 = '';
  String dropDownText2 = '';
  String dropDownText3 = '';

  String? selectedCategory;
  String? selectedFederalEntity;
  String? selectedMunicipality;
  String? selectedWorkModality;
  String? selectedSkill;
  List<String> selectedSkills = []; // New property for multiple selections

  final TextEditingController salaryMinController = TextEditingController();
  final TextEditingController salaryMaxController = TextEditingController();

  void toggleDropDown1() {
    dropDown1 = !dropDown1;
  }

  void toggleDropDown2() {
    dropDown2 = !dropDown2;
  }

  void toggleDropDown3() {
    dropDown3 = !dropDown3;
  }

  void setDropDownText1(String value) {
    dropDownText1 = value;
  }

  void setDropDownText2(String value) {
    dropDownText2 = value;
  }

  void setDropDownText3(String value) {
    dropDownText3 = value;
  }
}
