import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/add_photo_to_profile/add_photo_view_model.dart';

class PhotoGuidanceScreen extends StatelessWidget {
  const PhotoGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Guidance')),
      body: const Center(child: Text('This is the photo guidance screen.')),
    );
  }
}

class CandidateAddPhotoScreen extends StatelessWidget {
  const CandidateAddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double mainContainerHeight = 223.h;
    final double secondaryContainerHeight = 223.h;

    return ChangeNotifierProvider(
      create: (context) => CandidateAddPhotoViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: transparent,
          leading: const Padding(
            padding: EdgeInsets.only(left: 15),
            child: CustomBackButton(),
          ),
          title: Image.asset(AppAssets.appLogo2, scale: 4),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Consumer<CandidateAddPhotoViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    Text(
                      'Agrega fotos a tu perfil',
                      style: style24.copyWith(color: blackColor),
                    ),
                    20.verticalSpace,
                    Text(
                      'Puedes subir de 1 a 3 fotos para que tu perfil se vea completo. Si lo deseas, puedes agregar fotos de tu trabajo o proyectos para que los reclutadores te conozcan mejor.',
                      style: style14M.copyWith(color: textGreyColor),
                    ),
                    30.verticalSpace,

                    // Main Image Container (Top)
                    GestureDetector(
                      onTap: () => viewModel.pickImage(0),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1 / 2.2,
                          height: mainContainerHeight,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                            image:
                                viewModel.mainImage != null
                                    ? DecorationImage(
                                      image: FileImage(viewModel.mainImage!),
                                      fit: BoxFit.cover,
                                    )
                                    : null,
                          ),
                          child:
                              viewModel.mainImage == null
                                  ? Stack(
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          AppAssets.cameraIcon2,
                                          scale: 4,
                                        ),
                                      ),
                                      Positioned(
                                        left: 10.0,
                                        bottom: 10.0,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (viewModel.mainImage == null) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          const PhotoGuidanceScreen(),
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                              color: Colors.white.withOpacity(
                                                0.8,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              'Foto principal',
                                              style: style14M.copyWith(
                                                color: textGreyColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  : null,
                        ),
                      ),
                    ),
                    20.verticalSpace,

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => viewModel.pickImage(1),
                            child: Container(
                              height: secondaryContainerHeight,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                                image:
                                    viewModel.image2 != null
                                        ? DecorationImage(
                                          image: FileImage(viewModel.image2!),
                                          fit: BoxFit.cover,
                                        )
                                        : null,
                              ),
                              child:
                                  viewModel.image2 == null
                                      ? Center(
                                        child: Image.asset(
                                          AppAssets.cameraIcon2,
                                          scale: 4,
                                        ),
                                      )
                                      : null,
                            ),
                          ),
                        ),
                        5.horizontalSpace,

                        Expanded(
                          child: GestureDetector(
                            onTap: () => viewModel.pickImage(2),
                            child: Container(
                              height: secondaryContainerHeight,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                                image:
                                    viewModel.image3 != null
                                        ? DecorationImage(
                                          image: FileImage(viewModel.image3!),
                                          fit: BoxFit.cover,
                                        )
                                        : null,
                              ),
                              child:
                                  viewModel.image3 == null
                                      ? Center(
                                        child: Image.asset(
                                          AppAssets.cameraIcon2,
                                          scale: 4,
                                        ),
                                      )
                                      : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '*obligatorio al menos 1 imagen',
                        style: style14M.copyWith(color: textGreyColor),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: CustomButton(
            text: 'Continuar',
            onTap: () {},
            textColor: whiteColor,
            backgroundColor: primaryColor,
          ),
        ),
      ),
    );
  }
}
