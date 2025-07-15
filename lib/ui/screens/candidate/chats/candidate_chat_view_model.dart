import 'package:get/get_utils/get_utils.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/chat_items.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class CandidateChatViewModel extends BaseViewModel {
  final List<String> filters = [
    'all'.tr,
    'art_and_design'.tr,
    'Becario programación'.tr,
    'Ventas'.tr,
  ];

  String selectedFilter = 'all'.tr;

  // Static list of all chats
  final List<ChatItem> _allChats = [
    ChatItem(
      name: 'Jorge Pérez',
      role: 'art_and_design'.tr,
      preview:'web'.tr,
      timestamp: '7:03 pm',
      unreadCount: 1,
      avatarUrl: AppAssets.img,
      isOnline: false,
    ),
    ChatItem(
      name: 'Jorge Pérez',
      role: 'Becario en Programación',
      preview:'web'.tr,
      timestamp: '7:03 pm',
      unreadCount: 0,
      avatarUrl: AppAssets.img2,
      isOnline: true,
    ),
    ChatItem(
      name: 'Jorge Pérez',
      role: 'Programador HTML',
      preview:'web'.tr,
      timestamp: '7:03 pm',
      unreadCount: 0,
      avatarUrl: AppAssets.img,
      isOnline: false,
    ),
    ChatItem(
      name: 'Jorge Pérez',
      role: 'Becario en ventas',
      preview:'web'.tr,
      timestamp: '7:03 pm',
      unreadCount: 0,
      avatarUrl: AppAssets.img2,
      isOnline: true,
    ),
  ];

  // Getter returns filtered list based on selectedFilter
  List<ChatItem> get chats {
    if (selectedFilter == 'all'.tr) return _allChats;

    return _allChats.where((c) {
      final lower = c.role.toLowerCase();
      final filter = selectedFilter.toLowerCase();
      return lower.contains(filter);
    }).toList();
  }

  // Called by the UI when a filter is tapped
  void onClick(String f) {
    selectedFilter = f;
    notifyListeners();
  }
}
