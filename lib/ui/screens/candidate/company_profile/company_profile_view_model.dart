import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class CompanyProfileViewModel extends BaseViewModel {
  List<JobVacancyModel> companyJobsVacancyList = [
    JobVacancyModel(
      imageUrl: AppAssets.menulogo,
      jobTitle: 'Diseñador Web',
      jobSubTitle: 'Viajes Premium',
      location: 'Coyoacán, CDMX',
      jobDescription:
          'Buscamos un diseñador web creativo y detallista para diseñar interfaces atractivas, funcionales y ...',
      jobPostedTime: 'Hace 2 semanas',
      matches: '20',
      minSalary: '1000.0',
      maxSalary: '2000.0',
      state: 'Presencial',
    ),
    JobVacancyModel(
      imageUrl: AppAssets.menulogo,
      jobTitle: 'Diseñador Web',
      jobSubTitle: 'Viajes Premium',
      location: 'Coyoacán, CDMX',
      jobDescription:
          'Buscamos un diseñador web creativo y detallista para diseñar interfaces atractivas, funcionales y ...',
      jobPostedTime: 'Hace 2 semanas',
      matches: '20',
      minSalary: '1000.0',
      maxSalary: '2000.0',
      state: 'Presencial',
    ),
    JobVacancyModel(
      imageUrl: AppAssets.menulogo,
      jobTitle: 'Diseñador Web',
      jobSubTitle: 'Viajes Premium',
      location: 'Coyoacán, CDMX',
      jobDescription:
          'Buscamos un diseñador web creativo y detallista para diseñar interfaces atractivas, funcionales y ...',
      jobPostedTime: 'Hace 2 semanas',
      matches: '20',
      minSalary: '1000.0',
      maxSalary: '2000.0',
      state: 'Presencial',
    ),
    JobVacancyModel(
      imageUrl: AppAssets.menulogo,
      jobTitle: 'Diseñador Web',
      jobSubTitle: 'Viajes Premium',
      location: 'Coyoacán, CDMX',
      jobDescription:
          'Buscamos un diseñador web creativo y detallista para diseñar interfaces atractivas, funcionales y ...',
      jobPostedTime: 'Hace 2 semanas',
      matches: '20',
      minSalary: '1000.0',
      maxSalary: '2000.0',
      state: 'Presencial',
    ),
  ];
}
/*
  final String? imageUrl;
  final String? jobTitle;
  final String? jobSubTitle;
  final String? location;
  final String? description;
  final String? postedTime;
  final String? matches;
  final String? minSalary;
  final String? maxSalary;
  final String? state;
  */