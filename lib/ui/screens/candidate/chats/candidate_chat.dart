import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/mas/main_menu_screen/candidate_mas_screen.dart';

class CandidateChatScreen extends StatefulWidget {
  const CandidateChatScreen({super.key});

  @override
  State<CandidateChatScreen> createState() => _CandidateChatScreenState();
}

class _CandidateChatScreenState extends State<CandidateChatScreen> {
  bool isDisponible = false;
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
                      horizontal: 15.w,
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
                  SizedBox(
                    height: 16.h,
                    width: 16.w,
                    child: Icon(Icons.help, color: arrowColor),
                  ),
                  15.0.horizontalSpace,
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Image(
                      image: AssetImage(AppAssets.searchIcon44),
                      color: arrowColor,
                      height: 18.h,
                      width: 18.w,
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
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
                    Text(
                      'Tus vacantes',
                      style: style14M.copyWith(color: textDarkGreyColor),
                    ),

                    SizedBox(
                      height: 140.h,
                      child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (BuildContext context, int index) {
                          return
                          ///
                          /// 1. List of job on top of chat screen
                          ///
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Container(
                              width: 275.w,
                              // height: 121.h,
                              decoration: BoxDecoration(
                                color: topChatContainerColor,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: topChatContainerBorderColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 15.w,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 42.h,
                                          width: 42.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(AppAssets.img2),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),

                                        ///
                                        ///. match un match container
                                        ///
                                        Container(
                                          height: 28.h,
                                          width: 62.w,
                                          decoration: BoxDecoration(
                                            color: darkBlueColor.withOpacity(
                                              0.2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '¡Match!',
                                              style: style14M.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: darkBlueColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    15.verticalSpace,

                                    ///
                                    ///. job title
                                    ///
                                    Text(
                                      'Marketing Intern',
                                      style: style18M.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: blackColor,
                                      ),
                                    ),
                                    8.verticalSpace,
                                    Text(
                                      'Puma • Coyoacán, CDMX • Presencial',
                                      style: style14M.copyWith(
                                        color: blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );

                          ///
                          ///. top jobs container end
                          /// ;
                        },
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      'Filtra los chats',
                      style: style16M.copyWith(color: textGreyColor),
                    ),
                    SizedBox(height: 8),
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
                                      vertical: 8,
                                      horizontal: 16,
                                    ),
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected ? brownColor : transparent,
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
                    Expanded(
                      child: ListView.separated(
                        itemCount: model.chats.length,
                        separatorBuilder:
                            (_, __) =>
                                Divider(thickness: 0.1, color: greyColor),
                        itemBuilder: (_, idx) {
                          final chat = model.chats[idx];
                          return ListTile(
                            leading: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(chat.avatarUrl),
                                ),
                                if (chat.isOnline)
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
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
                                  ),
                              ],
                            ),
                            title: Text(
                              chat.name,
                              style: style18B.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat.role,
                                  style: style14M.copyWith(fontSize: 15),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  chat.preview,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: style14M.copyWith(
                                    color: textLightGreyColor,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (chat.unreadCount > 0)
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: brownColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '${chat.unreadCount}',
                                      style: style12M.copyWith(
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                Text(
                                  chat.timestamp,
                                  style: style12M.copyWith(color: greyColor),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Navigate to chat detail
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
