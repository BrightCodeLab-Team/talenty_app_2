// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/notifications.dart';
import 'package:talenty_app/ui/screens/company/notifications/notification_view_model.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotificationViewModel(),
      child: Consumer<NotificationViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          backgroundColor: lightBlackColor,
                          child: const Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          ),
                        ),
                      ),

                      Image.asset(AppAssets.appLogo2, scale: 6),
                      Image.asset(AppAssets.badgeIcon, scale: 4),
                    ],
                  ),
                  20.verticalSpace,
                  Text(
                    'notifications'.tr,
                    style: GoogleFonts.lora(
                      textStyle: style16M.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  8.verticalSpace,

                  model.notifications.isNotEmpty && model.notifications != null
                      ? Expanded(
                        child: ListView.separated(
                          itemCount: model.notifications.length,

                          separatorBuilder:
                              (_, __) => const Divider(
                                height: 32,
                                color: Color(0xFFE6E6E6),
                              ),
                          itemBuilder: (context, index) {
                            final notification = model.notifications[index];
                            return NotficationCard(
                              notification: notification,
                              onTap: () {
                                model.removeNotification(index);
                              },
                            );
                          },
                        ),
                      )
                      : Expanded(
                        child: Center(
                          child: Text(
                             'You don`t have any active vacancies yet'.tr,
                            style: style20M,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotficationCard extends StatelessWidget {
  const NotficationCard({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final NotificationModel notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: primaryColor,
          radius: 22,
          child: Icon(Icons.notifications_none, color: whiteColor, size: 22),
        ),
        3.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: GoogleFonts.sourceSans3(
                  textStyle: style16M.copyWith(
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                notification.subtitle,
                style: GoogleFonts.sourceSans3(
                  textStyle: style14M.copyWith(
                    fontWeight: FontWeight.w400,
                    color: lightBlackColor,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                notification.time,
                style: GoogleFonts.sourceSans3(
                  textStyle: style14M.copyWith(
                    fontWeight: FontWeight.w400,
                    color: greyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 22, color: Colors.grey),
          onPressed: onTap,
        ),
      ],
    );
  }
}
