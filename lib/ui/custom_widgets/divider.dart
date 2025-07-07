import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: textGreyColor.withOpacity(0.3));
  }
}
