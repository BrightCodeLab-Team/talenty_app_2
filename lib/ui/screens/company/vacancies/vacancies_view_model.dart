import 'package:get/utils.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class VacanciesViewModel extends BaseViewModel {
  List<VacancyModel> vacancies = [
    VacancyModel(
      title:   "jessica_gonzalez".tr,
      role: 'Human Resources'.tr,
      imageUrl: AppAssets.img2,
      description:
            'professional'.tr,
      startDate:"start_date".tr,
      endDate:  "June/30/2025".tr,
      status: "active_vacancy".tr,
      matches: 20,
      salaryRange:'salary'.tr,
      location: "Remoto".tr,
    ),
    VacancyModel(
      title:  "awais".tr,
      role: 'developer'.tr,
      imageUrl: AppAssets.img2,
      description:
          'We are looking for a Flutter developer with experience building scalable mobile apps...'.tr,
      startDate: "Abril/01/2025".tr,
      endDate:"july".tr,
      status:"Vacancy Expired".tr,

      matches: 15,
      salaryRange: 'salary'.tr,
      location: "Hybrid".tr,
    ),
  ];
}
