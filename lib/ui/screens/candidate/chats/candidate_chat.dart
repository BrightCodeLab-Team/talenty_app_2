import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/chat_items.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/chats/conversation/chating_screen.dart';
import 'package:talenty_app/ui/screens/candidate/chats/help_screen.dart';
import 'package:talenty_app/ui/screens/candidate/mas/main_menu_screen/candidate_mas_screen.dart';
import 'package:talenty_app/ui/screens/company/chat/chat_screen.dart';

class CandidateChatScreen extends StatefulWidget {
  const CandidateChatScreen({super.key});

  @override
  State<CandidateChatScreen> createState() => _CandidateChatScreenState();
}

class _CandidateChatScreenState extends State<CandidateChatScreen> {
  bool isDisponible = false;
  bool _showSearch = false;
  final TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();
  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateChatViewModel(),
      child: Consumer<CandidateChatViewModel>(
        builder:
            (context, model, child) => Scaffold(
              appBar: AppBar(
                leadingWidth: isDisponible ? 170 : 200,
                leading: InkWell(
                  onTap: () {
                    if (isDisponible) {
                      Get.dialog(
                        DeactivateAvailabilityDialog(
                          onConfirmDeactivate: () {
                            setState(() {
                              isDisponible = false;
                            });
                            Get.back();
                          },
                        ),
                      );
                    } else {
                      Get.dialog(
                        ActivateAvailabilityDialog(
                          onConfirmActivate: () {
                            setState(() {
                              isDisponible = true;
                            });
                            Get.back();
                          },
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: model.selectedFilter == 'Todos' ? 17.w : 15.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isDisponible
                                    ? lightgreenColor1
                                    : Color(0xFFFAD7D7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                height: 18.h,
                                width: 20.w,
                                isDisponible
                                    ? AppAssets.dispoCamera
                                    : AppAssets.noDispCamera,
                                color:
                                    isDisponible
                                        ? darkgreenColor
                                        : lightBrownColor2,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                isDisponible ? 'Disponible' : 'No disponible',
                                style: style16M.copyWith(
                                  color:
                                      isDisponible
                                          ? darkgreenColor
                                          : lightBrownColor2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  if (!_showSearch) ...[
                    GestureDetector(
                      onTap: () {
                        Get.to(CandidateChatHelpScreen());
                      },
                      child: SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: Icon(Icons.help, color: arrowColor),
                      ),
                    ),
                    20.horizontalSpace,
                    Padding(
                      padding: EdgeInsets.only(
                        right: model.selectedFilter == 'Todos' ? 15.0 : 20.w,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showSearch = true;
                            FocusScope.of(
                              context,
                            ).requestFocus(_searchFocusNode);
                          });
                        },
                        child: Image(
                          image: AssetImage(AppAssets.searchIcon44),
                          color: arrowColor,
                          height: 18.h,
                          width: 18.w,
                        ),
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: Container(
                        height: 50.h,
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: textGreyColor),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _searchController,
                            focusNode: _searchFocusNode,
                            autofocus: true,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Buscar',
                              hintStyle: style14M.copyWith(
                                color: textLightGreyColor,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                  left: 12.w,
                                  right: 8.w,
                                ),
                                child: Image.asset(
                                  AppAssets.searchIcon44,
                                  height: 20.h,
                                  width: 18,
                                  color: textDarkGreyColor,
                                ),
                              ),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: 40.w,
                                minHeight: 24.h,
                              ),
                              suffixIcon: IconButton(
                                padding: EdgeInsets.only(right: 8.w),
                                icon: Icon(
                                  Icons.close,
                                  size: 20.w,
                                  color: textDarkGreyColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showSearch = false;
                                    _searchController.clear();
                                    // This is the key change - properly unfocusing the node
                                    _searchFocusNode.unfocus();
                                    // Alternative way to ensure keyboard closes
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Chats",
                            style: style24.copyWith(color: darkPurpleColor),
                          ),
                          Image.asset(
                            AppAssets.badgeIcon,
                            height: 60.h,
                            width: 60.w,
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      model.selectedFilter == 'Todos'
                          ? Text(
                            'Tus vacantes',
                            style: style14M.copyWith(color: textDarkGreyColor),
                          )
                          : SizedBox(),
                      10.verticalSpace,
                      model.selectedFilter == 'Todos'
                          ? SizedBox(
                            height: 135.h,
                            child: ListView.builder(
                              itemCount: model.vacancies.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                final vacancy = model.vacancies[index];
                                // Find the matching chat for this vacancy
                                final matchingChat = model.allChats.firstWhere(
                                  (chat) =>
                                      chat.companyName == vacancy.companyName,
                                  orElse:
                                      () => CandidateChatItem(
                                        name: vacancy.companyName ?? 'Unknown',
                                        role: vacancy.jobTitle ?? '',
                                        preview: '',
                                        timestamp: '',
                                        unreadCount: '',
                                        avatarUrl:
                                            vacancy.imageUrl ?? AppAssets.img,
                                        isOnline: false,
                                        companyName: vacancy.companyName,
                                        state: vacancy.state,
                                      ),
                                );

                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      ConversationScreen(
                                        chatItem: matchingChat,
                                        vacancy: vacancy,
                                        chatListModel:
                                            Provider.of<CandidateChatViewModel>(
                                              context,
                                              listen: false,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Container(
                                      width: 275.w,
                                      decoration: BoxDecoration(
                                        color: topChatContainerColor,
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        border: Border.all(
                                          color: topChatContainerBorderColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.w,
                                          vertical: 10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 42.h,
                                                  width: 42.w,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        vacancy.imageUrl
                                                            .toString(),
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 28.h,
                                                  width: 62.w,
                                                  decoration: BoxDecoration(
                                                    color: darkBlueColor
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '¡Match!',
                                                      style: style14M.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: darkBlueColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            20.verticalSpace,
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              vacancy.jobTitle.toString(),
                                              style: style18M.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: blackColor,
                                              ),
                                            ),
                                            4.verticalSpace,
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              '${vacancy.companyName} • ${vacancy.state} • ${vacancy.workMode}',
                                              style: style14M.copyWith(
                                                color: blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          : SizedBox(),
                      20.verticalSpace,
                      Text(
                        'Filtra los chats',
                        style: style16M.copyWith(color: textGreyColor),
                      ),
                      SizedBox(height: 4),

                      ///
                      ///. here i also want to navigate to conversationScreen like as below on listView.separate
                      ///
                      SizedBox(
                        height: 36,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              model.filters.map((f) {
                                final isSelected = f == model.selectedFilter;
                                return Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      model.onClick(f);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      height: 34,
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? brownColor
                                                : transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 1.0,
                                          color: brownColor,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            f,
                                            style: style14M.copyWith(
                                              color:
                                                  isSelected
                                                      ? whiteColor
                                                      : lightBlackColor,
                                            ),
                                          ),
                                          5.horizontalSpace,
                                          isSelected
                                              ? Icon(
                                                Icons.close,
                                                color: whiteColor,
                                                size: 20,
                                              )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                      30.verticalSpace,

                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      model.allChats.isEmpty
                          ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 100.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Image.asset(
                                  //   AppAssets.emptyChatIcon, // Add an appropriate empty state icon
                                  //   height: 120.h,
                                  //   width: 120.w,
                                  //   color: textLightGreyColor,
                                  // ),
                                  20.verticalSpace,
                                  Text(
                                    'No chats found',
                                    style: style16M.copyWith(
                                      color: textLightGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          : ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: model.allChats.length,
                            separatorBuilder:
                                (_, __) =>
                                    Divider(thickness: 0.1, color: greyColor),
                            itemBuilder: (_, index) {
                              final chat = model.allChats[index];
                              final shouldAnimate = model.shouldAnimateDeletion(
                                chat,
                              );

                              return AnimatedContainer(
                                key: ValueKey(
                                  chat.id,
                                ), // Important for proper animation
                                duration: Duration(
                                  seconds: 1,
                                ), // Reduced duration for better UX
                                curve: Curves.fastEaseInToSlowEaseOut,
                                transform:
                                    shouldAnimate
                                        ? Matrix4.translationValues(
                                          -MediaQuery.of(context).size.width,
                                          0,
                                          0,
                                        )
                                        : Matrix4.identity(),
                                onEnd: () {
                                  if (shouldAnimate) {
                                    model.deleteChat(
                                      chat,
                                    ); // Remove after animation completes
                                  }
                                },
                                child: AbsorbPointer(
                                  absorbing:
                                      shouldAnimate, // Disable interaction during animation
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight: 80,
                                      maxHeight: 100,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Get.to(
                                          ConversationScreen(
                                            chatItem: chat,
                                            vacancy: JobVacancyModel(),
                                            chatListModel: Provider.of<
                                              CandidateChatViewModel
                                            >(context, listen: false),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60,
                                            alignment: Alignment.center,
                                            child: Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                CircleAvatar(
                                                  radius: 24,
                                                  backgroundImage: AssetImage(
                                                    chat.avatarUrl,
                                                  ),
                                                ),
                                                if (chat.isOnline)
                                                  Container(
                                                    width: 12,
                                                    height: 12,
                                                    decoration: BoxDecoration(
                                                      color: lightgreenColor,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: whiteColor,
                                                        width: 2,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 8,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        chat.name,
                                                        style: style16B
                                                            .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: blackColor,
                                                            ),
                                                      ),
                                                      if (chat
                                                          .unreadCount!
                                                          .isNotEmpty)
                                                        Container(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                horizontal: 6,
                                                                vertical: 2,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color:
                                                                chat.unreadCount ==
                                                                        'En proceso'
                                                                    ? yellowBrownColor
                                                                        .withOpacity(
                                                                          0.3,
                                                                        )
                                                                    : chat.unreadCount ==
                                                                        'No seleccionado'
                                                                    ? lightBrownColor2
                                                                        .withOpacity(
                                                                          0.3,
                                                                        )
                                                                    : darkgreenColor
                                                                        .withOpacity(
                                                                          0.2,
                                                                        ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  4.r,
                                                                ),
                                                          ),
                                                          child: Text(
                                                            chat.unreadCount!,
                                                            style: style16M.copyWith(
                                                              color:
                                                                  chat.unreadCount ==
                                                                          'En proceso'
                                                                      ? yellowBrownColor
                                                                      : chat.unreadCount ==
                                                                          'No seleccionado'
                                                                      ? lightBrownColor2
                                                                      : darkgreenColor,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: Text(
                                                      chat.role,
                                                      softWrap: false,
                                                      style: style14M.copyWith(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          chat.preview,
                                                          softWrap: false,
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          style: style14M.copyWith(
                                                            color:
                                                                textLightGreyColor,
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        chat.timestamp,
                                                        style: style12M.copyWith(
                                                          color:
                                                              textLightGreyColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
