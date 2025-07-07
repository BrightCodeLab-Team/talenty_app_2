import 'dart:ui';

class RecruiterModel {
  final String name;
  final String role;
  final String imageUrl;
  final String description;
  final String createdDate;
  final List<TagModel> tags;

  RecruiterModel({
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.description,
    required this.createdDate,
    required this.tags,
  });
}

class TagModel {
  final String label;
  final String value;
  final int count;
  final Color color;

  TagModel({
    required this.label,
    required this.value,
    required this.count,
    required this.color,
  });
}
