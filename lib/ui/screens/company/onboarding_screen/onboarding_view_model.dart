import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/enums/user_roles.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel {
  // Setting Role
  UserRole _role = UserRole.candidate;
  UserRole get role => _role;

  void selectRole(UserRole newRole) {
    if (_role != newRole) {
      _role = newRole;
      notifyListeners();
    }
  }

  // raw onboarding data (no .tr here)
  final _candidateData = [
    {
      'titleKey': 'candidate_onboard_title_1',
      'descKey': 'candidate_onboard_desc_1',
      'image': AppAssets.obCandidato1,
      'sizedBoxHeight': 280.0,
      'imageWidth': 280.0,
      'imageHeight': 202.0,
    },
    {
      'titleKey': 'candidate_onboard_title_2',
      'descKey': 'candidate_onboard_desc_2',
      'image': AppAssets.obCandidato2,
      'sizedBoxHeight': 280.0,
      'imageWidth': 280.0,
      'imageHeight': 194.0,
    },
    {
      'titleKey': 'candidate_onboard_title_3',
      'descKey': 'candidate_onboard_desc_3',
      'image': AppAssets.obCandidato3,
      'sizedBoxHeight': 280.0,
      'imageWidth': 226.84,
      'imageHeight': 215.25,
    },
    {
      'titleKey': 'candidate_onboard_title_4',
      'descKey': 'candidate_onboard_desc_4',
      'image': AppAssets.obCandidato4,
      'sizedBoxHeight': 280.0,
      'imageWidth': 136.0,
      'imageHeight': 198.0,
    },
  ];

  final _recruiterData = [
    {
      'titleKey': 'recruiter_onboard_title_1',
      'descKey': 'recruiter_onboard_desc_1',
      'image': AppAssets.obReclutador1,
      'sizedBoxHeight': 280,
      'imageWidth': 321,
      'imageHeight': 214,
    },
    {
      'titleKey': 'recruiter_onboard_title_2',
      'descKey': 'recruiter_onboard_desc_2',
      'image': AppAssets.obReclutador2,
      'sizedBoxHeight': 280,
      'imageWidth': 253,
      'imageHeight': 252,
    },
    {
      'titleKey': 'recruiter_onboard_title_3',
      'descKey': 'recruiter_onboard_desc_3',
      'image': AppAssets.obReclutador3,
      'sizedBoxHeight': 280,
      'imageWidth': 252,
      'imageHeight': 252,
    },
    {
      'titleKey': 'recruiter_onboard_title_4',
      'descKey': 'recruiter_onboard_desc_4',
      'image': AppAssets.obReclutador4,
      'sizedBoxHeight': 280,
      'imageWidth': 252,
      'imageHeight': 227,
    },
  ];

  List<Map<String, dynamic>> get pagesData =>
      _role == UserRole.candidate ? _candidateData : _recruiterData;
}
