import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:intl/intl.dart';
import 'package:talenty_app/ui/screens/calender/calender_view_model.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalendarViewModel(),
      child: Consumer<CalendarViewModel>(
        builder: (context, vm, _) {
          final now = DateTime.now();
          final currentMonth = DateFormat.MMMM('es_ES').format(now);
          final currentYear = now.year.toString();
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: blackColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_back_ios_new, size: 16, color: whiteColor),
                        ),
                        const SizedBox(width: 16),
                        Image.asset(
                       "$staticAssets/talenty_logo.png",
                          height: 30,
                        )
                      ],
                    ),

                    const SizedBox(height: 24),
                    Text('Calendario', style: style20B),
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
                          Text('Selecciona una fecha disponible', style: style14B),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('$currentMonth $currentYear', style: style14sourceblack),
                              const Icon(Icons.chevron_left, size: 18),
                            ],
                          ),
                          const SizedBox(height: 10),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 31,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1,
                            ),
                            itemBuilder: (context, index) {
                              final day = index + 1;
                              final selected = vm.selectedDate?.day == day;
                              return GestureDetector(
                                onTap: () => vm.selectDate(DateTime(now.year, now.month, day)),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: selected ? primaryColor : cardborderColor),
                                    color: selected ? primaryColor.withOpacity(0.1) : Colors.transparent,
                                  ),
                                  child: Text(
                                    day.toString(),
                                    style: style14sourceblack.copyWith(
                                      fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                                      color: selected ? primaryColor : blackColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                    Text('Tu reunión con:', style: style14B),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                            Image.asset( "$dynamicAssets/leopard.png"
                            , height: 28),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text('Marketing Intern\nPuma · Coyoacán, CDMX', style: style14sourceblack),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage( "$dynamicAssets/man.png"),
                        ),
                        const SizedBox(width: 8),
                        Text('Jorge Pérez', style: style14sourceblack),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
