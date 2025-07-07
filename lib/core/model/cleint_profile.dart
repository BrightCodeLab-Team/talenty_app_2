class ClientProfile {
  final String name;
  final int age;
  final String gender;
  final String phone;
  final String email;
  final String date;
  final String notes;

  ClientProfile({
    required this.name,
    required this.age,
    required this.gender,
    required this.phone,
    required this.email,
    required this.date,
    required this.notes,
  });

  // From JSON
  factory ClientProfile.fromJson(Map<String, dynamic> json) {
    return ClientProfile(
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      date: json['date'] ?? '',
      notes: json['notes'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'phone': phone,
      'email': email,
      'date': date,
      'notes': notes,
    };
  }
}
