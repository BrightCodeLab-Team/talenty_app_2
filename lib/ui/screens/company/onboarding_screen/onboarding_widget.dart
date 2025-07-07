import 'package:flutter/material.dart';

import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.sizedBoxHeight,
    required this.imageHeight,
    required this.imageWidth,
  });
  final String title;
  final String description;
  final String image;
  final double sizedBoxHeight;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: sizedBoxHeight,
            child: Image.asset(image, width: imageWidth, height: imageHeight),
          ),
        ),
        Text(title, style: style24N),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: style14M.copyWith(color: textLightGreyColor),
          ),
        ),
      ],
    );
  }
}
