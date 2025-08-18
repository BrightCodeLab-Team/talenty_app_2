import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart'; // Assuming you have your colors defined here
import 'package:talenty_app/core/constants/text_style.dart'; // Assuming your text styles are here
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/add_photo_to_profile/add_photo_screen.dart';

class CandidateAddPhotoTipsScreen extends StatelessWidget {
  CandidateAddPhotoTipsScreen({super.key});

  // --- REPLACE THIS WITH YOUR ACTUAL DATA FROM THE 3 IMAGES ---
  // Example placeholder data:
  final List<TipModel> tipsData = [
    TipModel(
      imagePath: AppAssets.img3,
      borderColor: darkgreenColor,
      description: 'Usa una foto clara y con buena iluminación',
      icon: Icons.check,
    ),
    TipModel(
      imagePath: AppAssets.tipsImg,
      borderColor: primaryColor,
      description: 'Evita selfies y fotos grupalas',
      icon: Icons.close,
    ),
    TipModel(
      imagePath: AppAssets.img3,
      borderColor: darkgreenColor,
      description: 'Usa an atuendo Profisional',
      icon: Icons.check,
    ),
  ];
  // -----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: CustomButton(
          text: 'Agregar foto',
          onTap: () {
            Get.to(CandidateAddPhotoScreen());
          },
          backgroundColor: primaryColor,
        ),
      ),
      appBar: AppBar(
        backgroundColor: transparent,
        leading: CustomBackButton(),
        title: Image.asset(
          AppAssets.appLogo2,
          scale: 4,
          height: 40.h,
          width: 134.w,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,
              Text(
                'Tips para una foto de perfil profesional', // Tips for your photos
                style: style24.copyWith(color: darkPurpleColor),
              ),
              20.verticalSpace,
              SizedBox(
                height: 410,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tipsData.length,
                  padding: EdgeInsets.zero, // Remove default listview padding
                  itemBuilder: (context, index) {
                    final tip = tipsData[index];
                    return Padding(
                      padding: EdgeInsets.all(10), // Space between cards
                      child: _TipCard(tip: tip),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget for each Tip Card
class _TipCard extends StatelessWidget {
  final TipModel tip;

  const _TipCard({required this.tip});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      //width: 312,
      decoration: BoxDecoration(
        // color: greyColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: tip.borderColor, width: 2),
                ),
                child: Center(
                  child: Icon(
                    tip.icon,
                    color: tip.borderColor,
                    size: 12,
                    weight: 100,
                  ),
                ),
              ),
              3.horizontalSpace,
              Text(
                tip.description,
                style: style14M.copyWith(color: textLightGreyColor),
              ),
            ],
          ),
          10.verticalSpace,
          Center(
            child: Container(
              height: 318,
              width: 265,
              decoration: BoxDecoration(
                border: Border.all(color: tip.borderColor, width: 3),
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: AssetImage(tip.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// lib/data/models/tip_model.dart (or wherever you prefer your models)

///
///. model
///

class TipModel {
  final String imagePath;
  final Color borderColor;
  final IconData icon;
  final String description;

  TipModel({
    required this.imagePath,
    required this.borderColor,
    required this.icon,
    required this.description,
  });
}
