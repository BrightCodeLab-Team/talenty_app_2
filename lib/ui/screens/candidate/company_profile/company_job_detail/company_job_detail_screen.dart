// ignore_for_file: must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/chat_items.dart';
import 'package:talenty_app/core/model/company/your_vacancies.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/candidate/icon_text_tag.dart';
import 'package:talenty_app/ui/custom_widgets/divider.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/chats/conversation/chating_screen.dart';
import 'package:talenty_app/ui/screens/candidate/company_profile/company_profile_screen.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_home/candidate_home_view_model.dart';

class CompanyJobDetailScreen extends StatelessWidget {
  final JobVacancyModel jobVacancyModel;
  final int index; // Add index as a required parameter
  final CandidateHomeViewModel? jobModel;
  final bool fromFirstTab;

  CompanyJobDetailScreen({
    required this.jobVacancyModel,
    required this.index,
    this.jobModel,
    this.fromFirstTab = false,
  });

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
    // final int index = 0;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CandidateHomeViewModel()),
        ChangeNotifierProvider(create: (_) => CandidateChatViewModel()),
      ],
      child: Consumer2<CandidateHomeViewModel, CandidateChatViewModel>(
        builder: (context, model, chatModel, child) {
          return Scaffold(
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
                            image: AssetImage(
                              "${model.vacancies[index].imageUrl}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CustomBackButton(),
                    ],
                  ),
                  if (fromFirstTab)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 20.0,
                        right: 20,
                      ),
                      child: CustomButton(
                        text: 'Enviar mensaje a la empresa',
                        onTap: () {
                          final vacancy = model.vacancies[index];

                          final matchingChat = chatModel.allChats.firstWhere(
                            (chat) => chat.companyName == vacancy.companyName,
                            orElse:
                                () => CandidateChatItem(
                                  name: vacancy.companyName ?? 'Unknown',
                                  role: vacancy.jobTitle ?? '',
                                  preview: '',
                                  timestamp: '',
                                  unreadCount: '',
                                  avatarUrl: vacancy.imageUrl ?? AppAssets.img,
                                  isOnline: false,
                                  companyName: vacancy.companyName,
                                  state: vacancy.state,
                                ),
                          );

                          Get.to(
                            ConversationScreen(
                              chatItem: matchingChat,
                              vacancy: vacancy,
                              chatListModel:
                                  Provider.of<CandidateChatViewModel>(
                                    context,
                                    listen: false,
                                  ),
                            ),
                          );
                        },
                        backgroundColor: primaryColor,
                        textColor: whiteColor,
                        image: Image.asset(
                          AppAssets.chat,
                          color: whiteColor,
                          scale: 4,
                        ),
                      ),
                    ),

                  _firstSection(model),
                  _secondSection(),
                  _thirdSection(model),
                  _fourthSection(),
                  _fifthSection(),
                  _sixthSection(),
                  _seventhSection(context, model, chatModel), //last section
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  ///
  ///. first section
  ///
  Padding _firstSection(
    // CompanyProfileViewModel model
    CandidateHomeViewModel model,
  ) {
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
                    color: darkPurpleColor.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    model.vacancies[index].imageUrl ?? AppAssets.menulogo,
                    height: 30,
                    width: 30,
                  ),
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
            // '${model.companyJobsVacancyList[index].jobTitle}',
            '${model.vacancies[index].jobTitle}',
            style: style24B.copyWith(color: darkPurpleColor),
          ),
          5.verticalSpace,
          Text(
            // '\$${model.companyJobsVacancyList[index].minSalary}-\$${model.companyJobsVacancyList[index].maxSalary}',
            '\$${model.vacancies[index].minSalary}-\$${model.vacancies[index].maxSalary}',
            style: style20M.copyWith(
              color: darkPurpleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          5.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.location, scale: 4, color: darkPurpleColor),
              3.horizontalSpace,
              Text(
                // "${model.companyJobsVacancyList[index].location}",
                "${model.vacancies[index].location}",
                style: style14M.copyWith(color: darkPurpleColor),
              ),
            ],
          ),
          5.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.watch_later_outlined),

              Text(
                // '${model.companyJobsVacancyList[index].jobType},  Turno de ${model.companyJobsVacancyList[index].workingHours} horas',
                '${model.vacancies[index].jobType},  Turno de ${model.vacancies[index].workingHours} horas',
                style: style14M.copyWith(color: darkPurpleColor),
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
  Padding _thirdSection(
    //CompanyProfileViewModel model
    CandidateHomeViewModel model,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            'Descripción de la vacante',
            style: style20B.copyWith(color: darkPurpleColor),
          ),
          5.verticalSpace,
          Text(
            // "${model.companyJobsVacancyList[index].jobDescription}",
            "${model.vacancies[index].jobDescription}",
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
            style: style20B.copyWith(color: darkPurpleColor),
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
            style: style20B.copyWith(color: darkPurpleColor),
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
          Text('Requisitos', style: style20B.copyWith(color: darkPurpleColor)),
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
  Padding _seventhSection(
    BuildContext context,
    CandidateHomeViewModel model,
    CandidateChatViewModel chatModel,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            'Especificaciones del horaio',
            style: style20B.copyWith(color: darkPurpleColor),
          ),
          5.verticalSpace,
          Text(
            'Lunes a viernes de 9:00 a 7:00 pm, sábado de\n9:00 am a 10:00 pm',
            style: style14M.copyWith(color: lightBlackColor),
          ),
          20.verticalSpace,

          if (fromFirstTab)
            // Show column with two buttons when from first tab
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  20.verticalSpace,
                  // First button
                  CustomButton(
                    text: 'Enviar mensaje a la empresa',
                    onTap: () {
                      final vacancy = model.vacancies[index];

                      final matchingChat = chatModel.allChats.firstWhere(
                        (chat) => chat.companyName == vacancy.companyName,
                        orElse:
                            () => CandidateChatItem(
                              name: vacancy.companyName ?? 'Unknown',
                              role: vacancy.jobTitle ?? '',
                              preview: '',
                              timestamp: '',
                              unreadCount: '',
                              avatarUrl: vacancy.imageUrl ?? AppAssets.img,
                              isOnline: false,
                              companyName: vacancy.companyName,
                              state: vacancy.state,
                            ),
                      );

                      Get.to(
                        ConversationScreen(
                          chatItem: matchingChat,
                          vacancy: vacancy,
                          chatListModel: Provider.of<CandidateChatViewModel>(
                            context,
                            listen: false,
                          ),
                        ),
                      );
                    },
                    backgroundColor: primaryColor,
                    textColor: whiteColor,
                    image: Image.asset(
                      AppAssets.chat,
                      color: whiteColor,

                      scale: 4,
                    ),
                  ),
                  10.verticalSpace,
                  // Second button
                  CustomButton(
                    borderColor: brownColor,
                    text: 'Rechazar match',
                    onTap: () {
                      showRejectMatchDialog(context);
                    },
                    backgroundColor: whiteColor,
                    textColor: brownColor,
                  ),
                  20.verticalSpace,
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: blackColor, width: 2.w),
                        color: blackColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.close, color: blackColor, size: 30),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _scrollController.animateTo(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: darkPurpleColor),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Icon(
                          Icons.arrow_upward,
                          color: darkPurpleColor,

                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkgreenColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: darkgreenColor, width: 2.w),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        Icons.favorite,
                        color: darkgreenColor,
                        size: 30,
                      ),
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

  ///
  ///. cancel dialog box
  ///
  void showRejectMatchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Talenty Logo
                Image.asset(AppAssets.appLogo2, scale: 4, height: 40),
                const SizedBox(height: 20),

                Text(
                  '¿Seguro que quieres rechazar éste match?',
                  textAlign: TextAlign.center,
                  style: style16B.copyWith(color: darkPurpleColor),
                ),
                const SizedBox(height: 15),

                // Description text
                Text(
                  'Al rechazar el match, ya no podrás conversar con esta empresa y se eliminará la conexión de forma permanente.',
                  textAlign: TextAlign.center,
                  style: style16M.copyWith(color: darkPurpleColor),
                ),
                const SizedBox(height: 30),

                // "Rechazar match" button
                CustomButton(
                  borderColor: brownColor,
                  text: 'Rechazar match',
                  onTap: () {
                    // Handle reject match logic
                    Navigator.of(context).pop(true);
                  },
                  backgroundColor: primaryColor,
                  textColor: whiteColor,
                ),
                const SizedBox(height: 15),

                // "Cancelar" button
                CustomButton(
                  borderColor: darkPurpleColor,
                  text: 'Cancelar',
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  backgroundColor: whiteColor,
                  textColor: darkPurpleColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
