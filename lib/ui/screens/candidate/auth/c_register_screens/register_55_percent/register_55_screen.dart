import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_55_percent/register_55_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_66_percent/register_66_screen.dart';

class Candidate55PercentScreen extends StatelessWidget {
  const Candidate55PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Candidate55PercentRegisterViewModelModel(),
      child: Consumer<Candidate55PercentRegisterViewModelModel>(
        builder:
            (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: transparent,
                leading: Padding(
                  padding: EdgeInsetsGeometry.only(left: 15),
                  child: CustomBackButton(),
                ),
                centerTitle: true,
                title: Image.asset(AppAssets.appLogo2, scale: 4),
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(
                  text: 'Continuar',
                  onTap: () {
                    Get.to(Candidate66PercentScreen());
                  },
                ),
              ),
              body: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Center(
                        child: Text(
                          '55%',
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ),

                      ///
                      ///
                      ///
                      4.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.of(context).size.width * 0.55,
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
                          border: Border.all(color: blackColor, width: 1.w),
                          boxShadow: [
                            BoxShadow(
                              color: blackColor,
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
                                'Cuéntanos de tus hobbies',
                                style: style20B.copyWith(color: blackColor),
                              ),
                              8.verticalSpace,
                              Text(
                                'Selecciona hasta 10 hobbies o intereses personales que te representen.',
                                style: style14M.copyWith(
                                  color: textGreyColor,
                                ), // textGreyColor for the description
                                textAlign: TextAlign.start,
                              ),
                              8.verticalSpace,
                              Row(
                                children: [
                                  Text(''),
                                  Spacer(),
                                  Text(
                                    '0 de 10',
                                    style: style16B.copyWith(color: blackColor),
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
                            border: Border.all(color: blackColor, width: 2.w),
                            boxShadow: [
                              BoxShadow(
                                color: blackColor,
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
                              decoration: authFieldDecoration.copyWith(
                                hintText: 'Busca más habilidades',
                                hintStyle: style16M.copyWith(
                                  color: blackColor,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 25,
                                  color: blackColor,
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
                                ), // Adjust padding as needed
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Center(
                        child: Wrap(
                          spacing: 5.w,
                          runSpacing: 10.h,
                          children: List.generate(model.tagItemsList.length, (
                            index,
                          ) {
                            return CustomShadowIconTextTag(
                              isShowAddIcon: false,
                              item: model.tagItemsList[index],
                            );
                          }),
                        ),
                      ),
                      50.verticalSpace,

                      ///
                      ///
                      ///
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
