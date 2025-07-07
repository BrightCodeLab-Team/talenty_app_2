import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/others/base_view_model.dart';
import '../register_company/image_preview_screen.dart';

class RegisterRecruiterViewModel extends BaseViewModel {
  /// Para “Nombre(s)”
  final TextEditingController nombresController = TextEditingController();

  /// Para “Apellido paterno”
  final TextEditingController apellidoPaternoController =
      TextEditingController();

  /// Para “Apellido materno”
  final TextEditingController apellidoMaternoController =
      TextEditingController();

  /// Para “¿Qué cargo ocupas en la empresa?”
  final TextEditingController cargoController = TextEditingController();

  /// Para “¿Cómo te describirías profesionalmente?”
  final TextEditingController descripcionProfesionalController =
      TextEditingController();

  // Picking Recruiter Image
  final ImagePicker _picker = ImagePicker();

  File? _profilePic;
  File? get profilePic => _profilePic;

  // Bool for hardcoded loader
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void updateFormValidity() {
    notifyListeners();
  }

  /// Pick from gallery and then crop
  Future<void> pickFromGallery({required bool isProfilePic}) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    final cropped = await _crop(picked.path);
    if (cropped == null) return;

    _profilePic = File(cropped.path);
    setIsLoading(true);
    Get.to(() => ImagePreviewScreen(isProfilePic: true, isLogo: false));
    Timer(Duration(seconds: 2), () {
      setIsLoading(false);
    });

    notifyListeners();
  }

  /// Pick from gallery and then crop
  // Future<void> pickFromGallery({required bool isProfilePic}) async {
  //   final picked = await _picker.pickImage(source: ImageSource.gallery);
  //   if (picked == null) return;
  //   final cropped = await _crop(picked.path);
  //   if (cropped == null) return;
  //   if (isProfilePic) {
  //     _profilePic = File(cropped.path);
  //     setIsLoading(true);
  //     Get.to(() => ImagePreviewScreen(isProfilePic: true, isLogo: false));
  //     Timer(Duration(seconds: 2), () {
  //       setIsLoading(false);
  //     });
  //   } else {
  //     _profilePic = File(cropped.path);
  //     setIsLoading(true);
  //     Get.to(() => ImagePreviewScreen(isProfilePic: true, isLogo: false));
  //     Timer(Duration(seconds: 2), () {
  //       setIsLoading(false);
  //     });
  //   }
  //   notifyListeners();
  // }

  /// Take a new photo and then crop
  Future<void> pickFromCamera({required bool isProfilePic}) async {
    final picked = await _picker.pickImage(source: ImageSource.camera);
    if (picked == null) return;
    final cropped = await _crop(picked.path);
    if (cropped == null) return;

    _profilePic = File(cropped.path);
    setIsLoading(true);
    Get.to(() => ImagePreviewScreen(isProfilePic: true, isLogo: false));
    Timer(Duration(seconds: 2), () {
      setIsLoading(false);
    });

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

  ///
  /// 83 percent screen validation
  ///
  // final nombresController = TextEditingController();
  // final apellidoPaternoController = TextEditingController();
  // final apellidoMaternoController = TextEditingController();
  // final cargoController = TextEditingController();
  // final descripcionProfesionalController = TextEditingController();

  bool nombresError = false;
  bool apellidoPaternoError = false;
  bool apellidoMaternoError = false;
  bool cargoError = false;
  bool descripcionError = false;

  RegisterRecruiterViewModel() {
    init();
  }
  void init() {
    nombresController.addListener(() {
      if (nombresError && nombresController.text.trim().isNotEmpty) {
        nombresError = false;
        notifyListeners();
      }
    });

    apellidoPaternoController.addListener(() {
      if (apellidoPaternoError &&
          apellidoPaternoController.text.trim().isNotEmpty) {
        apellidoPaternoError = false;
        notifyListeners();
      }
    });

    apellidoMaternoController.addListener(() {
      if (apellidoMaternoError &&
          apellidoMaternoController.text.trim().isNotEmpty) {
        apellidoMaternoError = false;
        notifyListeners();
      }
    });

    cargoController.addListener(() {
      if (cargoError && cargoController.text.trim().isNotEmpty) {
        cargoError = false;
        notifyListeners();
      }
    });

    descripcionProfesionalController.addListener(() {
      if (descripcionError &&
          descripcionProfesionalController.text.trim().isNotEmpty) {
        descripcionError = false;
        notifyListeners();
      }
    });
  }

  bool get isRecruiter83FormValid {
    return nombresController.text.trim().isNotEmpty &&
        apellidoPaternoController.text.trim().isNotEmpty &&
        apellidoMaternoController.text.trim().isNotEmpty &&
        cargoController.text.trim().isNotEmpty &&
        descripcionProfesionalController.text.trim().isNotEmpty;
  }

  void validateRecruiter83Form() {
    nombresError = nombresController.text.trim().isEmpty;
    apellidoPaternoError = apellidoPaternoController.text.trim().isEmpty;
    apellidoMaternoError = apellidoMaternoController.text.trim().isEmpty;
    cargoError = cargoController.text.trim().isEmpty;
    descripcionError = descripcionProfesionalController.text.trim().isEmpty;
    notifyListeners();
  }

  @override
  void dispose() {
    nombresController.dispose();
    apellidoPaternoController.dispose();
    apellidoMaternoController.dispose();
    cargoController.dispose();
    descripcionProfesionalController.dispose();
    super.dispose();
  }
}
