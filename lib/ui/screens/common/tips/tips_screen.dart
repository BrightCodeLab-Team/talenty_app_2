// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/screens/common/tips/tips_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class TipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TipsViewModel(),
      child: Consumer<TipsViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  left: 16.0,
                  top: 40,
                ),
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
                      ],
                    ),
                    20.verticalSpace,
                    Text(
                      "Tips",
                      style: GoogleFonts.lora(
                        textStyle: style16M.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Encuentra aquí una recopilación de consejos, buenas prácticas y recomendaciones personalizadas para ayudarte a sacar el mayor provecho de la plataforma.',
                      style: GoogleFonts.sourceSans3(
                        textStyle: style14M.copyWith(
                          fontWeight: FontWeight.w400,
                          color: greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Para tu próxima entrevista:',
                      style: GoogleFonts.sourceSans3(
                        textStyle: style16M.copyWith(
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 300,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.tipsList.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        separatorBuilder:
                            (context, index) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final tip = model.tipsList[index];
                          return Container(
                            width: 270,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: greyColor, width: 1.2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      tip.imageUrl ?? '',
                                      height: 130,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    tip.title ?? '',
                                    style: GoogleFonts.roboto(
                                      textStyle: style18M.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    tip.description ?? '',
                                    style: GoogleFonts.roboto(
                                      textStyle: style16M.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: greyColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    final url = Uri.parse(
                                      'https://viajespremium.com.mx/',
                                    );
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(
                                        url,
                                        mode: LaunchMode.externalApplication,
                                      );
                                    } else {
                                      // Optionally handle the error
                                      print('Could not launch $url');
                                      // You might want to show a snackbar or alert to the user here
                                    }
                                  },

                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: greyColor,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.touch_app_outlined,
                                          size: 18,
                                          color: lightBlackColor,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Conoce más',
                                          style: GoogleFonts.roboto(
                                            textStyle: style16M.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: lightBlackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Desarrolla tu networking:',
                      style: GoogleFonts.sourceSans3(
                        textStyle: style16M.copyWith(
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 300,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.tipsList.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        separatorBuilder:
                            (context, index) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final tip = model.tipsList[index];
                          return Container(
                            width: 270,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      tip.imageUrl ?? '',
                                      height: 130,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    tip.title ?? '',
                                    style: GoogleFonts.roboto(
                                      textStyle: style18M.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    tip.description ?? '',
                                    style: GoogleFonts.roboto(
                                      textStyle: style16M.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: greyColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: greyColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.touch_app_outlined,
                                        size: 18,
                                        color: lightBlackColor,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Conoce más',
                                        style: GoogleFonts.roboto(
                                          textStyle: style16M.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: lightBlackColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
