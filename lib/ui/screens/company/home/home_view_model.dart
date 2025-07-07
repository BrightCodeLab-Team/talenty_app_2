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
      title: "Tus Vacantes",
      role: "Diseñador Web",
      imageUrl: AppAssets.img,
      startDate: "Marzo/30/2025",
      endDate: "Junio/30/2025",
      matches: 14,
      status: 'Vacante Activa',
    ),
    VacancyModel(
      title: "Tus Vacantes",
      role: "Diseñador Web",
      imageUrl: AppAssets.img,
      startDate: "Marzo/30/2025",
      endDate: "Junio/30/2025",
      matches: 14,
      status: 'Vacante Vencida',
    ),
    VacancyModel(
      title: "Tus Vacantes",
      role: "Diseñador Web",
      imageUrl: AppAssets.img,
      startDate: "Marzo/30/2025",
      endDate: "Junio/30/2025",
      matches: 14,
      status: 'Vacante Activa',
    ),
  ];
}
