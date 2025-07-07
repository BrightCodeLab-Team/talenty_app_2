import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class VacanciesViewModel extends BaseViewModel {
  List<VacancyModel> vacancies = [
    VacancyModel(
      title: "Jessica Gonzalez",
      role: "Recursos Humanos",
      imageUrl: AppAssets.img2,
      description:
          "Soy profesional en Recursos Humanos con experiencia en reclutamiento y desarrollo...",
      startDate: "Marzo/30/2025",
      endDate: "Junio/30/2025",
      status: "Vacante Activa",
      matches: 20,
      salaryRange: "8,000 - 10,000",
      location: "Remoto",
    ),
    VacancyModel(
      title: "Awais Khan",
      role: "Flutter Developer",
      imageUrl: AppAssets.img2,
      description:
          "Buscamos un desarrollador Flutter con experiencia en apps móviles escalables...",
      startDate: "Abril/01/2025",
      endDate: "Julio/01/2025",
      status: "Vacante Vencida",

      matches: 15,
      salaryRange: "10,000 - 12,000",
      location: "Híbrido",
    ),
  ];
}
