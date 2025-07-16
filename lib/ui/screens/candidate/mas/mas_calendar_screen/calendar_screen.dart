// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:talenty_app/core/constants/app_assets.dart';
// import 'package:talenty_app/core/constants/colors.dart';
// import 'package:talenty_app/core/constants/text_style.dart';
// import 'package:intl/intl.dart';
// import 'package:talenty_app/ui/custom_widgets/back_button.dart';
// import 'package:talenty_app/ui/screens/candidate/mas/mas_calendar_screen/candidate_calendar_screen.dart';

// class CandidateMasCalendarScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => MasCalendarViewModel(),
//       child: Consumer<MasCalendarViewModel>(
//         builder: (context, vm, _) {
//           final now = DateTime.now();
//           final currentMonth = DateFormat.MMMM('es_ES').format(now);
//           final currentYear = now.year.toString();
//           return Scaffold(
//             backgroundColor: Colors.white,
//             body: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           CustomBackButton(),
//                           const SizedBox(width: 16),
//                           Image.asset(AppAssets.appLogo2, scale: 4),
//                         ],
//                       ),

//                       const SizedBox(height: 24),
//                       Text('Calendario', style: style20B),
//                       const SizedBox(height: 6),
//                       Text(
//                         'En este calendario se mostrarán todas las fechas en las que tengas una entrevista asignada.',
//                         style: style14source,
//                       ),

//                       const SizedBox(height: 24),
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: const Color(0xffFAFAFA),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: cardborderColor),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Selecciona una fecha disponible',
//                               style: style14B,
//                             ),
//                             const SizedBox(height: 16),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   '$currentMonth $currentYear',
//                                   style: style14sourceblack,
//                                 ),
//                                 const Icon(Icons.chevron_left, size: 18),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             GridView.builder(
//                               shrinkWrap: true,
//                               itemCount: 31,
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 7,
//                                     mainAxisSpacing: 10,
//                                     crossAxisSpacing: 10,
//                                     childAspectRatio: 1,
//                                   ),
//                               itemBuilder: (context, index) {
//                                 final day = index + 1;
//                                 final selected = vm.selectedDate?.day == day;
//                                 return GestureDetector(
//                                   onTap:
//                                       () => vm.selectDate(
//                                         DateTime(now.year, now.month, day),
//                                       ),
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color:
//                                             selected
//                                                 ? blackColor
//                                                 : cardborderColor,
//                                       ),
//                                       color:
//                                           selected
//                                               ? blackColor
//                                               : Colors.transparent,
//                                     ),
//                                     child: Text(
//                                       day.toString(),
//                                       style: style14sourceblack.copyWith(
//                                         fontWeight:
//                                             selected
//                                                 ? FontWeight.bold
//                                                 : FontWeight.normal,
//                                         color:
//                                             selected ? whiteColor : blackColor,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(height: 24),
//                       Text('Tu reunión con:', style: style14B),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: secondaryColor,
//                             radius: 30,
//                             child: Image.asset(AppAssets.menulogo, scale: 4),
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               'Marketing Intern\nPuma · Coyoacán, CDMX',
//                               style: style14sourceblack,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 30,
//                             backgroundImage: AssetImage(AppAssets.img2),
//                           ),
//                           const SizedBox(width: 8),
//                           Text('Jorge Pérez', style: style14sourceblack),
//                         ],
//                       ),
//                       10.verticalSpace,
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.asset(AppAssets.watchIcon, scale: 4),
//                           3.horizontalSpace,
//                           Text("Hora 10:", style: style14B.copyWith()),
//                           Text(
//                             "00 am - 10:30 am",
//                             style: style14B.copyWith(
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       5.verticalSpace,
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.asset(AppAssets.watchIcon, scale: 4),
//                           3.horizontalSpace,
//                           Text("Hora 21", style: style14B.copyWith()),
//                           Text(
//                             " de Abril 2025",
//                             style: style14B.copyWith(
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:intl/intl.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/screens/candidate/mas/mas_calendar_screen/candidate_calendar_screen.dart';

class CandidateMasCalendarScreen extends StatefulWidget {
  @override
  _CandidateMasCalendarScreenState createState() =>
      _CandidateMasCalendarScreenState();
}

class _CandidateMasCalendarScreenState
    extends State<CandidateMasCalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MasCalendarViewModel(),
      child: Consumer<MasCalendarViewModel>(
        builder: (context, vm, _) {
          final now = DateTime.now();
          final currentMonth = DateFormat.MMMM('es_ES').format(now);
          final currentYear = now.year.toString();
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomBackButton(),
                          const SizedBox(width: 36),
                          Image.asset(AppAssets.appLogo2, scale: 6),
                        ],
                      ),

                      const SizedBox(height: 24),
                      Text('Calendario', style: style24M),
                      const SizedBox(height: 6),
                      Text(
                        'En este calendario se mostrarán todas las fechas en las que tengas una entrevista asignada.',
                        style: style14source,
                      ),

                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: cardborderColor),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selecciona una fecha disponible',
                              style: style14B,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '$currentMonth $currentYear',
                                  style: style14sourceblack,
                                ),
                                const Icon(Icons.chevron_left, size: 18),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TableCalendar(
                              firstDay: DateTime.utc(2020, 1, 1),
                              lastDay: DateTime.utc(2030, 12, 31),
                              focusedDay: _focusedDay,
                              selectedDayPredicate:
                                  (day) => isSameDay(_selectedDay, day),
                              onDaySelected: (selectedDay, focusedDay) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              },
                              calendarStyle: CalendarStyle(
                                isTodayHighlighted: true,
                                selectedDecoration: BoxDecoration(
                                  color: blackColor,
                                  shape: BoxShape.circle,
                                ),
                                selectedTextStyle: TextStyle(color: whiteColor),
                                todayDecoration: BoxDecoration(
                                  border: Border.all(color: blackColor),
                                  shape: BoxShape.circle,
                                ),
                                todayTextStyle: TextStyle(color: greyColor),
                              ),
                              headerStyle: HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true,
                                leftChevronIcon: Icon(
                                  Icons.chevron_left,
                                  color: blackColor,
                                ),
                                rightChevronIcon: Icon(
                                  Icons.chevron_right,
                                  color: blackColor,
                                ),
                                titleTextStyle: style20B,
                              ),
                              calendarBuilders: CalendarBuilders(
                                defaultBuilder: (context, day, focusedDay) {
                                  if ([
                                    17,
                                    18,
                                    19,
                                    21,
                                    24,
                                    25,
                                    26,
                                    28,
                                    31,
                                  ].contains(day.day))
                                    return Center(
                                      child: Container(
                                        height: 36,
                                        width: 36,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: greyColor,
                                            width: 1,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${day.day}',
                                          style: TextStyle(color: blackColor),
                                        ),
                                      ),
                                    );

                                  return null;
                                },
                              ),
                              // GridView.builder(
                              //   shrinkWrap: true,
                              //   itemCount: 31,
                              //   gridDelegate:
                              //       const SliverGridDelegateWithFixedCrossAxisCount(
                              //         crossAxisCount: 7,
                              //         mainAxisSpacing: 10,
                              //         crossAxisSpacing: 10,
                              //         childAspectRatio: 1,
                              //       ),
                              //   itemBuilder: (context, index) {
                              //     final day = index + 1;
                              //     final selected = vm.selectedDate?.day == day;
                              //     return GestureDetector(
                              //       onTap:
                              //           () => vm.selectDate(
                              //             DateTime(now.year, now.month, day),
                              //           ),
                              //       child: Container(
                              //         alignment: Alignment.center,
                              //         decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           border: Border.all(
                              //             color:
                              //                 selected
                              //                     ? blackColor
                              //                     : cardborderColor,
                              //           ),
                              //           color:
                              //               selected
                              //                   ? blackColor
                              //                   : Colors.transparent,
                              //         ),
                              //         child: Text(
                              //           day.toString(),
                              //           style: style14sourceblack.copyWith(
                              //             fontWeight:
                              //                 selected
                              //                     ? FontWeight.bold
                              //                     : FontWeight.normal,
                              //             color:
                              //                 selected ? whiteColor : blackColor,
                              //           ),
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                      Text('Tu reunión con:', style: style14B),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: secondaryColor,
                            radius: 30,
                            child: Image.asset(AppAssets.menulogo, scale: 4),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Marketing Intern\nPuma · Coyoacán, CDMX',
                              style: style14sourceblack,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppAssets.img2),
                          ),
                          const SizedBox(width: 8),
                          Text('Jorge Pérez', style: style14sourceblack),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AppAssets.watchIcon, scale: 4),
                          3.horizontalSpace,
                          Text("Hora 10:", style: style14B.copyWith()),
                          Text(
                            "00 am - 10:30 am",
                            style: style14B.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      5.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AppAssets.watchIcon, scale: 4),
                          3.horizontalSpace,
                          Text("Hora 21", style: style14B.copyWith()),
                          Text(
                            " de Abril 2025",
                            style: style14B.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
