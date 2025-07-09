import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/image_preview_screen.dart';

class Register16ViewModel extends BaseViewModel {
  ///
  /// Controllers 16 screen
  ///
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int descriptionLength = 0;
  File? _logoFile;
  File? get logoFile => _logoFile;
  File? _coverFile;
  File? get coverFile => _coverFile;
  final ImagePicker _picker = ImagePicker();
  // Bool for hardcoded loader
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool titleErrorFlag = false;
  bool descriptionErrorFlag = false;

  String? get titleError => titleErrorFlag ? validateTitle() : null;
  String? get descriptionError =>
      descriptionErrorFlag ? validateDescription() : null;

  bool get isFormFilled =>
      validateTitle() == null && validateDescription() == null;

  Register16ViewModel() {
    titleController.addListener(_onFieldChanged);
    // descriptionController.addListener(_onFieldChanged);
    descriptionController.addListener(_updateDescriptionLength);
  }

  void _updateDescriptionLength() {
    descriptionLength = descriptionController.text.length;
    notifyListeners();
  }

  String? validateTitle() {
    final value = titleController.text.trim();
    if (value.isEmpty) return 'enter_your_company_name'.tr;
    return null;
  }

  String? validateDescription() {
    final value = descriptionController.text.trim();

    if (value.isEmpty) {
      return 'enter_your_company_descrip'.tr;
    } else if (value.length > 500) {
      return "description_limit_exceeded".tr;
    }

    return null;
  }

  void validateForm() {
    titleErrorFlag = true;
    descriptionErrorFlag = true;

    notifyListeners();
  }

  void _onFieldChanged() {
    // existing logic for title and description
    if (titleErrorFlag && validateTitle() == null) titleErrorFlag = false;
    if (descriptionErrorFlag && validateDescription() == null) {
      descriptionErrorFlag = false;
    }

    notifyListeners();
  }

  void setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// Pick from gallery and then crop
  Future<void> pickFromGallery({required bool isLogo}) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    final cropped = await _crop(picked.path);
    if (cropped == null) return;
    if (isLogo) {
      _logoFile = File(cropped.path);
      setIsLoading(true);
      Get.to(() => ImagePreviewScreen(isLogo: true));
      Timer(Duration(seconds: 2), () {
        setIsLoading(false);
      });
    } else {
      _coverFile = File(cropped.path);
      setIsLoading(true);
      Get.to(() => ImagePreviewScreen(isLogo: false));
      Timer(Duration(seconds: 2), () {
        setIsLoading(false);
      });
    }
    notifyListeners();
  }

  /// Take a new photo and then crop
  Future<void> pickFromCamera({required bool isLogo}) async {
    final picked = await _picker.pickImage(source: ImageSource.camera);
    if (picked == null) return;
    final cropped = await _crop(picked.path);
    if (cropped == null) return;
    if (isLogo) {
      _logoFile = File(cropped.path);
      setIsLoading(true);
      Get.to(() => ImagePreviewScreen(isLogo: true));
      Timer(Duration(seconds: 2), () {
        setIsLoading(false);
      });
    } else {
      _coverFile = File(cropped.path);
      setIsLoading(true);
      Get.to(() => ImagePreviewScreen(isLogo: false));
      Timer(Duration(seconds: 2), () {
        setIsLoading(false);
      });
    }
    notifyListeners();
  }

  Future<CroppedFile?> _crop(String sourcePath) {
    log('Inside cropping image');
    return ImageCropper().cropImage(
      sourcePath: sourcePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: primaryColor,
          toolbarWidgetColor: whiteColor,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio4x3,
          ],
        ),
        IOSUiSettings(
          title: 'Cortar foto',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio4x3,
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }
}
