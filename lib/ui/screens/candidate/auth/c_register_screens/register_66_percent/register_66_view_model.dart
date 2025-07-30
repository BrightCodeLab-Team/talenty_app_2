import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';

class CandidateRegister66PercentViewModel extends BaseViewModel {
  final List<ShadowTagItem> allTagItems = [
    ShadowTagItem('🇬🇧   Inglés', 'language'),
    ShadowTagItem('🇲🇽   Español', 'language'),
    ShadowTagItem('🇫🇷   Francés', 'language'),
    ShadowTagItem('🇩🇪   Alemán', 'language'),
    ShadowTagItem('🇮🇹   Italiano', 'language'),
    ShadowTagItem('🇨🇳   Chino mandarín', 'language'),
    ShadowTagItem('🇯🇵   Japonés', 'language'),
    ShadowTagItem('🇰🇷   Coreano', 'language'),
    ShadowTagItem('🇷🇺   Ruso', 'language'),
    ShadowTagItem('🇸🇦   Árabe', 'language'),
    ShadowTagItem('🇵🇹   Portugués', 'language'),
    ShadowTagItem('🇮🇳   Hindi', 'language'),
    ShadowTagItem('🇧🇷   Portugués brasileño', 'language'),
    ShadowTagItem('🇹🇷   Turco', 'language'),
    ShadowTagItem('🇵🇰   Urdu', 'language'),
    ShadowTagItem('🇵🇭   Filipino', 'language'),
    ShadowTagItem('🇻🇳   Vietnamita', 'language'),
    ShadowTagItem('🇹🇭   Tailandés', 'language'),
    ShadowTagItem('🇵🇱   Polaco', 'language'),
    ShadowTagItem('🇸🇪   Sueco', 'language'),
    ShadowTagItem('🇳🇴   Noruego', 'language'),
    ShadowTagItem('🇩🇰   Danés', 'language'),
    ShadowTagItem('🇳🇱   Neerlandés', 'language'),
    ShadowTagItem('🇮🇩   Indonesio', 'language'),
    ShadowTagItem('🇲🇾   Malayo', 'language'),
    ShadowTagItem('🇬🇷   Griego', 'language'),
    ShadowTagItem('🇧🇩   Bengalí', 'language'),
    ShadowTagItem('🇳🇬   Hausa', 'language'),
    ShadowTagItem('🇿🇦   Zulú', 'language'),
    ShadowTagItem('🇺🇦   Ucraniano', 'language'),
    ShadowTagItem('🇮🇷   Persa (Farsi)', 'language'),
    ShadowTagItem('🇮🇶   Kurdo', 'language'),
    ShadowTagItem('🇮🇱   Hebreo', 'language'),
    ShadowTagItem('🇨🇿   Checo', 'language'),
    ShadowTagItem('🇷🇴   Rumano', 'language'),
    ShadowTagItem('🇭🇺   Húngaro', 'language'),
    ShadowTagItem('🇫🇮   Finés', 'language'),
    ShadowTagItem('🇹🇳   Bereber', 'language'),
    ShadowTagItem('🇪🇬   Copto', 'language'),
  ];

  List<ShadowTagItem> filteredTags = [];
  final List<ShadowTagItem> selectedTags = [];

  CandidateRegister66PercentViewModel() {
    filteredTags = List.from(allTagItems);
  }

  void toggleSelection(ShadowTagItem item) {
    if (selectedTags.contains(item)) {
      selectedTags.remove(item);
    } else {
      if (selectedTags.length < 10) {
        selectedTags.add(item);
      }
    }
    notifyListeners();
  }

  bool isSelected(ShadowTagItem item) => selectedTags.contains(item);

  void searchTags(String query) {
    if (query.isEmpty) {
      filteredTags = List.from(allTagItems);
    } else {
      filteredTags =
          allTagItems
              .where(
                (item) => item.text.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }

  bool validateMinimumSelection() => selectedTags.length >= 2;
}
