import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';

class Candidate55PercentRegisterViewModelModel extends BaseViewModel {
  List<ShadowTagItem> selectedTags = [];

  final List<ShadowTagItem> allTagItems = [
    ShadowTagItem('🥊   Boxeo', 'humana'),
    ShadowTagItem('⚽   Fútbol', 'humana'),
    ShadowTagItem('🥾   Senderismo', 'humana'),
    ShadowTagItem('🧘‍️   Meditación', 'humana'),
    ShadowTagItem('🎬‍️   Ver películas', 'humana'),
    ShadowTagItem('🏃‍️   Corror', 'humana'),
    ShadowTagItem('🧢   Béisbol', 'humana'),
    ShadowTagItem('📚‍️   Leer libros', 'humana'),
    ShadowTagItem('🚴   Ciclismo', 'humana'),
    ShadowTagItem('✏️   Dibujar', 'tecnica'),
    ShadowTagItem('🍳   Cocinar', 'humana'),
    ShadowTagItem('🎧   Escuchar música', 'humana'),
    ShadowTagItem('🧘‍♀️   Yoga', 'humana'),
    ShadowTagItem('🎸‍️   Tocar guitarra', 'tecnica'),
    ShadowTagItem('🏊‍♀️‍️   Natación', 'humana'),
    ShadowTagItem('🎨   Pintar', 'tecnica'),
    ShadowTagItem('🎤   Cantar', 'humana'),
    ShadowTagItem('💃‍️   Bailar', 'humana'),
    ShadowTagItem('🏋️‍‍️   Hacer ejercicio en casa', 'humana'),
    ShadowTagItem('🍰‍️ Hacer postres', 'tecnica'),
  ];

  List<ShadowTagItem> tagItemsList = [];

  Candidate55PercentRegisterViewModelModel() {
    tagItemsList = allTagItems;
  }

  toggleSelection(ShadowTagItem item) {
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

  void searchTag(String query) {
    if (query.isEmpty) {
      tagItemsList = allTagItems;
    } else {
      tagItemsList =
          allTagItems
              .where(
                (tag) =>
                    tag.text.toLowerCase().contains(query.trim().toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }
}
