import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/chat_items.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/chats/conversation/view_model.dart';

class ConversationScreen extends StatefulWidget {
  final CandidateChatItem chatItem;
  final JobVacancyModel vacancy;
  const ConversationScreen({
    Key? key,
    required this.chatItem,
    required this.vacancy,
  }) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  bool _isDropdownOpen = false;
  late AnimationController _dropdownAnimationController;
  late Animation<Offset> _dropdownAnimation;

  String _currentStatus = 'En proceso';
  Color _statusColor = greyColor;

  @override
  void initState() {
    super.initState();
    _updateStatusColor(_currentStatus);
    _dropdownAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _dropdownAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _dropdownAnimationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _dropdownAnimationController.dispose();
    super.dispose();
  }

  void _updateStatusColor(String status) {
    setState(() {
      _currentStatus = status;
      if (status == 'Ya no estoy interesado en la vacante') {
        _statusColor = brownColor;
      } else if (status == 'Por el momento no estoy disponible') {
        _statusColor = yellowBrownColor;
      } else if (status == 'Estoy interesado en la vacante') {
        _statusColor = greenColor;
      } else {
        _statusColor = greyColor;
      }
    });
  }

  void _handleDropdownState(bool isOpen) {
    setState(() {
      _isDropdownOpen = isOpen;
      if (isOpen) {
        _dropdownAnimationController.forward();
      } else {
        _dropdownAnimationController.reverse();
      }
    });
  }

  void _showStatusSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              20.verticalSpace,
              Text(
                'Actualizar tu estado',
                style: style16B.copyWith(color: blackColor),
              ),
              20.verticalSpace,
              _buildStatusRowForBottomSheet(
                'Ya no estoy interesado en la vacante',
                'Notificarás al reclutador que ya no estás interesado',
                brownColor2,
              ),
              10.verticalSpace,
              _buildStatusRowForBottomSheet(
                'Por el momento no estoy disponible',
                'Notificarás al reclutador que no estás disponible actualmente',
                yellowBrownColor,
              ),
              10.verticalSpace,
              _buildStatusRowForBottomSheet(
                'Estoy interesado en la vacante',
                'Notificarás al reclutador que sigues interesado',
                darkgreenColor,
              ),
              20.verticalSpace,
              CustomButton(
                backgroundColor: brownColor,
                text: "Cancelar",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: topChatContainerBorderColor),
                    color: textLightGreyColor.withOpacity(0.02),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              widget.chatItem.unreadCount ==
                                                      'En proceso'
                                                  ? yellowBrownColor
                                                      .withOpacity(0.3)
                                                  : widget
                                                          .chatItem
                                                          .unreadCount ==
                                                      'No seleccionado'
                                                  ? lightBrownColor2
                                                      .withOpacity(0.3)
                                                  : darkgreenColor.withOpacity(
                                                    0.2,
                                                  ),
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                        child: Text(
                                          widget.chatItem.unreadCount!,
                                          style: style14M.copyWith(
                                            color:
                                                widget.chatItem.unreadCount ==
                                                        'En proceso'
                                                    ? yellowBrownColor
                                                    : widget
                                                            .chatItem
                                                            .unreadCount ==
                                                        'No seleccionado'
                                                    ? lightBrownColor2
                                                    : darkgreenColor,
                                          ),
                                        ),
                                      ),
                                      3.horizontalSpace,
                                      GestureDetector(
                                        onTap: () {
                                          _showApplicationStatusBottomSheet(
                                            context,
                                          );
                                        },
                                        child: Image.asset(
                                          AppAssets.helpIcon,
                                          height: 22.h,
                                          width: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                  _isDropdownOpen == true
                                      ? SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                            0.18.h,
                                      )
                                      : 5.verticalSpace,
                                  Text(
                                    widget.chatItem.role,
                                    style: style18B.copyWith(color: blackColor),
                                  ),
                                  5.verticalSpace,
                                  Text(
                                    '${widget.chatItem.companyName}, ${widget.chatItem.state}',
                                    style: style14M.copyWith(
                                      color: textDarkGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _showApplicationSupportBottomSheet(
                                          context,
                                        );
                                      },
                                      child: Image.asset(
                                        AppAssets.supportIcon,
                                        height: 26.h,
                                        width: 26.w,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    PopupMenuButton<String>(
                                      offset: Offset(10, 22),
                                      constraints: BoxConstraints(
                                        minWidth: 65.w,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                            0.8,
                                      ),
                                      color: Colors.transparent,
                                      elevation: 0,
                                      onSelected: (String result) {
                                        _updateStatusColor(result);
                                        _handleDropdownState(false);
                                      },
                                      onCanceled: () {
                                        _handleDropdownState(false);
                                      },
                                      onOpened: () {
                                        _handleDropdownState(true);
                                      },
                                      itemBuilder:
                                          (
                                            BuildContext context,
                                          ) => <PopupMenuEntry<String>>[
                                            PopupMenuItem<String>(
                                              value:
                                                  'Ya no estoy interesado en la vacante',
                                              child: _buildMenuItem(
                                                'Ya no estoy interesado en la vacante',
                                                brownColor2,
                                              ),
                                            ),
                                            PopupMenuItem<String>(
                                              value:
                                                  'Por el momento no estoy disponible',
                                              child: _buildMenuItem(
                                                'Por el momento no estoy disponible',
                                                yellowBrownColor,
                                              ),
                                            ),
                                            PopupMenuItem<String>(
                                              value:
                                                  'Estoy interesado en la vacante',
                                              child: _buildMenuItem(
                                                'Estoy interesado en la vacante',
                                                darkgreenColor,
                                              ),
                                            ),
                                          ],
                                      child: Container(
                                        height: 32.h,
                                        width: 65.w,
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          border: Border.all(
                                            color: borderGreyColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            6.r,
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 8.r,
                                              backgroundColor: _statusColor,
                                            ),
                                            4.horizontalSpace,
                                            Icon(
                                              _isDropdownOpen
                                                  ? Icons
                                                      .keyboard_arrow_up_rounded
                                                  : Icons
                                                      .keyboard_arrow_down_rounded,
                                              color: greyColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
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

  Widget _buildMenuItem(String text, Color color) {
    return SlideTransition(
      position: _dropdownAnimation,
      child: Material(
        color: transparent,
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    text,
                    softWrap: true,
                    style: style14B.copyWith(color: color, fontSize: 13.sp),
                  ),
                ),
                3.horizontalSpace,
                CircleAvatar(radius: 8.r, backgroundColor: color),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context, ConversationViewModel model) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: 15.0,
        right: 15,
        top: 10,
        bottom: 35,
      ),
      child: Row(
        children: [
          Expanded(
            child: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _messageController,
              builder: (context, value, child) {
                return TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    suffixIcon:
                        value.text.isEmpty
                            ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('calender opened');
                                  },
                                  child: Image.asset(
                                    AppAssets.calendar,
                                    height: 26.h,
                                    width: 26,
                                  ),
                                ),
                                10.horizontalSpace,
                                GestureDetector(
                                  onTap: () {
                                    print('pdf opened');
                                  },
                                  child: Image.asset(
                                    AppAssets.pdfIcon,
                                    height: 23.h,
                                    width: 25,
                                  ),
                                ),
                                10.horizontalSpace,
                                GestureDetector(
                                  onTap: () {
                                    print('setting opened');
                                  },
                                  child: Image.asset(
                                    AppAssets.settingIcon,
                                    height: 26.h,
                                    width: 26,
                                  ),
                                ),
                                10.horizontalSpace,
                              ],
                            )
                            : CircleAvatar(
                              radius: 20.r,
                              backgroundColor: whiteColor,
                              child: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: arrowColor,
                                  size: 18.w,
                                ),
                                onPressed: () {
                                  if (_messageController.text
                                      .trim()
                                      .isNotEmpty) {
                                    model.sendMessage(_messageController.text);
                                    _messageController.clear();
                                  }
                                },
                              ),
                            ),
                    hintText: 'Mensaje...',
                    hintStyle: style14M.copyWith(color: textLightGreyColor),
                    filled: true,
                    fillColor: whiteColor,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: borderGreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: borderGreyColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: borderGreyColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: borderGreyColor),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: borderGreyColor),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ///
  ///. first bottom sheet
  ///
  void _showApplicationStatusBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.push_pin_outlined, color: redColor),
                  5.horizontalSpace,
                  Text(
                    'Estado de tu postulación',
                    style: style16B.copyWith(color: blackColor),
                  ),
                ],
              ),
              20.verticalSpace,
              Text(
                'Aquí podrás ver el estado actual de tu proceso en esta vacante, asignado directamente por el reclutador. Existen tres posibles estados:',
                style: style18M.copyWith(color: textDarkGreyColor),
                textAlign: TextAlign.start,
              ),
              15.verticalSpace,
              _buildStatusRow(
                'Seleccionado',
                'Has sido elegido para avanzar o cerrar exitosamente la vacante.',
                darkgreenColor,
              ),
              10.verticalSpace,
              _buildStatusRow(
                'En proceso',
                'Tu perfil sigue siendo evaluado.',
                yellowBrownColor,
              ),
              10.verticalSpace,
              _buildStatusRow(
                'No seleccionado',
                'El reclutador ha decidido no continuar contigo en este proceso.',
                brownColor,
              ),
              20.verticalSpace,
              Text(
                'Este estado es informativo y solo puede ser actualizado por el reclutador, tú no puedes modificarlo.',
                style: style14M.copyWith(color: blackColor),
                textAlign: TextAlign.start,
              ),
              20.verticalSpace,
              CustomButton(
                backgroundColor: brownColor,
                text: "Listo",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }

  ///
  ///. second bottom sheet
  ///
  void _showApplicationSupportBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag indicator
              Center(
                child: Container(
                  height: 4.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.arrowDown, height: 24.h, width: 24.w),
                  10.horizontalSpace,
                  Text(
                    'Actualiza tu interés en la vacante',
                    style: style18B.copyWith(color: blackColor),
                  ),
                ],
              ),
              20.verticalSpace,
              Text(
                'Declara tu disponibilidad y nivel de interés respecto a esta oportunidad laboral directamente desde el chat. Como candidato, podrás seleccionar entre tres opciones para informar al reclutador sobre tu situación actual:',
                style: style14M.copyWith(color: textDarkGreyColor),
                textAlign: TextAlign.start,
              ),
              15.verticalSpace,
              _buildStatusRowForBottomSheet(
                'Ya no estoy interesado en la vacante',
                'no_description_needed', // The image doesn't show a description for these buttons
                brownColor,
              ),
              10.verticalSpace,
              _buildStatusRowForBottomSheet(
                'Por el momento no estoy disponible',
                'no_description_needed',
                yellowBrownColor,
              ),
              10.verticalSpace,
              _buildStatusRowForBottomSheet(
                'Estoy interesado en la vacante',
                'no_description_needed',
                greenColor,
              ),
              20.verticalSpace,
              Text(
                'Esto permite una comunicación más clara, directa y respetuosa con las empresas.',
                style: style12M.copyWith(color: textLightGreyColor),
                textAlign: TextAlign.start,
              ),
              20.verticalSpace,
              CustomButton(
                backgroundColor: primaryColor,
                text: "Entiendo",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }

  // Your existing _buildStatusRowForBottomSheet method from the prompt
  Widget _buildStatusRowForBottomSheet(
    String status,
    String description,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        // You should have a way to call _updateStatusColor from here
        // If this is a stateful widget, this will be available
        // _updateStatusColor(status);
        // Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                status,
                softWrap: true,
                style: style14B.copyWith(color: color, fontSize: 13.sp),
              ),
            ),
            5.horizontalSpace,
            CircleAvatar(radius: 8.r, backgroundColor: color),
          ],
        ),
      ),
    );
  }

  // Your existing _buildStatusRow method from the prompt
  Widget _buildStatusRow(String status, String description, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(status, style: style14M.copyWith(color: color)),
        ),
        10.horizontalSpace,
        Expanded(
          child: Text(description, style: style14M.copyWith(color: blackColor)),
        ),
      ],
    );
  }

  ///
  ///  second bottom shet end
  ///
}

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageBubble({Key? key, required this.message, required this.isMe})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bubbleColor = isMe ? brownColor : Colors.grey[200]!;
    final Color textColor = isMe ? Colors.white : Colors.black;
    final Color nameColor = isMe ? blackColor : textDarkGreyColor;

    final ImageProvider avatarImage =
        (message.imgUrl != null && message.imgUrl!.isNotEmpty)
            ? AssetImage(message.imgUrl!)
            : AssetImage(AppAssets.menulogo);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
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
