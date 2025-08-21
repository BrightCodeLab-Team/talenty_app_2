import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/chat_items.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/chats/conversation/chating_screen_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/mas/availability_screen_3/availability_screen_3.dart';

class JerkyElasticCurve extends Curve {
  @override
  double transform(double t) {
    if (t < 0.7) {
      // Quick movement from right
      return Curves.easeOutQuart.transform(t / 0.7) * 1.08; // Slight overshoot
    } else {
      // Gentle bounce back
      double bounceT = (t - 0.7) / 0.3;
      return 1.08 - (0.08 * Curves.easeOutCubic.transform(bounceT));
    }
  }
}

class ConversationScreen extends StatefulWidget {
  final CandidateChatItem chatItem;
  final JobVacancyModel vacancy;
  final CandidateChatViewModel chatListModel;
  const ConversationScreen({
    super.key,
    required this.chatItem,
    required this.vacancy,
    required this.chatListModel,
  });

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
      duration: const Duration(milliseconds: 600), // Longer for elastic effect
      reverseDuration: const Duration(milliseconds: 200), // Faster closing
      vsync: this,
    );
    _dropdownAnimation = Tween<Offset>(
      begin: const Offset(
        1.2,
        0.0,
      ), // Start further right for more dramatic effect
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _dropdownAnimationController,
        curve: JerkyElasticCurve(), // Use your custom curve here
        reverseCurve: Curves.easeInCubic, // Simple and quick closing
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
        _statusColor = Color(0xffFFCC4D);
      } else if (status == 'Estoy interesado en la vacante') {
        _statusColor = const Color.fromARGB(255, 21, 172, 56);
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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConversationViewModel()..init(widget.chatItem),
        ),
        ChangeNotifierProvider.value(value: widget.chatListModel),
      ],

      child: Consumer2<ConversationViewModel, CandidateChatViewModel>(
        builder: (context, model, chatListModel, child) {
          return Scaffold(
            appBar: AppBar(
              leading: CustomBackButton(position: false),
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
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
            body: SafeArea(
              child: Column(
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
                                                    : widget
                                                            .chatItem
                                                            .unreadCount ==
                                                        'Seleccionado'
                                                    ? darkgreenColor
                                                        .withOpacity(0.2)
                                                    : yellowBrownColor
                                                        .withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                              4.r,
                                            ),
                                          ),

                                          ///
                                          ///. here is the problem when i navigate from allChats list it is ok but when navigate from vacanices list then i want text En Proceso but it is not showing
                                          ///
                                          child: Text(
                                            widget.chatItem.unreadCount ==
                                                    'No seleccionado'
                                                ? 'No seleccionado'
                                                : widget.chatItem.unreadCount ==
                                                    'Seleccionado'
                                                ? 'Seleccionado'
                                                : 'En proceso',
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
                                                      : widget
                                                              .chatItem
                                                              .unreadCount ==
                                                          'Seleccionado'
                                                      ? darkgreenColor
                                                      : yellowBrownColor,
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
                                        ? AnimatedSwitcher(
                                          duration: const Duration(
                                            milliseconds: 600,
                                          ),
                                          reverseDuration: const Duration(
                                            milliseconds: 200,
                                          ), // Faster when closing
                                          transitionBuilder: (
                                            Widget child,
                                            Animation<double> animation,
                                          ) {
                                            return SizeTransition(
                                              sizeFactor: animation,
                                              axisAlignment: 1.0,
                                              child: child,
                                            );
                                          },
                                          child:
                                              _isDropdownOpen
                                                  ? SlideTransition(
                                                    key: ValueKey<bool>(
                                                      _isDropdownOpen,
                                                    ),
                                                    position:
                                                        _dropdownAnimation,
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.sizeOf(
                                                            context,
                                                          ).height *
                                                          0.18.h,
                                                    ),
                                                  )
                                                  : SizedBox.shrink(),
                                        )
                                        : 5.verticalSpace,
                                    Text(
                                      widget.chatItem.role,
                                      style: style18B.copyWith(
                                        color: blackColor,
                                      ),
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
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: PopupMenuButton<String>(
                                          padding: EdgeInsetsGeometry.only(
                                            right: 1,
                                          ),
                                          offset: Offset(1, 20),

                                          constraints: BoxConstraints(
                                            minWidth: 65.w,
                                            maxWidth:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width *
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
                                                  child: _buildStatusItem(
                                                    'Ya no estoy interesado en la vacante',
                                                    _currentStatus ==
                                                            'Ya no estoy interesado en la vacante'
                                                        ? brownColor
                                                            .withOpacity(0.3)
                                                        : brownColor
                                                            .withOpacity(0.1),

                                                    brownColor,
                                                    brownColor,
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value:
                                                      'Por el momento no estoy disponible',
                                                  child: _buildStatusItem(
                                                    'Por el momento no estoy disponible',
                                                    _currentStatus ==
                                                            'Por el momento no estoy disponible'
                                                        ? yellowBrownColor
                                                            .withOpacity(0.3)
                                                        : yellowBrownColor
                                                            .withOpacity(0.1),
                                                    yellowBrownColor,
                                                    Color(0xffFFCC4D),
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value:
                                                      'Estoy interesado en la vacante',
                                                  child: _buildStatusItem(
                                                    'Estoy interesado en la vacante',
                                                    _currentStatus ==
                                                            'Estoy interesado en la vacante'
                                                        ? darkgreenColor
                                                            .withOpacity(0.3)
                                                        : darkgreenColor
                                                            .withOpacity(0.1),
                                                    darkgreenColor,
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
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
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

                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  _buildMessageInput(context, model, chatListModel),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  ///. message input field
  ///
  Widget _buildMessageInput(
    BuildContext context,
    ConversationViewModel model,
    CandidateChatViewModel chatListModel,
  ) {
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
                                    Get.to(AvailabilityScreenThree());
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
                                    showActionBottomSheet(
                                      context,
                                      model,
                                      chatListModel,
                                    );
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
              Text(
                '📌 Estado de tu postulación',
                style: style16B.copyWith(color: blackColor),
              ),
              20.verticalSpace,
              Text(
                'Aquí podrás ver el estado actual de tu proceso en esta vacante, asignado directamente por el reclutador. Existen tres posibles estados:',
                style: style14M.copyWith(color: blackColor),
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
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.sizeOf(context).height * 0.6,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Drag indicator
                  Center(
                    child: Container(
                      height: 4.h,
                      width: 60.w,
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
                      Image.asset(
                        AppAssets.arrowDown,
                        height: 24.h,
                        width: 24.w,
                      ),
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
                  GestureDetector(
                    onTap: () {
                      _updateStatusColor(
                        'Ya no estoy interesado en la vacante',
                      );
                      Navigator.pop(context);
                    },
                    child: _buildStatusItem(
                      'Ya no estoy interesado en la vacante',
                      _currentStatus == 'Ya no estoy interesado en la vacante'
                          ? brownColor.withOpacity(0.4)
                          : brownColor.withOpacity(0.3),
                      brownColor,
                      brownColor,
                    ),
                  ),
                  10.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      _updateStatusColor('Por el momento no estoy disponible');
                      Navigator.pop(context);
                    },
                    child: _buildStatusItem(
                      'Por el momento no estoy disponible',
                      _currentStatus == 'Por el momento no estoy disponible'
                          ? Color(0xffE9E4D2)
                          : Color(0xffE9E4D2),
                      yellowBrownColor,
                      Color(0xffFFCC4D),
                    ),
                  ),
                  10.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      _updateStatusColor('Estoy interesado en la vacante');
                      Navigator.pop(context);
                    },
                    child: _buildStatusItem(
                      'Estoy interesado en la vacante',
                      _currentStatus == 'Estoy interesado en la vacante'
                          ? darkgreenColor.withOpacity(0.3)
                          : darkgreenColor.withOpacity(0.1),
                      darkgreenColor,
                      darkgreenColor,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    'Esto permite una comunicación más clara, directa y respetuosa con las empresas.',
                    style: style12M.copyWith(color: textLightGreyColor),
                    textAlign: TextAlign.start,
                  ),
                  20.verticalSpace,
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: CustomButton(
                      backgroundColor: brownColor2,
                      text: "Entiendo",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  ///
  /// use in drop down
  ///
  Widget _buildStatusItem(
    String text,
    Color bgColor,
    Color borderColor,
    Color? circleColor,
  ) {
    return Container(
      constraints: BoxConstraints(minWidth: 100.w), // Set minimum width
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: SingleChildScrollView(
        scrollDirection:
            Axis.horizontal, // Enable horizontal scrolling if needed
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: style14B.copyWith(color: borderColor, fontSize: 13.sp),
              maxLines: 1, // Force single line
              overflow: TextOverflow.visible, // Allow text to extend
            ),
            SizedBox(width: 8.w),
            CircleAvatar(
              radius: 8.r,
              backgroundColor: circleColor ?? blackColor,
            ),
          ],
        ),
      ),
    );
  }

  ///
  ///. used in second bottom sheet om top right--> support icon
  ///
  Widget _buildStatusRowForBottomSheet(
    String status,
    String description,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        // Your onTap logic here
        // For example, calling a function to handle the selection
        // And closing the bottom sheet
        // _updateStatusColor(status);
        // Navigator.pop(context);
      },
      child: Container(
        // The image shows some vertical space between the containers.
        // This margin adds that space.
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1), // The color opacity is subtle
          border: Border.all(color: color, width: 1.w),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          // Use MainAxisAlignment.start to align children to the left
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(radius: 8.r, backgroundColor: color),
            // Add some space between the circle and the text
            10.horizontalSpace,
            Flexible(
              child: Text(
                status,
                softWrap: true,
                style: TextStyle(
                  color: color,
                  fontSize: 13.sp,
                  fontWeight:
                      FontWeight
                          .w500, // Slightly bolder font weight for the status text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  ///. used in first bottom sheet--> help icon
  ///

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

  // A helper method to build the individual action items
  Widget _buildActionItem(
    BuildContext context, {
    required String? icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsGeometry.symmetric(vertical: 1.h),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        decoration: BoxDecoration(),
        child: Row(
          children: [
            Image.asset(
              icon!,
              height:
                  icon == AppAssets.reportIcon
                      ? 17.h
                      : icon == AppAssets.companyIcon
                      ? 20.h
                      : icon == AppAssets.deleteBoxIcon
                      ? 18.h
                      : icon == AppAssets.crossIcon
                      ? 20.h
                      : icon == AppAssets.blockCompanyIcon
                      ? 20.h
                      : 24.h,
              width:
                  icon == AppAssets.reportIcon
                      ? 15.h
                      : icon == AppAssets.companyIcon
                      ? 20.h
                      : icon == AppAssets.deleteBoxIcon
                      ? 16.h
                      : icon == AppAssets.crossIcon
                      ? 20.h
                      : icon == AppAssets.blockCompanyIcon
                      ? 20.h
                      : 24.h,
            ),
            SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  ///  when click on setting in message inout field bottom sheet will open
  ///
  void showActionBottomSheet(
    BuildContext context,
    ConversationViewModel model,
    CandidateChatViewModel chatListModel,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.48,
          padding: EdgeInsets.only(
            top: 15.h,
            left: 16.w,
            right: 16.w,
            bottom: 20.h,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close icon moved to the beginning of the Column for left alignment
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    AppAssets.crossIcon,
                    height: 18.h,
                    width: 18.w,
                    color: blackColor,
                  ),
                ),
              ),
              30.verticalSpace,
              _buildActionItem(
                context,
                icon: AppAssets.reportIcon,
                text: 'Reportar vacante',
                color: Colors.black,
                onTap: () {
                  // No need to pop here. The new bottom sheet will be stacked on top.
                  showReportBottomSheet(context);
                },
              ),
              _buildActionItem(
                context,
                icon: AppAssets.companyIcon,
                text: 'Reportar empresa',
                color: brownColor2,
                onTap: () {
                  // No need to pop here. The new bottom sheet will be stacked on top.
                  showReportBottomSheet(context);
                },
              ),
              _buildActionItem(
                context,
                icon: AppAssets.deleteBoxIcon,
                text: 'Vaciar Chat',
                color: brownColor2,
                onTap: () {
                  showSettingDialogBox(
                    context: context,
                    onTap: () {
                      model.clearChat();
                      Navigator.pop(context);
                      Navigator.pop(context);
                      model.isChatDeleted == true
                          ? Get.back()
                          : model.isChatDeleted == false
                          ? Future.delayed(Duration(seconds: 3))
                          : Get.back();
                    },
                    title: '¿Estás seguro de que quieres vaciar este chat?',
                    subtittle:
                        'Eliminarás el registro de conversación hasta este punto.',
                    buttonText: 'Vaciar chat',
                  );
                },
              ),
              _buildActionItem(
                context,
                icon: AppAssets.crossIcon,
                text: 'Eliminar Chat',
                color: brownColor2,
                onTap: () {
                  showSettingDialogBox(
                    context: context,
                    onTap: () {
                      // Store the chat to be deleted

                      Navigator.of(context, rootNavigator: true).pop();

                      model.clearChat();
                      Future.delayed(Duration(milliseconds: 200));
                      Navigator.of(context, rootNavigator: true).pop();
                      model.clearChat();
                      Navigator.of(context).pop();
                      final chatToDelete = widget.chatItem;
                      chatListModel.deleteChat(chatToDelete);
                      Future.delayed(Duration(milliseconds: 200));
                      chatListModel.startAutoSwipeAnimation(chatToDelete);
                    },
                    title: '¿Estás seguro de que quieres eliminar este chat??',
                    subtittle:
                        'Esto eliminará el match que tienes con esta empresa.',
                    buttonText: 'Eliminar chat',
                  );
                },
              ),
              _buildActionItem(
                context,
                icon: AppAssets.blockCompanyIcon,
                text: 'Bloquear empresa',
                color: brownColor2,
                onTap: () {
                  showSettingDialogBox(
                    context: context,
                    onTap: () {},
                    title: '¿Seguro que quieres bloquear a Puma?',
                    subtittle:
                        'Si los bloqueas, ya no podrás ver sus vacantes ni recibir oportunidades de esta empresa',
                    buttonText: 'Bloquear',
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  ///
  ///.  inside setting bottom sheet first and second text bottom sheet to report
  ///

  void showReportBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: EdgeInsets.only(top: 20, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              // Drag handle
              Container(
                height: 4,
                width: 40,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                'Selecciona el motivo de tu reporte',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showReportSubBottomSheet(context);
                  },
                  child: ListView(
                    children: [
                      _buildReportItem(
                        'Uso de lenguaje ofensivo o irrespetuoso.',
                      ),
                      _buildReportItem('Acoso o comportamiento agresivo.'),
                      _buildReportItem('Discriminación o discurso de odio.'),
                      _buildReportItem(
                        'Datos falsos o engañosos en su perfil.',
                      ),
                      _buildReportItem('Cuenta sospechosa o fraudulenta.'),
                      _buildReportItem('Suplantación de identidad.'),
                      _buildReportItem(
                        'Incumplió con los términos del servicio.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ///
  /// setting bottom sheet dialog box first and second tab report vacanta / emperasa sub bottom sheet
  ///

  void showReportSubBottomSheet(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return Align(
            alignment: Alignment.bottomRight,
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Drag handle
                    Container(
                      height: 4.h,
                      width: 80.w,
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    30.verticalSpace,
                    Text(
                      'Gracias por tu reporte',
                      style: style16B.copyWith(fontSize: 15.sp),
                    ),
                    30.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Con tu ayuda, mantenemos una comunidad segura y confiable.\n\nRevisaremos este reporte y tomaremos las medidas necesarias si se encuentra alguna violación a nuestras normas. Gracias por contribuir a un mejor espacio para todos',
                        textAlign: TextAlign.start,
                        style: style16M.copyWith(color: darkPurpleColor),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30.0,
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: CustomButton(
                        text: 'Listo',
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        backgroundColor: brownColor2,
                        textColor: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  } // A helper method to build the individual report items

  Widget _buildReportItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.black87)),
    );
  }

  ///
  /// setting bottom sheet dialog box
  ///

  void showSettingDialogBox({
    required BuildContext context,
    // required VoidCallback onConfirmActivate,
    required String? title,
    required String? subtittle,
    required String? buttonText,
    required VoidCallback onTap,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            width: 270.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 15.w,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.appLogo2,
                    color: brownColor2,
                    height: 40.h,
                    width: 134.w,
                  ), // Talenty Logo
                  20.verticalSpace,
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: style14B.copyWith(color: blackColor),
                  ),
                  20.verticalSpace,
                  Text(
                    subtittle!,
                    textAlign: TextAlign.center,
                    style: style14M.copyWith(color: blackColor),
                  ),
                  10.verticalSpace,
                  CustomButton(
                    text: buttonText!,
                    onTap: onTap,
                    //onTap: onConfirmActivate,
                    backgroundColor: candidatoPrimaryColor,
                    textColor: whiteColor,
                    radius: 10.r,
                  ),
                  12.verticalSpace,
                  CustomButton(
                    text: 'Cancelar',
                    onTap: () {
                      Navigator.of(dialogContext).pop(); // Dismiss the dialog
                    },
                    backgroundColor: Colors.transparent,
                    textColor: blackColor,
                    borderColor: blackColor,
                    radius: 10.r,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

///
///. message bubble how message will looks like
///

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
        (message.imgUrl.isNotEmpty)
            ? AssetImage(message.imgUrl)
            : AssetImage(AppAssets.profileIcon);

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
                  SizedBox(width: 2.w), // Small gap before tail
                ],
                // Using chat_bubbles package BubbleSpecialThree for perfect notch
                BubbleSpecialThree(
                  text: message.text,
                  color: bubbleColor,
                  tail: true,
                  isSender: isMe,
                  textStyle: style14M.copyWith(color: textColor),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                    minWidth: 100.w,
                  ),
                ),
                if (isMe) ...[
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
