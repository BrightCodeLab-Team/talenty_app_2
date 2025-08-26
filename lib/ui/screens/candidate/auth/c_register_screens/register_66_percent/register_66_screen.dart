import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/Containers/progress_container.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';
import 'package:talenty_app/ui/custom_widgets/custom_snack_bar/custom_snack_bar.dart';

import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_66_percent/register_66_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_77_percent/register_77_scren.dart';

class Candidate66PercentScreen extends StatelessWidget {
  const Candidate66PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister66PercentViewModel(),
      child: Consumer<CandidateRegister66PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: transparent,
                leading: CustomBackButton(position: false),
                centerTitle: true,
                title: Image.asset(
                  AppAssets.appLogo2,
                  scale: 4,
                  height: 40.h,
                  width: 134.w,
                ),
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(
                  text: 'Continuar',
                  backgroundColor:
                      model.selectedTags.isEmpty ? greyColor : primaryColor,
                  onTap: () {
                    if (model.selectedTags.isEmpty) {
                      CustomSnackbar.show(
                        backgroundColor: primaryColor,
                        title: "Selecciona un idioma",
                        message:
                            "Por favor selecciona al menos un idioma para continuar.",
                      );
                    } else {
                      Get.to(Candidate77PercentScreen());
                    }
                  },
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        Center(
                          child: Text(
                            '66%',
                            style: style16M.copyWith(color: lightBlackColor),
                          ),
                        ),

                        ///
                        ///
                        ///
                        4.verticalSpace,
                        ProgressContainer(
                          progressWidth:
                              MediaQuery.of(context).size.width * 0.66,
                        ),

                        ///
                        ///
                        ///
                        20.verticalSpace,
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: darkPurpleColor,
                              width: 1.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: darkPurpleColor,
                                offset: Offset(-1.w, 2.w),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 16.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '¿Hablas otro idioma?',
                                  style: style20B.copyWith(
                                    color: darkPurpleColor,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  'Selecciona hasta 10 idiomas que hablas. Esto ayudará a los reclutadores a encontrar oportunidades que se ajusten mejor a tu perfil. Haz clic en un idioma para indicar tu nivel.s',
                                  style: style14M.copyWith(
                                    color: textLightGreyColor,
                                  ), // textGreyColor for the description
                                  textAlign: TextAlign.start,
                                ),
                                8.verticalSpace,
                                Row(
                                  children: [
                                    Text(''),
                                    Spacer(),
                                    Text(
                                      'Máximo 10  idiomas',
                                      style: style16B.copyWith(
                                        color: darkPurpleColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///
                        ///
                        ///
                        10.verticalSpace,

                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(28.r),
                              border: Border.all(
                                color: darkPurpleColor,
                                width: 2.w,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: darkPurpleColor,
                                  offset: Offset(-1.w, 2.w),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              child: TextFormField(
                                onChanged: model.searchTags,
                                decoration: authFieldDecoration.copyWith(
                                  hintText: 'Busca más habilidades',
                                  hintStyle: style16M.copyWith(
                                    color: darkPurpleColor,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 25,
                                    color: darkPurpleColor,
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 10.h,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 5.w,
                          runSpacing: 10.h,
                          children: List.generate(model.filteredTags.length, (
                            index,
                          ) {
                            final item = model.filteredTags[index];
                            return CustomShadowIconTextTagWithoutIcon(
                              isShowAddIcon: false,
                              isSelected: model.isSelected(item),
                              item: item,
                              onTap: () => model.toggleSelection(item),
                            );
                          }),
                        ),

                        50.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
