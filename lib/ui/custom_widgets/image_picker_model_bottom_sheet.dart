import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_16_percent/register_16_view_model.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_recruiter/register_recruiter_view_model.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_style.dart';

class ImagePickerModalBottomSheet extends StatelessWidget {
  const ImagePickerModalBottomSheet({
    super.key,
    required this.islogo,
    this.isProfilePic = false,
  });
  final bool islogo;
  final bool isProfilePic;

  @override
  Widget build(BuildContext context) {
    return Consumer2<Register16ViewModel, RegisterRecruiterViewModel>(
      builder: (context, model, model2, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.close, size: 24),
                ),
              ),

              // Logo
              Image.asset(AppAssets.appLogo2, scale: 4),
              5.verticalSpace,

              // Instruction text
              Text(
                isProfilePic
                    ? 'Te recomendamos utilizar una fotografía presentable y bien iluminada.'
                    : islogo
                    ? 'Elige un logotipo limpio, nítido y bien centrado\npara que tu perfil luzca más profesional.'
                    : 'Te recomendamos utilizar una fotografía presentable y bien iluminada.',
                textAlign: TextAlign.center,
                style: style16M.copyWith(color: lightBlackColor),
              ),
              20.verticalSpace,

              // Gallery option
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.image_outlined,
                  size: 28,
                  color: lightBlackColor,
                ),
                title: Text('Elegir de la biblioteca', style: style16M),
                onTap: () {
                  if (isProfilePic) {
                    model2.pickFromGallery(isProfilePic: isProfilePic);
                    Navigator.pop(context);
                  } else {
                    model.pickFromGallery(isLogo: islogo);
                    Navigator.pop(context);
                  }
                },
              ),

              // Camera option
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.camera_alt_outlined,
                  size: 28,
                  color: lightBlackColor,
                ),
                title: Text('Tomar foto', style: style16M),
                onTap: () {
                  if (isProfilePic) {
                    model2.pickFromCamera(isProfilePic: isProfilePic);
                    Navigator.pop(context);
                  } else {
                    model.pickFromCamera(isLogo: islogo);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
