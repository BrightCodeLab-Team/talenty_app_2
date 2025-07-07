import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key, this.hasBackButton = true});
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          hasBackButton
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
      children: [
        if (hasBackButton)
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4E4E4E),
              ),
              child: Icon(Icons.arrow_back, color: whiteColor),
            ),
          ),
        Image.asset(AppAssets.appLogo2, scale: 4),

        if (hasBackButton)
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(shape: BoxShape.circle),
          ),
      ],
    );
  }
}
