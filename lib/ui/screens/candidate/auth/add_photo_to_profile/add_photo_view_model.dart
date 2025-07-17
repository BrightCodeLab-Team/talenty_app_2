import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CandidateAddPhotoViewModel extends ChangeNotifier {
  File? _mainImage;
  File? _image2;
  File? _image3;

  final ImagePicker _picker = ImagePicker();

  File? get mainImage => _mainImage;
  File? get image2 => _image2;
  File? get image3 => _image3;

  Future<void> pickImage(int index) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      switch (index) {
        case 0:
          _mainImage = File(pickedFile.path);
          break;
        case 1:
          _image2 = File(pickedFile.path);
          break;
        case 2:
          _image3 = File(pickedFile.path);
          break;
      }
      notifyListeners(); // Notify listeners that the state has changed
    }
  }

  void clearImage(int index) {
    switch (index) {
      case 0:
        _mainImage = null;
        break;
      case 1:
        _image2 = null;
        break;
      case 2:
        _image3 = null;
        break;
    }
    notifyListeners();
  }

  bool get isMainImageUploaded => _mainImage != null;

  bool get areAllImagesUploaded =>
      _mainImage != null && _image2 != null && _image3 != null;

  // You can add more business logic here, e.g., validation, uploading to server.
}
