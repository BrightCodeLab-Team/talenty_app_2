// // lib/models/company_profile_model.dart
// class CompanyProfileModel {
//   final String id; // Unique ID for the company
//   final String companyName;
//   final String location;
//   final String status; // e.g., "Bloqueada" (Blocked), "Activa" (Active)
//   final String logoUrl; // Optional: if you have company logos
//   final String state;

//   CompanyProfileModel({
//     required this.id,
//     required this.companyName,
//     required this.location,
//     required this.status,
//     this.logoUrl = '', // Default empty if no logo
//     required this.state,
//   });

//   // Optional: Add a factory constructor for easy deserialization from JSON if needed
//   factory CompanyProfileModel.fromJson(Map<String, dynamic> json) {
//     return CompanyProfileModel(
//       state: json['state'] as String,
//       id: json['id'] as String,
//       companyName: json['companyName'] as String,
//       location: json['location'] as String,
//       status: json['status'] as String,
//       logoUrl: json['logoUrl'] as String? ?? '',
//     );
//   }

//   // Optional: Add a toJson method for easy serialization to JSON if needed
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'companyName': companyName,
//       'location': location,
//       'status': status,
//       'logoUrl': logoUrl,
//     };
//   }

//   // Helper to create a copy with updated status (e.g., for unblocking)
//   CompanyProfileModel copyWith({String? status}) {
//     return CompanyProfileModel(
//       state: state,
//       id: id,
//       companyName: companyName,
//       location: location,
//       status: status ?? this.status,
//       logoUrl: logoUrl,
//     );
//   }
// }
