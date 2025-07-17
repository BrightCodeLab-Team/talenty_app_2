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
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        if (await imageFile.exists()) {
          // Verify file exists
          switch (index) {
            case 0:
              _mainImage = imageFile;
              break;
            case 1:
              _image2 = imageFile;
              break;
            case 2:
              _image3 = imageFile;
              break;
          }
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
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
}
