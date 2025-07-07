import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/chat_items.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class CandidateChatViewModel extends BaseViewModel {
  final List<String> filters = [
    'Todos',
    'Diseño web',
    'Becario programación',
    'Ventas',
  ];

  String selectedFilter = 'Todos';

  // Static list of all chats
  final List<ChatItem> _allChats = [
    ChatItem(
      name: 'Jorge Pérez',
      role: 'Diseñador Web',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 1,
      avatarUrl: AppAssets.img,
      isOnline: false,
    ),
    ChatItem(
      name: 'Jorge Pérez',
      role: 'Becario en Programación',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 0,
      avatarUrl: AppAssets.img2,
      isOnline: true,
    ),
    ChatItem(
      name: 'Jorge Pérez',
      role: 'Programador HTML',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 0,
      avatarUrl: AppAssets.img,
      isOnline: false,
    ),
    ChatItem(
      name: 'Jorge Pérez',
      role: 'Becario en ventas',
      preview: '¡Hola! soy Jorge Pérez diseñador web...',
      timestamp: '7:03 pm',
      unreadCount: 0,
      avatarUrl: AppAssets.img2,
      isOnline: true,
    ),
  ];

  // Getter returns filtered list based on selectedFilter
  List<ChatItem> get chats {
    if (selectedFilter == 'Todos') return _allChats;

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
