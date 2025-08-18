import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/chat_items.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class CandidateChatViewModel extends BaseViewModel {
  final List<String> filters = [
    'Todos',
    'Diseño web',
    'Becario programación',
    'Ventas',
  ];

  ///
  ///. for searching
  ///
  List<CandidateChatItem> searchChats(String query) {
    if (query.isEmpty) return allChats;
    return allChats
        .where(
          (chat) =>
              chat.name.toLowerCase().contains(query.toLowerCase()) ||
              chat.role.toLowerCase().contains(query.toLowerCase()) ||
              (chat.companyName?.toLowerCase().contains(query.toLowerCase()) ??
                  false),
        )
        .toList();
  }

  CandidateChatItem? _chatToAnimate;
  bool _isAnimatingDeletion = false;

  void startAutoSwipeAnimation(CandidateChatItem chat) {
    _chatToAnimate = chat;
    _isAnimatingDeletion = true;
    notifyListeners();

    // After animation completes, remove the chat
    Future.delayed(Duration(seconds: 1), () {
      _isAnimatingDeletion = false;
      notifyListeners();
    });
  }

  bool shouldAnimateDeletion(CandidateChatItem chat) {
    return _isAnimatingDeletion && _chatToAnimate?.id == chat.id;
  }

  String selectedFilter = 'Todos';

  void deleteChat(CandidateChatItem chatToDelete) {
    // Store the chat to be animated before removal
    _chatToAnimate = chatToDelete;
    _isAnimatingDeletion = true;
    notifyListeners();

    // Remove the chat after a small delay to allow the animation to start
    Future.delayed(const Duration(milliseconds: 1000), () {
      allChats.removeWhere((chat) => chat.id == chatToDelete.id);
      _isAnimatingDeletion = false;
      _chatToAnimate = null;
      notifyListeners();
    });
  }

  final List<CandidateChatItem> allChats = [
    CandidateChatItem(
      id: 1,
      name: 'Shayan ZAhid',
      role: 'Diseñador Web',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 'En proceso',
      avatarUrl: AppAssets.img,
      isOnline: false,
      companyName: 'Puma',
      state: 'Coyoacán, CDMX ',
    ),
    CandidateChatItem(
      id: 2,
      name: 'Sanan ZAhid',
      role: 'Becario en Programación',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 'No seleccionado',
      avatarUrl: AppAssets.img2,
      isOnline: true,
      companyName: 'Puma',
      state: 'Coyoacán, CDMX',
    ),
    CandidateChatItem(
      id: 3,
      name: 'Jorge Pérez',
      role: 'Programador HTML',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 'Seleccionado',
      avatarUrl: AppAssets.img,
      isOnline: false,
      companyName: 'Puma',
      state: 'Coyoacán, CDMX',
    ),
    CandidateChatItem(
      id: 4,
      name: 'Jorge Pérez',
      role: 'Diseñador Web',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 'En proceso',
      avatarUrl: AppAssets.img,
      isOnline: false,
      companyName: 'Puma',
      state: 'Coyoacán, CDMX',
    ),
    CandidateChatItem(
      id: 5,
      name: 'Jorge Pérez',
      role: 'Becario en ventas',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 'Seleccionado',
      avatarUrl: AppAssets.img2,
      isOnline: true,
      companyName: 'Puma',
      state: 'Coyoacán, CDMX',
    ),
    CandidateChatItem(
      id: 6,
      name: 'Jorge Pérez',
      role: 'Becario en Programación',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 'No seleccionado',
      avatarUrl: AppAssets.img2,
      isOnline: true,
      companyName: 'Puma',
      state: 'Coyoacán, CDMX',
    ),
  ];

  // Getter returns filtered list based on selectedFilter
  // List<CandidateChatItem> get chats {
  //   if (selectedFilter == 'Todos') return _allChats;

  //   return _allChats.where((c) {
  //     final lower = c.role.toLowerCase();
  //     final filter = selectedFilter.toLowerCase();
  //     return lower.contains(filter);
  //   }).toList();
  // }

  // Called by the UI when a filter is tapped
  void onClick(String f) {
    selectedFilter = f;
    notifyListeners();
  }

  ///
  /// jobs list
  ///
  final List<JobVacancyModel> vacancies = [
    // Remote job in California with Flutter skills (matches first category)
    JobVacancyModel(
      companyName: "puma",
      jobTitle: 'Marketing intern',
      jobSubTitle: 'Viajes Premium',
      category: 'Arte y Diseño', // ⬅️ MATCHES categoryList
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
      companyName: ' BrightCodeLan',
      jobTitle: 'Coordinador deco, Marketing',
      jobSubTitle: 'Rappi',
      category: 'Arte y Diseño', // ⬅️ MATCHES categoryList
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
      companyName: 'culyte',
      jobTitle: 'Flutter Developer',
      jobSubTitle: 'MVVM',
      category: 'Programación y Tecnología',
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
      companyName: 'TechPioneers',
      jobTitle: 'Especialista en Marketing Digital',
      jobSubTitle: 'BBVA',
      imageUrl: AppAssets.cImg03,
      state: 'Texas',
      category: 'Marketing y Ventas', // ⬅️ MATCHES categoryList
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
      companyName: 'TechPioneers',
      jobTitle: 'Empaquetador',
      jobSubTitle: 'Pepsi',
      imageUrl: AppAssets.cImg4,
      category: 'Programación y Tecnología',
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
      companyName: 'qwertyui',
      jobTitle: 'Frontend Developer',
      jobSubTitle: 'React Specialist',
      imageUrl: AppAssets.cImg1,
      category: 'Programación y Tecnología',
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
      companyName: 'qwertyu',
      jobTitle: 'Backend Developer',
      jobSubTitle: 'Node.js Expert',
      imageUrl: AppAssets.cImg05,
      category: 'Marketing y Ventas', // ⬅️ MATCHES categoryList
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

  ///
  ///. fir one to one conversation
  ///
  // In your CandidateChatViewModel (or the UI part of the main chat list)
}
/*
ackage:talenty_app/core/model/company/your_vacancies.dart';

import 'your_vacancies.dart';

class ChatItem {
  final String name;
  final String role;
  final String preview;
  final String timestamp;
  final int unreadCount;
  final String avatarUrl;
  final bool isOnline;

  ChatItem({
    required this.name,
    required this.role,
    required this.preview,
    required this.timestamp,
    required this.unreadCount,
    required this.avatarUrl,
    required this.isOnline,
  });
}

class CandidateChatItem extends JobVacancyModel {
  final String name;
  final String role;
  final String preview;
  final String timestamp;
  final String unreadCount;
  final String avatarUrl;
  final bool isOnline;

  CandidateChatItem({
    required this.name,
    required this.role,
    required this.preview,
    required this.timestamp,
    required this.unreadCount,
    required this.avatarUrl,
    required this.isOnline,
    String? companyName,
    String? state,
  }) : super(companyName: companyName, state: state);
}
*/