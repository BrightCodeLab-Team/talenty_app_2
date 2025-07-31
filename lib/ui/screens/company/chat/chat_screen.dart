import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/screens/company/chat/chat_view_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(),
      child: Consumer<ChatViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              /// Start Body
              ///
              body: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Chats",
                          style: GoogleFonts.lora(
                            color: darkPurpleColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Image.asset(AppAssets.appLogo2, scale: 6),
                      ],
                    ),
                    20.verticalSpace,
                    Text(
                      'Tus vacantes',
                      style: style14M.copyWith(color: textGreyColor),
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
