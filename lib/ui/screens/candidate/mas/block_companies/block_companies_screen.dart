import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/compnay_model/company_model.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/divider.dart';
import 'package:talenty_app/ui/screens/candidate/mas/block_companies/block_companies_view_model.dart';

class BlockedCompaniesScreen extends StatelessWidget {
  final BlockedCompaniesViewModel viewModel = Get.put(
    BlockedCompaniesViewModel(),
  );

  BlockedCompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: CustomBackButton(),
        ),
        title: Image.asset(AppAssets.appLogo2, scale: 4),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: Obx(() {
        if (viewModel.blockedCompanies.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.vacancyEmpty, height: 200.h),
                  20.verticalSpace,
                  Text(
                    'No tienes empresas bloqueadas en este momento.',
                    textAlign: TextAlign.center,
                    style: style16M.copyWith(color: blackColor),
                  ),
                ],
              ),
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    Text(
                      'Empresas bloqueadas',
                      style: style24M.copyWith(color: blackColor),
                    ),
                    20.verticalSpace,
                    Center(
                      child: Image.asset(
                        AppAssets.blockCompaniesImg,
                        scale: 4,
                        // errorBuilder: (context, error, stackTrace) {
                        //   return Icon(
                        //     Icons.block,
                        //     size: 80.h,
                        //     color: greyColor,
                        //   );
                        // },
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      'En esta sección encontrarás las empresas que has bloqueado previamente. Si las desbloqueas, una vez desbloqueadas, podrás ver nuevamente sus ofertas de trabajo y tener la opción de hacer match si lo deseas.'
                          .tr,
                      style: style14B.copyWith(color: blackColor),
                    ),
                    30.verticalSpace,
                  ],
                ),
              ),
              // Re-introducing ListView.builder with shrinkWrap and NeverScrollableScrollPhysics
              ListView.builder(
                shrinkWrap:
                    true, // Important: Makes the ListView take only as much space as its children
                physics:
                    NeverScrollableScrollPhysics(), // Important: Prevents the ListView from scrolling independently
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                itemCount: viewModel.blockedCompanies.length,
                itemBuilder: (context, index) {
                  final company = viewModel.blockedCompanies[index];
                  return CompanyBlockedCard(
                    company: company,
                    onUnblockPressed:
                        () => _showUnblockConfirmationDialog(context, company),
                  );
                },
              ),
              // Add some bottom padding
              20.verticalSpace,
            ],
          ),
        );
      }),
    );
  }

  void _showUnblockConfirmationDialog(
    BuildContext context,
    CompanyProfileModel company,
  ) {
    Get.dialog(
      UnblockConfirmationDialog(
        companyName: company.companyName,
        onConfirmUnblock: () {
          viewModel.unblockCompany(company.id);
        },
      ),
      barrierDismissible: true,
    );
  }
}

///
///. Block company custom widget
///

class CompanyBlockedCard extends StatelessWidget {
  final CompanyProfileModel company;
  final VoidCallback onUnblockPressed;

  const CompanyBlockedCard({
    Key? key,
    required this.company,
    required this.onUnblockPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8), // Assuming whiteColor is defined
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: greyColor, // Placeholder for logo
                  // You can use company.logoUrl here with NetworkImage if available
                  child:
                      company.logoUrl.isNotEmpty
                          ? ClipOval(
                            child: Image.network(
                              company.logoUrl,
                              fit: BoxFit.cover,

                              errorBuilder:
                                  (context, error, stackTrace) => Icon(
                                    Icons.business,
                                    color: whiteColor,
                                  ), // Fallback
                            ),
                          )
                          : Icon(Icons.business, color: whiteColor),
                ),
                2.horizontalSpace,
                Expanded(
                  // Added Expanded to allow text to take available space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            company.companyName,
                            style: style16B.copyWith(
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ), // Assuming blackColor
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 2.h,
                            ), // Added padding
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(
                                0.2,
                              ), // Assuming redColor
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: Text(
                              company
                                  .status
                                  .tr, // Use .tr for localization if needed
                              style: style12M.copyWith(
                                color: primaryColor,
                              ), // Assuming style12R
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            company.location,
                            style: style14M.copyWith(
                              color: textGreyColor,
                            ), // Assuming style14R and greyColor
                          ),
                          Text(
                            ",${company.state}",
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(padding: const EdgeInsets.all(8.0), child: CustomDivider()),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomButton(
              text: 'Desbloquear',
              onTap: onUnblockPressed,
              backgroundColor: primaryColor, // Assuming redColor
              textColor: whiteColor,
              radius: 8.r,
            ),
          ),
          15.verticalSpace,
        ],
      ),
    );
  }
}

///
///. dialog box
///
// lib/widgets/unblock_confirmation_dialog.dart

class UnblockConfirmationDialog extends StatelessWidget {
  final String companyName;
  final VoidCallback
  onConfirmUnblock; // Callback when "Desbloquear empresa" is pressed

  const UnblockConfirmationDialog({
    Key? key,
    required this.companyName,
    required this.onConfirmUnblock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                
              ],
            ),
            // Header with Talenty logo/text, similar to your app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // You might have a specific logo/icon here
                Image.asset(AppAssets.menulogo, height: 24.h),
                SizedBox(width: 8.w),
                Text(
                  'Talenty',
                  style: style16M.copyWith(
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Text(
              '¿Está seguro de que quiere desbloquear a esta empresa?',
              textAlign: TextAlign.center,
              style: style14B.copyWith(color: blackColor),
            ),
            10.verticalSpace,
            Text(
              'No podrás ver sus ofertas de trabajo y tener la opción de hacer match hasta que la desbloquees.',
              textAlign: TextAlign.center,
              style: style16M.copyWith(color: lightBlackColor),
            ),
            24.verticalSpace,
            CustomButton(
              text: 'Desbloquear empresa',
              onTap: () {
                Get.back(); // Pop the dialog first
                onConfirmUnblock(); // Then execute the unblock logic
              },
              backgroundColor: primaryColor,
              textColor: whiteColor,
              radius: 14.r,
            ),
            12.verticalSpace,
            CustomButton(
              text: 'Cancelar',
              onTap: () {
                Get.back(); // Just close the dialog
              },
              backgroundColor: Colors.transparent, // Transparent background
              textColor: blackColor, // Text color for cancel
              borderColor: blackColor, // Light border
              radius: 14.r,
            ),
          ],
        ),
      ),
    );
  }
}
