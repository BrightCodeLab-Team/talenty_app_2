import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({super.key, required this.progressWidth});
  final double progressWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: progressContainerColor,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: progressWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
