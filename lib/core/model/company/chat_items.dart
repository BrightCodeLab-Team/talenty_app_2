import 'package:talenty_app/core/model/company/your_vacancies.dart';

import 'your_vacancies.dart';

class ChatItem {
  final String name;
  final String role;
  final String preview;
  final String timestamp;
  final int unreadCount;
  final String avatarUrl;
  final bool isOnline;

  ChatItem({
    required this.name,
    required this.role,
    required this.preview,
    required this.timestamp,
    required this.unreadCount,
    required this.avatarUrl,
    required this.isOnline,
  });
}

class CandidateChatItem extends JobVacancyModel {
  final int? id;
  final String name;
  final String role;
  final String preview;
  final String timestamp;
  final String? unreadCount;
  final String avatarUrl;
  final bool isOnline;

  CandidateChatItem({
    this.id,
    required this.name,
    required this.role,
    required this.preview,
    required this.timestamp,
    required this.unreadCount,
    required this.avatarUrl,
    required this.isOnline,
    String? companyName,
    String? state,
  }) : super(companyName: companyName, state: state);
}
