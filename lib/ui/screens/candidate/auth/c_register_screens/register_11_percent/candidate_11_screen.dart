import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/Containers/progress_container.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_menu.dart';
import 'package:talenty_app/ui/custom_widgets/drop_down/custom_drop_down_text_field.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_register_11_percent_view_model.dart';

class CandidateRegister11PercentScreen extends StatelessWidget {
  const CandidateRegister11PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister11PercentViewModel(),
      child: Consumer<CandidateRegister11PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(text: 'Continuar', onTap: () {}),
              ),
              appBar: AppBar(
                backgroundColor: transparent,
                leading: Padding(
                  padding: EdgeInsetsGeometry.only(left: 15),
                  child: CustomBackButton(),
                ),
                centerTitle: true,
                title: Image.asset(AppAssets.appLogo2, scale: 4),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Center(
                        child: Text(
                          '11%',
                          style: style16M.copyWith(color: lightBlackColor),
                        ),
                      ),
                      4.verticalSpace,
                      ProgressContainer(
                        progressWidth: MediaQuery.of(context).size.width * 0.1,
                      ),
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
                                '¿Cuáles son tus estudios?',
                                style: style20B.copyWith(color: blackColor),
                              ),
                              8.verticalSpace,
                              Text(
                                'Registra tu trayectoria académica, indicando el nombre de la universidad, preparatoria o institución de donde provienes.',
                                style: style14M.copyWith(
                                  color: textGreyColor,
                                ), // textGreyColor for the description
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '¿Cuál es tu institución académica?',
                            style: style16B.copyWith(color: lightBlackColor),
                          ),
                          Text(
                            '*obligatorio',
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      TextFormField(
                        decoration: authFieldDecoration.copyWith(
                          hintText:
                              'Ej: Universidad Nacional Autónoma de México',
                        ),
                      ),

                      ///
                      ///
                      ///. below this UI will appear when user first fill the above text field
                      ///
                      ///
                      15.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Grado de especialización',
                            style: style16B.copyWith(color: lightBlackColor),
                          ),
                          Text(
                            '*obligatorio',
                            style: style14M.copyWith(color: textGreyColor),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      _buildDropdown(
                        context,
                        model.dropDown5,
                        model.dropDown5Error,
                        model.dropDownText5,
                        model.firstDropdown,
                        toggle: () {
                          model.toggleDropDown5();
                        },
                        onItemTap: (p0) {
                          model.setDropDownText5(p0);
                          model.toggleDropDown5();
                          model.dropDown5Error = false;
                          model.notifyListeners();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

///
///. single full width drop down

Widget _buildDropdown(
  BuildContext context,
  bool isDroppedDown,
  bool hasError,
  String text,
  List<String> options, {
  final VoidCallback? toggle,
  final Function(String)? onItemTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomDropDownTextField(
        borderColor: hasError ? primaryColor : lightBlackColor,
        hasDroppedDown: isDroppedDown,
        onTap: toggle!,
        text:
            text.isEmpty
                ? '--Selecciona uno--'
                : text, // 👈 this line is changed
      ),
      if (hasError)
        Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            'field_required'.tr,
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
      10.verticalSpace,
      DropDownMenu(
        isDroppedDown: isDroppedDown,
        height: 180,
        options: options,
        onItemTap: (val) => onItemTap!(val),
      ),
    ],
  );
}

///
///.  use in row short width
///

Widget _buildDateDropdown(
  BuildContext context,
  bool isDroppedDown,
  bool hasError,
  String text,
  List<String> options, {
  final VoidCallback? toggle,
  final Function(String)? onItemTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomDropDownTextField(
        borderColor: hasError ? primaryColor : lightBlackColor,
        hasDroppedDown: isDroppedDown,
        onTap: toggle!,
        text:
            text.isEmpty
                ? '--Selecciona uno--'
                : text, // 👈 this line is changed
      ),
      if (hasError)
        Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            'field_required'.tr,
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
      10.verticalSpace,
      DropDownMenu(
        isDroppedDown: isDroppedDown,
        height: 180,
        options: options,
        onItemTap: (val) => onItemTap!(val),
      ),
    ],
  );
}
