import 'package:flutter/material.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';

class CandidateRegister33PercentViewModel extends BaseViewModel {
  final TextEditingController searchController = TextEditingController();
  bool get hasMinSelections => selectedTags.length >= 3;

  final List<ShadowTagItem> originalTagItems = [
    ShadowTagItem('💪 Resiliencia', 'humana'),
    ShadowTagItem('💡 Pensamiento crítico', 'humana'),
    ShadowTagItem('🧠 Resolución de problemas', 'humana'),
    ShadowTagItem('🕊️ Empatía', 'humana'),
    ShadowTagItem('🗣️ Comunicación asertiva', 'humana'),
    ShadowTagItem('🧘‍️ Manejo del estrés', 'humana'),
    ShadowTagItem('🚀 Proactividad', 'humana'),
    ShadowTagItem('🤝 Trabajo en equipo', 'humana'),
    ShadowTagItem('💻 Uso de la Inteligencia Artificial', 'tecnica'),
    ShadowTagItem('⏰ Gestión del tiempo', 'tecnica'),
  ];

  List<ShadowTagItem> displayedItems = [];
  ShadowTagItem? selectedItem;
  int? selectedCategoryIndex; // null = all
  String currentSearchQuery = '';

  List<ShadowTagItem> selectedTags = [];

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

  CandidateRegister33PercentViewModel() {
    displayedItems = List.from(originalTagItems);
  }

  void selectItem(ShadowTagItem item) {
    selectedItem = item;
    _applyFilters();
  }

  void filterBySearch(String query) {
    currentSearchQuery = query;
    _applyFilters();
  }

  void selectCategory(int? index) {
    selectedCategoryIndex = index;
    _applyFilters();
  }

  void _applyFilters() {
    List<ShadowTagItem> filtered = List.from(originalTagItems);

    // Filter by category
    if (selectedCategoryIndex != null) {
      String category = selectedCategoryIndex == 0 ? 'humana' : 'tecnica';
      filtered = filtered.where((tag) => tag.category == category).toList();
    }

    // Filter by search query
    if (currentSearchQuery.isNotEmpty) {
      filtered =
          filtered
              .where(
                (tag) => tag.text.toLowerCase().contains(
                  currentSearchQuery.toLowerCase(),
                ),
              )
              .toList();
    }

    // Move selected item to top if still in the list
    if (selectedItem != null && filtered.contains(selectedItem)) {
      filtered.remove(selectedItem);
      filtered.insert(0, selectedItem!);
    }

    displayedItems = filtered;
    notifyListeners();
  }
}
