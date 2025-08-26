import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

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
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_33_percent/register_33_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_44_percent/register_44_screen.dart';

class Candidate33PercentScreen extends StatelessWidget {
  const Candidate33PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister33PercentViewModel(),
      child: Consumer<CandidateRegister33PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(
                  text: 'Continuar',
                  onTap:
                      model.hasMinSelections
                          ? () {
                            Get.to(Candidate33PercentScreen2());
                          }
                          : null,
                  backgroundColor:
                      model.hasMinSelections ? primaryColor : greyColor,
                ),
              ),
              appBar: AppBar(
                backgroundColor: transparent,
                leading: CustomBackButton(),
                centerTitle: true,
                title: Image.asset(
                  AppAssets.appLogo2,
                  scale: 4,
                  height: 40.h,
                  width: 134.w,
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        Center(
                          child: Text(
                            '33%',
                            style: style16M.copyWith(color: lightBlackColor),
                          ),
                        ),

                        ///
                        ///
                        ///
                        4.verticalSpace,
                        ProgressContainer(
                          progressWidth:
                              MediaQuery.of(context).size.width * 0.33,
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
                                offset: Offset(-4, 4),
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
                                  'Habilidades',
                                  style: style20B.copyWith(
                                    color: darkPurpleColor,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  'Selecciona hasta 10 habilidades que mejor describan tu personalidad y capacidades técnicas.',
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
                        /// Button
                        ///
                        5.verticalSpace,
                        Text(
                          'Filtra por tipo de habilidad',
                          style: style16M.copyWith(color: textDarkGreyColor),
                        ),
                        5.verticalSpace,

                        ///
                        ///
                        ///
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(2, (index) {
                            final isSelected =
                                model.selectedCategoryIndex == index;
                            final label =
                                index == 0
                                    ? 'Habilidades humanas'
                                    : 'Habilidades técnicas';

                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  model.selectCategory(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: index == 1 ? 10.w : 7,
                                  ),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(28.r),
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? Colors.red
                                              : darkPurpleColor,
                                      width: 2.w,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: darkPurpleColor,
                                        offset: Offset(-6, 4),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 6,
                                    ),
                                    child: Center(
                                      child: Text(
                                        label,
                                        style: style14M.copyWith(
                                          color:
                                              isSelected
                                                  ? Colors.red
                                                  : textGreyColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
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
                                onChanged: model.filterBySearch,
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
                        40.verticalSpace,
                        Wrap(
                          spacing: 4.w,
                          runSpacing: 5.h,
                          children: List.generate(model.displayedItems.length, (
                            index,
                          ) {
                            return CustomShadowIconTextTag(
                              item: model.displayedItems[index],
                              isSelected: model.selectedTags.contains(
                                model.displayedItems[index],
                              ),
                              onTap:
                                  () => model.toggleSelection(
                                    model.displayedItems[index],
                                  ),
                              isShowAddIcon: model.selectedTags.contains(
                                model.displayedItems[index],
                              ),
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

class Candidate33PercentScreen2 extends StatefulWidget {
  const Candidate33PercentScreen2({super.key});

  @override
  State<Candidate33PercentScreen2> createState() =>
      _Candidate33PercentScreen2State();
}

class _Candidate33PercentScreen2State extends State<Candidate33PercentScreen2> {
  final TextEditingController _aboutMeController = TextEditingController();
  bool isButtonEnabled = false;
  int maxChars = 500;

  @override
  void initState() {
    super.initState();
    _aboutMeController.addListener(_validateInput);
  }

  void _validateInput() {
    final text = _aboutMeController.text.trim();
    setState(() {
      isButtonEnabled = text.isNotEmpty && text.length <= maxChars;
    });
  }

  @override
  void dispose() {
    _aboutMeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textLength = _aboutMeController.text.length;
    final isOverLimit = textLength > maxChars;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomButton(
          text: 'Continuar',
          onTap:
              isButtonEnabled
                  ? () {
                    Get.to(Candidate44PercentScreen());
                  }
                  : null,
          backgroundColor: isButtonEnabled ? Colors.red : Colors.grey,
        ),
      ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Center(
                child: Text(
                  '33%',
                  style: style16M.copyWith(color: lightBlackColor),
                ),
              ),
              4.verticalSpace,
              ProgressContainer(
                progressWidth: MediaQuery.of(context).size.width * 0.33,
              ),
              20.verticalSpace,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: darkPurpleColor, width: 1.w),
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
                    children: [
                      Text(
                        'Cuéntanos más de tus habilidades',
                        style: style20B.copyWith(color: darkPurpleColor),
                      ),
                      8.verticalSpace,
                      Text(
                        'Este espacio es para que nos compartas tus habilidades blandas y técnicas de forma libre. Describe tus capacidades en formato de lista.',
                        style: style14M.copyWith(color: textGreyColor),
                        textAlign: TextAlign.start,
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          const Text(''),
                          const Spacer(),
                          Text(
                            'Máximo 500 caracteres',
                            style: style16B.copyWith(color: darkPurpleColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  Text(
                    'Acerca de mí',
                    style: style16B.copyWith(color: textDarkGreyColor),
                  ),
                  const Spacer(),
                  Text(
                    '$textLength/500 caracteres',
                    style: style14M.copyWith(
                      color: isOverLimit ? Colors.red : darkPurpleColor,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              TextFormField(
                controller: _aboutMeController,
                maxLines: 7,

                decoration: authFieldDecoration.copyWith(
                  hintText:
                      'Ej:¨• Creatividad para campañas digitales • Gestión de redes sociales (Instagram, TikTok, LinkedIn) • Edición básica de video y diseño gráfico con Canva • Conocimientos en Google Ads y Meta Business Suite • Estrategias de posicionamiento y branding • Facilidad para comunicar ideas y trabajar en equipo.¨',
                ),
              ),
              10.verticalSpace,
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Máximo 500 caracteres',
                  style: style14M.copyWith(
                    color: isOverLimit ? Colors.red : textGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
