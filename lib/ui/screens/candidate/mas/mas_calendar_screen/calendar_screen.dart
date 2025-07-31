import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
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
  bool _isLocaleInitialized = false;
  final List<int> _availableDates = [17, 18, 19, 21, 24, 25, 26, 28, 31];

  @override
  void initState() {
    super.initState();
    _initializeLocale();
  }

  Future<void> _initializeLocale() async {
    await initializeDateFormatting('es_ES', null);
    setState(() {
      _isLocaleInitialized = true;
    });
  }

  bool _isDateAvailable(DateTime date) {
    return _availableDates.contains(date.day);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLocaleInitialized) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final now = DateTime.now();
    final currentMonth = DateFormat.MMMM('es_ES').format(now);
    final currentYear = now.year.toString();

    return ChangeNotifierProvider(
      create: (_) => MasCalendarViewModel(),
      child: Consumer<MasCalendarViewModel>(
        builder: (context, vm, _) {
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
                                vm.selectDate(selectedDay);
                              },
                              calendarStyle: CalendarStyle(
                                isTodayHighlighted: true,
                                selectedDecoration: BoxDecoration(
                                  color: darkPurpleColor,
                                  shape: BoxShape.circle,
                                ),
                                selectedTextStyle: TextStyle(color: whiteColor),
                                todayDecoration: BoxDecoration(
                                  border: Border.all(color: darkPurpleColor),
                                  shape: BoxShape.circle,
                                ),
                                todayTextStyle: TextStyle(color: greyColor),
                              ),
                              headerStyle: HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true,
                                leftChevronIcon: Icon(
                                  Icons.chevron_left,
                                  color: darkPurpleColor,
                                ),
                                rightChevronIcon: Icon(
                                  Icons.chevron_right,
                                  color: darkPurpleColor,
                                ),
                                titleTextStyle: style20B,
                              ),
                              calendarBuilders: CalendarBuilders(
                                defaultBuilder: (context, day, focusedDay) {
                                  if (_availableDates.contains(day.day)) {
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
                                          style: TextStyle(
                                            color: darkPurpleColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return null;
                                },
                                outsideBuilder: (context, day, focusedDay) {
                                  return Center(
                                    child: Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: lightGreyColor,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${day.day}',
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Show appointment details only if selected date is available
                      if (_selectedDay != null &&
                          _isDateAvailable(_selectedDay!)) ...[
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
