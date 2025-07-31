import 'package:flutter/services.dart' show SystemNavigator;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/mas/delete_account/delete_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

class CandidateDeleteAccountViewModel extends BaseViewModel {
  void handleDeleteAccount() async {
    Get.dialog(
      DeleteAccountConfirmationDialog(
        onConfirmDelete: () async {
          Get.back();
          Get.dialog(
            const DeletingAccountProgressDialog(),
            barrierDismissible: false,
          );

          await Future.delayed(const Duration(seconds: 2));
          Get.back();
          SystemNavigator.pop();
        },
      ),
      barrierDismissible: true,
    );
  }
}

class DeletingAccountProgressDialog extends StatelessWidget {
  const DeletingAccountProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.deleteAccountGif, scale: 4),
            8.horizontalSpace,
            Text(
              'Cerrando Sesión',
              style: style16M.copyWith(color: darkPurpleColor),
            ),
          ],
        ),
      ),
    );
  }
}
