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

class CandidateChatItem {
  final String name;
  final String role;
  final String preview;
  final String timestamp;
  final String unreadCount;
  final String avatarUrl;
  final bool isOnline;

  CandidateChatItem({
    required this.name,
    required this.role,
    required this.preview,
    required this.timestamp,
    required this.unreadCount,
    required this.avatarUrl,
    required this.isOnline,
  });
}
