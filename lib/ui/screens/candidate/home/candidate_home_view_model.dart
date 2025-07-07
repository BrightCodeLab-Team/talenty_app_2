import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_job_detail/company_job_detail_screen.dart';

class CandidateHomeViewModel extends BaseViewModel {
  int categorySelect = 0;

  onClickCategory(index) {
    categorySelect = index;
    notifyListeners();
  }

  final List<TagItem> tagItemsList = [
    TagItem('💪 Resiliencia'),
    TagItem('💡 Pensamiento crítico'),
    TagItem('🧠 Resolución de problemas'),
    TagItem('🕊️ Empatía'),
    TagItem('🗣️ Comunicación asertiva'),
    TagItem('🧘‍️ Manejo del estrés'),
    TagItem('🚀 Proactividad'),
    TagItem('🤝 Trabajo en equipo'),
    TagItem('💻 Uso de la Inteligencia Artificial'),
    TagItem('⏰ Gestión del tiempo'),
  ];

  ///
  ///
  ///
  // final List<JobVacancyModel> vacancies = [
  //   JobVacancyModel(
  //     location: 'Coyoacan, CDMX. XXXXXXXXXXXXX',
  //     // Basic Info
  //     jobTitle: "Marketing Intern r nhstrsn6t nst emytdebr htt jud67 u7 u",
  //     jobSubTitle: 'Viajes Premium nnnnnnnnnnnnn',
  //     state: "Mexico City",
  //     municipality: "Coyoacán",
  //     neighborhood: "Romero de Terreros",

  //     // Job Info
  //     startDate: '',
  //     endDate: '',
  //     workMode: '',
  //     workSchedule: '',

  //     // Employment Details
  //     canStartImmediately: '',
  //     requiresExperience: '',
  //     workDays: '',

  //     // Salary & Benefits
  //     minSalary: '10000.000000000',
  //     maxSalary: '15000.0000000000',
  //     paymentFrequency: '',
  //     benefits: 'qqq,qqqq,www,eee,',

  //     // Skills
  //     softSkills: '',
  //     technicalSkills: '',

  //     // Description
  //     jobDescription: "We seek a creative designer with experience in...",
  //   ),
  //   JobVacancyModel(
  //     // Basic Info
  //     jobTitle: "Graphic Designer",
  //     jobSubTitle: 'intern',
  //     state: "Mexico City",
  //     municipality: "Coyoacán",
  //     neighborhood: "Romero de Terreros",

  //     // Job Info
  //     startDate: '',
  //     endDate: '',
  //     workMode: '',
  //     workSchedule: '',

  //     // Employment Details
  //     canStartImmediately: '',
  //     requiresExperience: '',
  //     workDays: '',

  //     // Salary & Benefits
  //     minSalary: '10000.0',
  //     maxSalary: '15000.0',
  //     paymentFrequency: '',
  //     benefits: 'qqq,qqqq,www,eee,',

  //     // Skills
  //     softSkills: '',
  //     technicalSkills: '',

  //     // Description
  //     jobDescription: "We seek a creative designer with experience in...",
  //   ),
  //   JobVacancyModel(
  //     // Basic Info
  //     jobTitle: "Graphic Designer",
  //     jobSubTitle: 'intern',
  //     state: "Mexico City",
  //     municipality: "Coyoacán",
  //     neighborhood: "Romero de Terreros",

  //     // Job Info
  //     startDate: '',
  //     endDate: '',
  //     workMode: '',
  //     workSchedule: '',

  //     // Employment Details
  //     canStartImmediately: '',
  //     requiresExperience: '',
  //     workDays: '',

  //     // Salary & Benefits
  //     minSalary: '10000.0',
  //     maxSalary: '15000.0',
  //     paymentFrequency: '',
  //     benefits: 'qqq,qqqq,www,eee,',

  //     // Skills
  //     softSkills: '',
  //     technicalSkills: '',

  //     // Description
  //     jobDescription: "We seek a creative designer with experience in...",
  //   ),
  // ];

  final List<JobVacancyModel> vacancies = [
    JobVacancyModel(
      jobTitle: 'Software Engineer',
      jobSubTitle: 'Frontend Specialist',
      imageUrl: AppAssets.img,
      state: 'California',
      municipality: 'San Francisco',
      neighborhood: 'SOMA',
      workingHours: '10',
      jobType: 'Tiempo completo',

      startDate: '2025-08-01',
      endDate: '2025-12-31',
      workMode: 'Remote',
      workSchedule: '9 AM - 5 PM',

      canStartImmediately: 'Yes',
      requiresExperience: '2+ Years',
      workDays: 'Monday to Friday',

      minSalary: '70000',
      maxSalary: '90000',
      paymentFrequency: 'Monthly',
      benefits: 'Health Insurance, Remote Work, Paid Leave',

      softSkills: 'Teamwork, Communication',
      technicalSkills: 'Flutter, Dart, Git',
      maxSkillSelections: '5',

      jobDescription:
          'We are looking for a Flutter developer to work on our mobile apps.',
      location: 'Remote',
      jobPostedTime: '2025-07-01',
      matches: '85%',
    ),
    JobVacancyModel(
      jobTitle: 'Graphic Designer',
      jobSubTitle: 'Brand & UI Specialist',
      imageUrl: AppAssets.menulogo,
      state: 'New York',
      municipality: 'Brooklyn',
      neighborhood: 'Williamsburg',
      workingHours: '5',
      jobType: 'tiempo parcial',

      startDate: '2025-07-15',
      endDate: '2025-10-15',
      workMode: 'On-Site',
      workSchedule: '10 AM - 6 PM',

      canStartImmediately: 'No',
      requiresExperience: '1+ Years',
      workDays: 'Tuesday to Saturday',

      minSalary: '40000',
      maxSalary: '55000',
      paymentFrequency: 'Biweekly',
      benefits: 'Meal Coupons, Work Equipment, Annual Bonus',

      softSkills: 'Creativity, Time Management',
      technicalSkills: 'Adobe XD, Figma, Photoshop',
      maxSkillSelections: '4',

      jobDescription:
          'Creative designer needed for branding and UI/UX projects.',
      location: 'Brooklyn, NY',
      jobPostedTime: '2025-06-25',
      matches: '78%',
    ),
    JobVacancyModel(
      jobTitle: 'Data Analyst',
      jobSubTitle: 'Entry-Level Role',
      imageUrl: AppAssets.img2,
      state: 'Texas',
      municipality: 'Austin',
      neighborhood: 'Downtown',

      startDate: '2025-09-01',
      endDate: '2026-03-01',
      workMode: 'Hybrid',
      workSchedule: 'Flexible',
      workingHours: '6',

      jobType: 'tiempo parcial',

      canStartImmediately: 'Yes',
      requiresExperience: 'No',
      workDays: 'Monday to Friday',

      minSalary: '50000',
      maxSalary: '65000',
      paymentFrequency: 'Monthly',
      benefits: 'Flexible Hours, Training, Gym Membership',

      softSkills: 'Analytical Thinking, Curiosity',
      technicalSkills: 'SQL, Python, Excel',
      maxSkillSelections: '6',

      jobDescription:
          'Assist in data gathering, analysis, and reporting tasks.',
      location: 'Austin, TX',
      jobPostedTime: '2025-07-02',
      matches: '91%',
    ),
    JobVacancyModel(
      jobTitle: 'digital Marketing',
      jobSubTitle: 'Entry-Level Role',
      imageUrl: AppAssets.img2,
      state: 'Texas',
      municipality: 'Austin',
      neighborhood: 'Downtown',

      startDate: '2025-09-01',
      endDate: '2026-03-01',
      workMode: 'Hybrid',
      workSchedule: 'Flexible',
      workingHours: '6',

      jobType: 'tiempo parcial',

      canStartImmediately: 'Yes',
      requiresExperience: 'No',
      workDays: 'Monday to Friday',

      minSalary: '50000',
      maxSalary: '65000',
      paymentFrequency: 'Monthly',
      benefits: 'Flexible Hours, Training, Gym Membership',

      softSkills: 'Analytical Thinking, Curiosity',
      technicalSkills: 'SQL, Python, Excel',
      maxSkillSelections: '6',

      jobDescription:
          'Assist in data gathering, analysis, and reporting tasks.',
      location: 'Austin, TX',
      jobPostedTime: '2025-07-02',
      matches: '91%',
    ),
  ];
}
