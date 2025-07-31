// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, sort_child_properties_last, unnecessary_underscores, deprecated_member_use

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
            backgroundColor: whiteColor,
            body: Stack(
              children: [
                ///
                /// Main Content with AppBar
                ///
                Column(
                  children: [
                    ///
                    /// Custom AppBar
                    ///
                    Container(
                      height: kToolbarHeight + 40, // Extra space for overlap
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: lightBlackColor,
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: whiteColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              AppAssets.appLogo2,
                              scale: 6,
                              color: candidatoPrimaryColor,
                            ),
                          ),
                          SizedBox(width: 40),
                        ],
                      ),
                    ),

                    ///
                    /// Body Below AppBar
                    ///
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            Text(
                              "Notificaciones",
                              style: GoogleFonts.lora(
                                textStyle: style16M.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            8.verticalSpace,

                            model.notifications.isNotEmpty
                                ? ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: model.notifications.length,
                                  separatorBuilder:
                                      (_, __) =>
                                          Divider(color: Color(0xFFE6E6E6)),
                                  itemBuilder: (context, index) {
                                    final notification =
                                        model.notifications[index];
                                    return NotficationCard(
                                      notification: notification,
                                      onTap:
                                          () => model.removeNotification(index),
                                    );
                                  },
                                )
                                : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 100),
                                    child: Text(
                                      "Aún no tienes notificaciones nuevas.",
                                      style: style20M,
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                ///
                /// Overlapping BadgeIcon
                ///
                Positioned(
                  top: kToolbarHeight - 20,
                  right: 16,
                  child: Image.asset(AppAssets.badgeIcon, scale: 4),
                ),
              ],
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: candidatoPrimaryColor,
          radius: 18,
          child: Icon(Icons.notifications_none, color: whiteColor, size: 22),
        ),
        10.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    child: Text(
                      notification.title,
                      style: GoogleFonts.sourceSans3(
                        textStyle: style16M.copyWith(
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      child: Image.asset(AppAssets.closeIcon1, scale: 5),
                      onTap: onTap,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: Text(
                  notification.subtitle,
                  style: GoogleFonts.sourceSans3(
                    textStyle: style14M.copyWith(
                      fontWeight: FontWeight.w400,
                      color: lightBlackColor,
                    ),
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
      ],
    );
  }
}
