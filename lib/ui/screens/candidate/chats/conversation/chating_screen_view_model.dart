// conversation_view_model.dart
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/chat_items.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class ConversationViewModel extends BaseViewModel {
  late CandidateChatItem _chatItem;
  List<Message> _messages = [];
  bool _isChatDeleted = false;

  CandidateChatItem get chatItem => _chatItem;
  List<Message> get messages => _messages;
  bool get isChatDeleted => _isChatDeleted;

  void init(CandidateChatItem chatItem) {
    _chatItem = chatItem;
    _loadMessages();
  }

  void _loadMessages() {
    // Sample messages based on your screenshots
    _messages = [
      Message(
        sender: _chatItem.name,
        text:
            "Hola! Nos interesa tu perfil, ¿estás disponible para una llamada?",
        time: _chatItem.timestamp,
        isMe: false,
        imgUrl: AppAssets.menulogo,
      ),
      Message(
        sender: "Tú",
        text: "Si claro! Me encuentro disponible en este momento",
        time: "7:03 PM",
        isMe: true,
        imgUrl: AppAssets.menulogo,
      ),
    ];
    notifyListeners();
  }

  void sendMessage(String text) {
    final newMessage = Message(
      sender: "Tú",
      text: text,
      time: _formatTime(DateTime.now()),
      isMe: true,
      imgUrl: AppAssets.menulogo,
    );

    _messages.add(newMessage);
    notifyListeners();
  }

  // Clear all messages from the chat
  void clearChat() {
    _messages.clear();
    notifyListeners();
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
  }
}

// message_model.dart
class Message {
  final String sender;
  final String text;
  final String time;
  final bool isMe;
  final String imgUrl;

  Message({
    required this.sender,
    required this.text,
    required this.time,
    required this.isMe,
    required this.imgUrl,
  });
}
