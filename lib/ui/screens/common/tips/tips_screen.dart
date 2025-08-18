// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

            ///
            /// App Bar
            ///
            appBar: AppBar(
              title: Image.asset(
                AppAssets.appLogo2,
                scale: 6,
                height: 40.h,
                width: 134.w,
              ),
              centerTitle: true,
            ),

            ///
            /// Start Body
            ///
            body: Stack(
              alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
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
                        20.verticalSpace,
                        Text(
                          "Sección de tips",
                          style: GoogleFonts.lora(textStyle: style24M),
                        ),
                        20.verticalSpace,
                        Text(
                          'Aquí encontrarás consejos prácticos y efectivos para prepararte en cada etapa de tu camino profesional. Prepárate, confía en tu talento y ¡haz match con tu próxima gran oportunidad!',
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
                          height: 440.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.tipsList1.length,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            separatorBuilder:
                                (context, index) => const SizedBox(width: 16),
                            itemBuilder: (context, index) {
                              final tip = model.tipsList1[index];
                              return Container(
                                width: 270,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: greyColor,
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
                                        child: Image.asset(
                                          tip.imageUrl ?? '',
                                          height: 192.h,
                                          width: 280.w,
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
                                          textStyle: style20M.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: blackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    8.verticalSpace,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Text(
                                        tip.description ?? '',
                                        style: GoogleFonts.roboto(
                                          textStyle: style16M.copyWith(
                                            color: lightBlackColor2,
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
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        } else {
                                          print('Could not launch $url');
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Could not open the link',
                                              ),
                                            ),
                                          );
                                        }
                                      },

                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            width: 1,
                                            color: greyColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                AppAssets.tablerHandClick,
                                                scale: 5,
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
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        Text(
                          'Desarrolla tu asseting:',
                          style: GoogleFonts.sourceSans3(
                            textStyle: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        SizedBox(
                          height: 430,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.tipsList2.length,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            separatorBuilder:
                                (context, index) => const SizedBox(width: 16),
                            itemBuilder: (context, index) {
                              final tip = model.tipsList2[index];
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
                                        child: Image.asset(
                                          tip.imageUrl ?? '',
                                          height: 192.h,
                                          width: 280.w,
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
                                    8.verticalSpace,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Text(
                                        tip.description ?? '',
                                        style: GoogleFonts.roboto(
                                          textStyle: style16M.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: lightBlackColor2,
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
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        } else {
                                          print('Could not launch $url');
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Could not open the link',
                                              ),
                                            ),
                                          );
                                        }
                                      },

                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            width: 1,
                                            color: greyColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                AppAssets.tablerHandClick,
                                                scale: 5,
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
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        ///
                        ///
                        ///
                        ///
                        ///
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: 260,
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                            ), // Add some vertical spacing
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: greyColor, width: 1.2),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      10,
                                    ),

                                    child: Image.asset(
                                      AppAssets.cImg03,

                                      height: 250.h,
                                      width: 230.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Prepárate para tu\npróxima entrevista',
                                        style: style24B,
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Con esta da videos tendras un exito\nasegurado en tu próxima entrevista de trabajo.',
                                        style: style14sourceblack.copyWith(
                                          fontSize: 14,
                                          color: textGreyColor,
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      GestureDetector(
                                        onTap: () async {
                                          final url = Uri.parse(
                                            'https://viajespremium.com.mx/',
                                          );
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(
                                              url,
                                              mode:
                                                  LaunchMode
                                                      .externalApplication,
                                            );
                                          } else {
                                            print('Could not launch $url');
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Could not open the link',
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 60,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              width: 1,
                                              color: greyColor,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                AppAssets.tablerHandClick,
                                                scale: 5,
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
                                      10.verticalSpace,
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.video_call_outlined,
                                              color: blackColor,
                                              size: 20,
                                            ),
                                            2.horizontalSpace,
                                            Text('10 Videos'),
                                            10.horizontalSpace,
                                            Icon(
                                              Icons.watch_later_outlined,
                                              color: blackColor,
                                              size: 20,
                                            ),
                                            2.horizontalSpace,
                                            Text('25 mins'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///
                        ///
                        ///
                        ///
                        ///
                        Text(
                          'Elabura tu CV como un profesional',
                          style: GoogleFonts.sourceSans3(
                            textStyle: style16M.copyWith(
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                            ),
                          ),
                        ),

                        12.verticalSpace,

                        const SizedBox(height: 12),

                        SizedBox(
                          height: 440,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.tipsList3.length,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            separatorBuilder:
                                (context, index) => const SizedBox(width: 16),
                            itemBuilder: (context, index) {
                              final tip = model.tipsList3[index];
                              return Container(
                                width: 270,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: greyColor,
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
                                        child: Image.asset(
                                          tip.imageUrl ?? '',
                                          height: 192.h,
                                          width: 280.w,
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
                                    8.verticalSpace,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Text(
                                        tip.description ?? '',
                                        style: GoogleFonts.roboto(
                                          textStyle: style16M.copyWith(
                                            color: lightBlackColor2,
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
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        } else {
                                          print('Could not launch $url');
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Could not open the link',
                                              ),
                                            ),
                                          );
                                        }
                                      },

                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            width: 1,
                                            color: greyColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                AppAssets.tablerHandClick,
                                                scale: 5,
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
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        50.verticalSpace,
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Image.asset(AppAssets.logoPartner, scale: 3),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
