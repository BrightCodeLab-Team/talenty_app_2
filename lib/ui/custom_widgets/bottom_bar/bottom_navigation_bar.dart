// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, use_super_parameters, strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

class CustomBottomNavigator extends StatelessWidget {
  final image;
  final text;
  final currentIndex;
  final indexNumber;
  VoidCallback? onPressed;

  CustomBottomNavigator({
    Key? key,
    required this.image,
    required this.currentIndex,
    required this.indexNumber,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "$image",
            height: 20,
            width: 20,
            color:
                currentIndex == indexNumber ? primaryColor : Color(0xffADADAD),
          ),
          Text(
            "$text",
            style: style12M.copyWith(
              fontSize: 10,
              color:
                  currentIndex == indexNumber
                      ? primaryColor
                      : Color(0xffADADAD),
            ),
          ),
        ],
      ),
    );
  }
}
