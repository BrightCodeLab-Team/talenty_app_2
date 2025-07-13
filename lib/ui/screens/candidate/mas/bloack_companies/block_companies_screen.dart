// lib/widgets/company_blocked_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';

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
                  Image.asset(AppAssets.menulogo, height: 200.h),
                  20.verticalSpace,
                  Text(
                    'No tienes empresas bloqueadas en este momento.',
                    textAlign: TextAlign.center,
                    style: style16M.copyWith(color: greyColor),
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
                        scale: 5,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.block,
                            size: 80.h,
                            color: greyColor,
                          );
                        },
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
              // Changed from Expanded ListView to direct ListView with shrinkWrap
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
        color: secondaryColor, // Assuming whiteColor is defined
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
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
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: greyColor, // Placeholder for logo
                  // You can use company.logoUrl here with NetworkImage if available
                  child:
                      company.logoUrl.isNotEmpty
                          ? ClipOval(
                            child: Image.network(
                              company.logoUrl,
                              fit: BoxFit.cover,
                              width: 48.r,
                              height: 48.r,
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
                Column(
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
                          // padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(
                              0.1,
                            ), // Assuming redColor
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            company
                                .status
                                .tr, // Use .tr for localization if needed
                            style: style14B.copyWith(
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
              ],
            ),
          ),
          16.verticalSpace,
          CustomButton(
            text: 'Desbloquear',
            onTap: onUnblockPressed,
            backgroundColor: primaryColor, // Assuming redColor
            textColor: whiteColor,
            radius: 8.r,
          ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Optional: Close button if you want one here, otherwise it's just the header
                // IconButton(
                //   icon: Icon(Icons.close),
                //   onPressed: () => Get.back(),
                // ),
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
              style: style14M.copyWith(color: blackColor),
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
              radius: 8.r,
            ),
            12.verticalSpace,
            CustomButton(
              text: 'Cancelar',
              onTap: () {
                Get.back(); // Just close the dialog
              },
              backgroundColor: Colors.transparent, // Transparent background
              textColor: greyColor, // Text color for cancel
              borderColor: greyColor.withOpacity(0.3), // Light border
              radius: 8.r,
            ),
          ],
        ),
      ),
    );
  }
}

///
///. view model
///

class BlockedCompaniesViewModel extends GetxController {
  // Observable list of blocked companies
  RxList<CompanyProfileModel> blockedCompanies = <CompanyProfileModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some dummy data
    _loadBlockedCompanies();
  }

  void _loadBlockedCompanies() {
    // In a real app, you would fetch this from an API or local storage
    blockedCompanies.value = [
      CompanyProfileModel(
        state: 'CDMX',
        id: '1',
        companyName: 'Talenty',
        location: 'Colombia',
        status: 'Bloqueada',
        logoUrl: AppAssets.menulogo,
      ),
      CompanyProfileModel(
        state: 'CDMX',
        id: '2',
        companyName: 'Rappi food',
        location: 'México',
        status: 'Bloqueada',
        logoUrl: AppAssets.menulogo,
      ),
      // Add more dummy companies as needed
    ];
  }

  void unblockCompany(String companyId) {
    blockedCompanies.removeWhere((company) => company.id == companyId);
    // In a real app, you would also send an API request to unblock the company
    Get.snackbar(
      'Éxito',
      'Empresa desbloqueada con éxito.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: greenColor,
      colorText: whiteColor,
    );
  }
}

///
/// model
///
// lib/models/company_profile_model.dart
class CompanyProfileModel {
  final String id; // Unique ID for the company
  final String companyName;
  final String location;
  final String status; // e.g., "Bloqueada" (Blocked), "Activa" (Active)
  final String logoUrl; // Optional: if you have company logos
  final String state;

  CompanyProfileModel({
    required this.id,
    required this.companyName,
    required this.location,
    required this.status,
    this.logoUrl = '', // Default empty if no logo
    required this.state,
  });

  // Optional: Add a factory constructor for easy deserialization from JSON if needed
  factory CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    return CompanyProfileModel(
      state: json['state'] as String,
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      location: json['location'] as String,
      status: json['status'] as String,
      logoUrl: json['logoUrl'] as String? ?? '',
    );
  }

  // Optional: Add a toJson method for easy serialization to JSON if needed
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'location': location,
      'status': status,
      'logoUrl': logoUrl,
    };
  }

  // Helper to create a copy with updated status (e.g., for unblocking)
  CompanyProfileModel copyWith({String? status}) {
    return CompanyProfileModel(
      state: state,
      id: id,
      companyName: companyName,
      location: location,
      status: status ?? this.status,
      logoUrl: logoUrl,
    );
  }
}
