import 'package:get/get_utils/get_utils.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  int categorySelect = 0;

  onClickCategory(index) {
    categorySelect = index;
    notifyListeners();
  }

  final List<VacancyModel> vacancies = [
    VacancyModel(
      title:'Your_vacancies'.tr,
      role: "web_design".tr,
      imageUrl: AppAssets.img,
      startDate:"start_date".tr,
      endDate:   "June/30/2025".tr,
      matches: 14,
      status: "active_vacancy".tr,
    ),
    VacancyModel(
      title:'Your_vacancies'.tr,
      role: "web_design".tr,
      imageUrl: AppAssets.img,
      startDate:"start_date".tr,
      endDate:   "June/30/2025".tr,
      matches: 14,
      status: 'Vacante Vencida',
    ),
    VacancyModel(
      title:'Your_vacancies'.tr,
      role: "web_design".tr,
      imageUrl: AppAssets.img,
      startDate:"start_date".tr,
      endDate:   "June/30/2025".tr,
      matches: 14,
      status: "active_vacancy".tr,
    ),
  ];
}
