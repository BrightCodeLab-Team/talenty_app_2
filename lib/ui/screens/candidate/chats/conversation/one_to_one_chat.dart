// conversation_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/chat_items.dart';
import 'package:talenty_app/ui/screens/candidate/chats/conversation/view_model.dart';

class ConversationScreen extends StatefulWidget {
  final CandidateChatItem chatItem;

  const ConversationScreen({Key? key, required this.chatItem})
    : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConversationViewModel()..init(widget.chatItem),
      child: Consumer<ConversationViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 15.r,
                    backgroundImage: AssetImage(widget.chatItem.avatarUrl),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    widget.chatItem.name,
                    style: style16B.copyWith(color: blackColor),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                // Status bar showing the current selection
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.chatItem.role,
                        style: style14M.copyWith(color: textDarkGreyColor),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color:
                              widget.chatItem.unreadCount == 'En proceso'
                                  ? yellowBrownColor.withOpacity(0.3)
                                  : widget.chatItem.unreadCount ==
                                      'No seleccionado'
                                  ? lightBrownColor2.withOpacity(0.3)
                                  : darkgreenColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(65.r),
                        ),
                        child: Text(
                          widget.chatItem.unreadCount!,
                          style: style14M.copyWith(
                            color:
                                widget.chatItem.unreadCount == 'En proceso'
                                    ? yellowBrownColor
                                    : widget.chatItem.unreadCount ==
                                        'No seleccionado'
                                    ? lightBrownColor2
                                    : darkgreenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    itemCount: model.messages.length,
                    itemBuilder: (context, index) {
                      final message = model.messages[index];
                      return MessageBubble(
                        message: message,
                        isMe: message.isMe,
                      );
                    },
                  ),
                ),
                _buildMessageInput(context, model),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context, ConversationViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,

        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Mensaje...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: brownColor,
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white, size: 18.w),
              onPressed: () {
                if (_messageController.text.trim().isNotEmpty) {
                  model.sendMessage(_messageController.text);
                  _messageController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// conversation_screen.dart

// ... (existing code for ConversationScreen and _ConversationScreenState) ...

// -------------------------------------------------------------------------------------------------
// UPDATED CODE STARTS HERE
// -------------------------------------------------------------------------------------------------

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageBubble({Key? key, required this.message, required this.isMe})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine bubble color and text color based on sender
    final Color bubbleColor = isMe ? brownColor : Colors.grey[200]!;
    final Color textColor = isMe ? Colors.white : Colors.black;
    final Color nameColor = isMe ? blackColor : textDarkGreyColor;

    // Use a placeholder image if message.imgUrl is null
    final ImageProvider avatarImage =
        (message.imgUrl != null && message.imgUrl!.isNotEmpty)
            ? AssetImage(message.imgUrl!)
            : AssetImage(
              AppAssets.menulogo,
            ); // Assuming you have a placeholder image asset

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Sender name above the bubble
            if (!isMe)
              Padding(
                padding: EdgeInsets.only(left: 48.w),
                child: Text(
                  message.sender,
                  style: style12M.copyWith(
                    color: nameColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (isMe)
              Padding(
                padding: EdgeInsets.only(right: 48.w),
                child: Text(
                  message.sender,
                  style: style12M.copyWith(
                    color: nameColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            10.verticalSpace,
            Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Avatar and cone for receiver
                if (!isMe) ...[
                  CircleAvatar(radius: 16.r, backgroundImage: avatarImage),
                  CustomPaint(
                    painter: MessageBubbleTailPainter(
                      isMe: false,
                      color: bubbleColor,
                    ),
                    child: SizedBox(width: 8.w, height: 16.h),
                  ),
                ],
                // Message container
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                    minWidth: 100.w,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    decoration: BoxDecoration(
                      color: bubbleColor,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          isMe
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.text,

                          style: style14M.copyWith(color: textColor),
                        ),
                        SizedBox(height: 4.h),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            message.time,
                            style: style12M.copyWith(
                              color: isMe ? Colors.white70 : Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Cone and avatar for sender
                if (isMe) ...[
                  CustomPaint(
                    painter: MessageBubbleTailPainter(
                      isMe: true,
                      color: bubbleColor,
                    ),
                    child: SizedBox(width: 8.w, height: 16.h),
                  ),
                  CircleAvatar(radius: 16.r, backgroundImage: avatarImage),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// CustomPainter to draw the cone shape (no change needed here)
class MessageBubbleTailPainter extends CustomPainter {
  final bool isMe;
  final Color color;
  MessageBubbleTailPainter({required this.isMe, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;
    final path = Path();
    if (isMe) {
      path.moveTo(size.width, size.height * 0.6);
      path.lineTo(0, size.height);
      path.lineTo(0, size.height * 0.1);
      path.close();
    } else {
      path.moveTo(0, size.height * 0.6);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, size.height * 0.1);
      path.close();
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
