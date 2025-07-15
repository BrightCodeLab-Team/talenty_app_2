// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/constants/text_style.dart';

class EditRecruiter extends StatefulWidget {
  @override
  State<EditRecruiter> createState() => _EditRecruiterState();
}

class _EditRecruiterState extends State<EditRecruiter> {
  File? _image;

  Uint8List? _webImage;
  // for web
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      if (kIsWeb) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
      } else {
        setState(() {
          _webImage = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///
      /// start the body
      ///
      body: Stack(
        children: [
          // Background blue section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("$iconsAssets/okk.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Back arrow
                  Positioned(
                    top: 40,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        backgroundColor: lightBlackColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: progressContainerColor,
                        ),
                      ),
                    ),
                  ),

                  // Image.asset('$iconsAssets/okk.png', fit: BoxFit.fill),
                ],
              ),
            ),
          ),
          // White card section
          Positioned(
            top:
                MediaQuery.of(context).size.height *
                0.2, // Adjust to overlap with blue section
            left: 0,
            right: 0,
            bottom: 0,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.h), // Space for profile picture
                      Text('Jessica_Gonzáles_Cruz'.tr, style: style16N),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'professional'.tr,
                          textAlign: TextAlign.center,
                          style: style14sourceblack,
                        ),
                      ),
                      SizedBox(height: 45.h),

                      _buildUserInfoTile(
                        context,
                       'Name'.tr,
                        'Jessica_Gonzáles_Cruz'.tr,
                        onTap: () {},
                      ),
                      SizedBox(height: 29.h),

                      //
                      Divider(height: 10, color: dividerColor),

                      //
                      SizedBox(height: 29.h),
                      _buildUserInfoTile(
                        context,
                        'position'.tr,
                        'Human_Resources'.tr,
                        onTap: () {},
                      ),
                      SizedBox(height: 29.h),

                      //
                      Divider(height: 10, color: dividerColor),

                      //
                      SizedBox(height: 29.h),
                      _buildUserInfoTile(
                        context,
                      'Mail'.tr,
                      'email'.tr,
                        onTap: () {},
                      ),
                      SizedBox(height: 29.h),

                      Divider(height: 10, color: dividerColor),

                      SizedBox(height: 29.h),
                      _buildUserInfoTile(
                        context,
                         'password'.tr,
                        '••••••••',
                        isPassword: true,
                        onTap: () {},
                      ),
                      SizedBox(height: 29.h),

                      Divider(height: 10, color: dividerColor),

                      SizedBox(height: 29.h),
                      _buildUserInfoTile(
                        context,
                       'Company'.tr,
                         'Viajes_PREMIUM'.tr,
                        onTap: () {},
                      ),

                      SizedBox(height: 29.h),

                      Divider(height: 10, color: dividerColor),

                      SizedBox(height: 29.h),

                      _buildUserInfoTile(
                        context,
                     'Record'.tr,
                        '23/Marzo/2025'.tr,
                        showArrow: false,
                        onTap: () {},
                      ),
                      SizedBox(height: 29.h),

                      Divider(height: 10, color: dividerColor),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Profile picture and edit icon
          Positioned(
            top:
                MediaQuery.of(context).size.height * 0.2 -
                60, // Adjust to position on top of the card
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage:
                        _image != null
                            ? FileImage(_image!)
                            : _webImage != null
                            ? MemoryImage(_webImage!)
                            : null,
                    child:
                        (_image == null && _webImage == null)
                            ? Icon(Icons.person, size: 70, color: Colors.grey)
                            : null,
                  ),

                  InkWell(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: primaryColor,
                      child: Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoTile(
    BuildContext context,
    String title,
    String value, {
    required VoidCallback onTap,
    bool isPassword = false,
    bool showArrow = true,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          // Using InkWell to make the row clickable with ripple effect
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 0,
            ), // Adjust padding as needed
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Distribute space
              children: [
                Text(title, style: style16MW),
                Text(isPassword ? '***********' : value, style: style14M),
                if (showArrow)
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: arrowColor,
                    size: 16,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
