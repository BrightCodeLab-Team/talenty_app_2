// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/divider.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/comapny_profile_screen.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_job_detail/company_job_detail_view_model.dart';

class CompanyJobDetailScreen extends StatelessWidget {
  JobVacancyModel jobVacancyModel;
  CompanyJobDetailScreen({required this.jobVacancyModel});

  final ScrollController _scrollController = ScrollController();

  final List<TagItem> tagItems = [
    TagItem('💪 Resiliencia'),
    TagItem('💡 Pensamiento crítico'),
    TagItem('🧠 Resolución de problemas'),
    TagItem('🕊️ Empatía'),
    TagItem('🗣️ Comunicación asertiva'),
    TagItem('🧘‍️ Manejo del estrés'),
    TagItem('🚀 Proactividad'),
    TagItem('🤝 Trabajo en equipo'),
    TagItem('💻 Uso de la Inteligencia Artificial'),
    TagItem('⏰ Gestión del tiempo'),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompanyJobDetailViewModel(),
      child: Consumer<CompanyJobDetailViewModel>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 286.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF28407B),
                            image: DecorationImage(
                              image: AssetImage(AppAssets.menulogo),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        CustomBackButton(),
                      ],
                    ),
                    _firstSection(),
                    _secondSection(),
                    _thirdSection(),
                    _fourthSection(),
                    _fifthSection(),
                    _sixthSection(),
                    _seventhSection(), //last section
                  ],
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///
  ///. first section
  ///
  Padding _firstSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          15.verticalSpace,
          GestureDetector(
            onTap: () {
              Get.to(CompanyProfileScreen());
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAssets.menulogo, height: 30, width: 30),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Viajes Premium', style: style14M.copyWith()),
                      Text(
                        'Ver Perfil →',
                        style: style12M.copyWith(color: textGreyColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          15.verticalSpace,
          Text(
            '${jobVacancyModel.jobTitle}',
            style: style24B.copyWith(color: blackColor),
          ),
          5.verticalSpace,
          Text(
            '\$${jobVacancyModel.minSalary}-\$${jobVacancyModel.maxSalary}',
            style: style20B.copyWith(color: blackColor),
          ),
          5.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_pin),
              Text(
                "${jobVacancyModel.location}",
                style: style14M.copyWith(color: blackColor),
              ),
            ],
          ),
          5.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.watch_later_outlined),
              Text(
                '${jobVacancyModel.jobType},  Turno de ${jobVacancyModel.workingHours} horas',
                style: style14M.copyWith(color: blackColor),
              ),
            ],
          ),
          CustomDivider(),
        ],
      ),
    );
  }

  ///
  ///.  second section
  ///
  Padding _secondSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            '• Modalidad: Presencial ',
            style: style14M.copyWith(color: lightBlackColor),
          ),
          5.verticalSpace,
          Text(
            '• Días laborales: Lunes a sábados de 09:00 a 19:00 hrs ',
            style: style14M.copyWith(color: lightBlackColor),
          ),
          5.verticalSpace,
          Text(
            '• Incorporación: Puede incorporarse de inmediato. ',
            style: style14M.copyWith(color: lightBlackColor),
          ),
          5.verticalSpace,
          Text(
            '• Frecuencia de pago: Quincenal (cada quincena) ',
            style: style14M.copyWith(color: lightBlackColor),
          ),
          5.verticalSpace,
          Text(
            '• Experiencia previa: No ',
            style: style14M.copyWith(color: lightBlackColor),
          ),

          CustomDivider(),
        ],
      ),
    );
  }

  ///
  ///. third section
  ///
  Padding _thirdSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            'Descripción de la vacante',
            style: style20B.copyWith(color: blackColor),
          ),
          5.verticalSpace,
          Text(
            // 'Buscamos un diseñador creativo con experiencia en diseño gráfico y visual. El candidato ideal debe tener habilidades en el uso de herramientas como Adobe Photoshop, Illustrator y Figma, y ser capaz de crear conceptos visuales atractivos para  diferentes plataformas. Se valorará la capacidad de trabajar de manera autónoma y en equipo, adaptándose a las necesidades del proyecto y manteniendo siempre una estética coherente con la marca. ',
            "${jobVacancyModel.jobDescription}",
            style: style14M.copyWith(color: lightBlackColor),
          ),

          CustomDivider(),
        ],
      ),
    );
  }

  ///
  ///. fourth section
  ///
  Padding _fourthSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            'Habilidades requeridas',
            style: style20B.copyWith(color: blackColor),
          ),
          5.verticalSpace,
          Wrap(
            spacing: 8.w, // Horizontal spacing
            runSpacing: 8.h, // Vertical spacing for new rows
            children: List.generate(tagItems.length, (index) {
              // Display data using index
              return CustomIconTextTag(item: tagItems[index]);
            }),
          ),

          CustomDivider(),
        ],
      ),
    );
  }

  ///
  ///. fifth section
  ///
  Padding _fifthSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            'Beneficiou y prestaciones',
            style: style20B.copyWith(color: blackColor),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '• Sequro médico ',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• vacaciones pagadas',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Horarioa flexible ',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Capacitación y desarrolla profesional ',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• bonos de desempeno',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Comisiones',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Aguinaldo',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Fondo de ohorro',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
              ],
            ),
          ),

          CustomDivider(),
        ],
      ),
    );
  }

  ///
  ///. fifth section
  ///
  Padding _sixthSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text('Requisitos', style: style20B.copyWith(color: blackColor)),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '• Licenciatura en Diseño Gráfico.',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Inglés Intermedio.',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Dominio de Adobe (Illustrator, Photoshop, InDesign, After Effects).',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Manejo de Office (Word, Excel, Power Point). ',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Conocimiento intermedio-avanzado de WordPress y nociones básicas de HTML.',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Familiaridad con técnicas de impresión (Flexografía).',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
                5.verticalSpace,
                Text(
                  '• Creativo, organizado, con atención a los detalles y habilidad para trabajar en equipo.',
                  style: style14M.copyWith(color: lightBlackColor),
                ),
              ],
            ),
          ),

          CustomDivider(),
        ],
      ),
    );
  }

  ///
  ///. third section
  ///
  Padding _seventhSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            'Especificaciones del horaio',
            style: style20B.copyWith(color: blackColor),
          ),
          5.verticalSpace,
          Text(
            'Lunes a viernes de 9:00 a 7:00 pm, sábado de 9:00 am a 10:00 pm',
            style: style14M.copyWith(color: lightBlackColor),
          ),
          20.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: pinkColor),
                      color: whiteColor,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.close, color: pinkColor, size: 30),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _scrollController.animateTo(
                      0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Icon(
                        Icons.arrow_upward,
                        color: blackColor,

                        size: 20,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.favorite, color: Colors.green, size: 30),
                  ),
                ),
                15.verticalSpace,
              ],
            ),
          ),

          CustomDivider(),
        ],
      ),
    );
  }
}

///
///. custom ability widget
///
class TagItem {
  final String text;

  TagItem(this.text);
}

// 2. Create the custom widget
class CustomIconTextTag extends StatelessWidget {
  final TagItem item;

  const CustomIconTextTag({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 150.w, // 💡 Limit the width per tag
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: greyColor),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(item.icon, size: 16, color: Colors.grey[700]),
            SizedBox(width: 4.w),
            Flexible(
              child: Text(
                item.text,
                style: style16M.copyWith(color: textGreyColor),
                overflow: TextOverflow.ellipsis, // prevent overflow
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
