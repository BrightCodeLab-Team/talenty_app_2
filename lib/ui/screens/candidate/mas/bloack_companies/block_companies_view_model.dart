// // lib/viewmodels/blocked_companies_viewmodel.dart
// import 'package:get/get.dart';
// import 'package:talenty_app/core/constants/app_assets.dart';
// import 'package:talenty_app/core/constants/colors.dart';
// import 'package:talenty_app/core/model/compnay_model/company_model.dart';

// class BlockedCompaniesViewModel extends GetxController {
//   // Observable list of blocked companies
//   RxList<CompanyProfileModel> blockedCompanies = <CompanyProfileModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize with some dummy data
//     _loadBlockedCompanies();
//   }

//   void _loadBlockedCompanies() {
//     // In a real app, you would fetch this from an API or local storage
//     blockedCompanies.value = [
//       CompanyProfileModel(
//         state: 'CDMX',
//         id: '1',
//         companyName: 'Talenty',
//         location: 'Colombia',
//         status: 'Bloqueada',
//         logoUrl: AppAssets.menulogo,
//       ),
//       CompanyProfileModel(
//         state: 'CDMX',
//         id: '2',
//         companyName: 'Rappi food',
//         location: 'México',
//         status: 'Bloqueada',
//         logoUrl: AppAssets.menulogo,
//       ),
//       // Add more dummy companies as needed
//     ];
//   }

//   void unblockCompany(String companyId) {
//     blockedCompanies.removeWhere((company) => company.id == companyId);
//     // In a real app, you would also send an API request to unblock the company
//     Get.snackbar(
//       'Éxito',
//       'Empresa desbloqueada con éxito.',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: greenColor,
//       colorText: whiteColor,
//     );
//   }
// }
