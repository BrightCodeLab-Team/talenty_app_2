// ignore_for_file: prefer_final_fields

import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_44_percent/register_44_screen.dart';

class CandidateRegister44PercentViewModel extends BaseViewModel {
  List<Talent> _talents = [];
  List<Talent> get talents => _talents;

  List<Talent> _selectedTalents = [];
  List<Talent> get selectedTalents => _selectedTalents;

  bool get isAnyTalentSelected => _selectedTalents.isNotEmpty;

  CandidateRegister44PercentViewModel() {
    _talents = [
      Talent(
        name: 'Analítico',
        imageUrl: AppAssets.searchIcon44,
        selectedImageUrl: 'assets/images/analitico_selected.png',
      ),
      Talent(
        name: 'Autoconfianza',
        imageUrl: AppAssets.likeIcon,
        selectedImageUrl: 'assets/images/autoconfianza_selected.png',
      ),
      Talent(
        name: 'Armonía',
        imageUrl: AppAssets.sadEmojiIcon,
        selectedImageUrl: 'assets/images/armonia_selected.png',
      ),
      Talent(
        name: 'Carisma',
        imageUrl: AppAssets.laughEmojiIcon,
        selectedImageUrl: 'assets/images/carisma_selected.png',
      ),
      Talent(
        name: 'Competitivo',
        imageUrl: AppAssets.trophyIcon,
        selectedImageUrl: 'assets/images/competitivo_selected.png',
      ),
      Talent(
        name: 'Creencia',
        imageUrl: AppAssets.idkIcon,
        selectedImageUrl: 'assets/images/creencia_selected.png',
      ),
      Talent(
        name: 'Conexión',
        imageUrl: AppAssets.shareIcon,
        selectedImageUrl: 'assets/images/conexion_selected.png',
      ),
      Talent(
        name: 'Contexto',
        imageUrl: AppAssets.worldIcon,
        selectedImageUrl: 'assets/images/contexto_selected.png',
      ),
      Talent(
        name: 'Comunicación',
        imageUrl: AppAssets.speakIcon,
        selectedImageUrl: 'assets/images/comunicacion_selected.png',
      ),

      ///
      /// replace by real assets
      ///
      Talent(
        name: 'Analítico',
        imageUrl: AppAssets.searchIcon44,
        selectedImageUrl: 'assets/images/analitico_selected.png',
      ),
      Talent(
        name: 'Autoconfianza',
        imageUrl: AppAssets.likeIcon,
        selectedImageUrl: 'assets/images/autoconfianza_selected.png',
      ),
      Talent(
        name: 'Armonía',
        imageUrl: AppAssets.sadEmojiIcon,
        selectedImageUrl: 'assets/images/armonia_selected.png',
      ),
      Talent(
        name: 'Carisma',
        imageUrl: AppAssets.laughEmojiIcon,
        selectedImageUrl: 'assets/images/carisma_selected.png',
      ),
      Talent(
        name: 'Competitivo',
        imageUrl: AppAssets.trophyIcon,
        selectedImageUrl: 'assets/images/competitivo_selected.png',
      ),
      Talent(
        name: 'Creencia',
        imageUrl: AppAssets.idkIcon,
        selectedImageUrl: 'assets/images/creencia_selected.png',
      ),
      Talent(
        name: 'Conexión',
        imageUrl: AppAssets.shareIcon,
        selectedImageUrl: 'assets/images/conexion_selected.png',
      ),
      Talent(
        name: 'Contexto',
        imageUrl: AppAssets.worldIcon,
        selectedImageUrl: 'assets/images/contexto_selected.png',
      ),
      Talent(
        name: 'Comunicación',
        imageUrl: AppAssets.speakIcon,
        selectedImageUrl: 'assets/images/comunicacion_selected.png',
      ),
    ];
    notifyListeners();
  }

  void toggleTalentSelection(Talent talent) {
    if (_selectedTalents.contains(talent)) {
      _selectedTalents.remove(talent);
    } else {
      if (_selectedTalents.length < 10) {
        _selectedTalents.add(talent);
      }
    }
    notifyListeners();
  }
}
