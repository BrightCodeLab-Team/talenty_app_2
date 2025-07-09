// ignore_for_file: deprecated_member_use
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';

class MyDataScreen extends StatelessWidget {
  const MyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,

      ///
      /// Start Body
      ///
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              45.verticalSpace,

              ///
              /// Header
              ///
              _header(),
              SizedBox(height: 16),
              Text('Mis Estadísticas', style: style24B),
              //
              SizedBox(height: 16),
              //
              Text(
                'Consulta toda la información recopilada por tu equipo de reclutadores y toma decisiones más acertadas.',
                style: style14source,
              ),
              //
              SizedBox(height: 14.67),

              _buildMatchesRealizadosCard(),
              // Matches Realizados Card
              // _buildChartCard(
              //   context,
              //   title: 'Matches realizados',
              //   value: '20%',
              //   chart: _buildLineChartPlaceholder(),
              // ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(width: 1, color: progressContainerColor),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Vacante Creadas", style: style14M),
                        Text("Datos mensuales.", style: style10),
                      ],
                    ),
                    Divider(color: textDarkGreyColor, thickness: 0.5),
                    20.verticalSpace,
                    SizedBox(
                      height: 200,
                      child: CombinedAnimatedBarChart(
                        type: ChartAnimationType.animatedOnce,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(width: 1, color: progressContainerColor),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Vacante Creadas", style: style14M),
                        Text("Datos mensuales.", style: style10),
                      ],
                    ),
                    Divider(color: textDarkGreyColor, thickness: 0.5),
                    20.verticalSpace,
                    SizedBox(
                      height: 200,
                      child: CombinedAnimatedBarChart(
                        type: ChartAnimationType.looping,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(width: 1, color: progressContainerColor),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Vacante Creadas", style: style14M),
                        Text("Datos mensuales.", style: style10),
                      ],
                    ),
                    Divider(color: textDarkGreyColor, thickness: 0.5),
                    20.verticalSpace,
                    SizedBox(
                      height: 200,
                      child: CombinedAnimatedBarChart(
                        type: ChartAnimationType.interactive,
                      ),
                    ),
                  ],
                ),
              ),

              // pehli baar animate (one time)

              // ya looping animation

              // ya user touch par animate

              // // Vacantes Creadas Card
              // _buildChartCard(
              //   context,
              //   title: 'Vacantes Creadas',
              //   chart: _buildBarChartPlaceholder(),
              // ),
              // //
              // SizedBox(height: 16.h),
              // //
              // Card(
              //   elevation: 4,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadiusGeometry.circular(20.r),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.all(16.0),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text('Entrevistas realizadas', style: style16cart),
              //             Text('Datos mensuales.', style: style12M),
              //           ],
              //         ),
              //         Divider(color: progressContainerColor),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

_header() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomBackButton(),
      Spacer(),
      Image.asset(AppAssets.appLogo2, scale: 5),
      SizedBox(),
    ],
  );
}

Widget _buildMatchesRealizadosCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: whiteColor,
      border: Border.all(width: 1, color: progressContainerColor),
      borderRadius: BorderRadius.circular(20),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Matches realizados', style: style16M),
            Text(
              'Datos mensuales.',
              style: style12M.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text('20%', style: style24B),
        const SizedBox(height: 12),
        SizedBox(
          height: 60,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(seconds: 1),
            builder: (context, animationValue, child) {
              return LineChart(
                LineChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: primaryColor,
                      spots: [
                        FlSpot(0, 1.0 * animationValue),
                        FlSpot(1, 1.2 * animationValue),
                        FlSpot(2, 1.1 * animationValue),
                        FlSpot(3, 1.3 * animationValue),
                        FlSpot(4, 1.2 * animationValue),
                        FlSpot(5, 1.4 * animationValue),
                      ],
                      dotData: FlDotData(show: false),
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            primaryColor.withOpacity(
                              0.3,
                            ), // stronger color near the line
                            primaryColor.withOpacity(
                              0.05,
                            ), // very soft fade below
                            Colors.transparent, // fully transparent at bottom
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
// Placeholder for the Line Chart
// Widget _buildLineChartPlaceholder() {
//   return Container(
//     height: 100.h,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: whiteColor,
//       borderRadius: BorderRadius.circular(100.r),
//     ),
//     child: CustomPaint(painter: LineChartPainter()),
//   );
// }

// Placeholder for the Bar Chart
// Widget _buildBarChartPlaceholder() {
//   return Container(
//     height: 200,
//     width: double.infinity,
//     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         // Y-axis labels
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text('10', style: style14sourceblack),
//             Text('8', style: style14sourceblack),
//             Text('6', style: style14sourceblack),
//             Text('4', style: style14sourceblack),
//             Text('2', style: style14sourceblack),
//             Text('0', style: style14sourceblack),
//           ],
//         ),
//         SizedBox(width: 10.h),
//         // Bars
//         _buildBar('Jessica', 3.0),
//         _buildBar('Maria', 6.0),
//         _buildBar('Isabella', 1.5),
//         _buildBar('Alejandro', 4.0),
//         _buildBar('Emmanuel', 10.0),
//       ],
//     ),
//   );
// }

//   Widget _buildBar(String name, double heightFactor) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Expanded(
//           child: Container(
//             width: 7.w,
//             height: 100.h,
//             alignment: Alignment.bottomCenter,
//             child: Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 // Light background bar
//                 Container(
//                   width: 7.w,
//                   height: 200.h,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFFCE4EC), // Light pink/purple
//                     borderRadius: BorderRadius.circular(100.r),
//                   ),
//                 ),
//                 // Actual bar
//                 FractionallySizedBox(
//                   heightFactor: heightFactor / 10.0, // Max height is 10
//                   child: Container(
//                     height: 200.h,
//                     width: 10.w,
//                     decoration: BoxDecoration(
//                       color: primaryColor, // Red color
//                       borderRadius: BorderRadius.circular(100.r),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text(name, style: style10),
//       ],
//     );
//   }
// }

// // Custom Painter for the simplified Line Chart
// class LineChartPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint =
//         Paint()
//           ..color =
//               primaryColor // Red color for the line
//           ..strokeWidth = 2.0
//           ..style = PaintingStyle.stroke;

//     final fillPaint =
//         Paint()
//           ..color = const Color(0x33E53935) // Light red for the fill area
//           ..style = PaintingStyle.fill;

//     final path = Path();
//     // Simulate some data points for the line chart
//     final points = [
//       Offset(size.width * 0.05, size.height * 0.8),
//       Offset(size.width * 0.25, size.height * 0.5),
//       Offset(size.width * 0.45, size.height * 0.7),
//       Offset(size.width * 0.65, size.height * 0.4),
//       Offset(size.width * 0.85, size.height * 0.6),
//       Offset(size.width * 0.95, size.height * 0.3),
//     ];

//     path.moveTo(points.first.dx, points.first.dy);
//     for (int i = 1; i < points.length; i++) {
//       path.lineTo(points[i].dx, points[i].dy);
//     }

//     canvas.drawPath(path, paint);

//     // Draw fill area below the line
//     final fillPath = Path.from(path);
//     fillPath.lineTo(points.last.dx, size.height);
//     fillPath.lineTo(points.first.dx, size.height);
//     fillPath.close();
//     canvas.drawPath(fillPath, fillPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

class AnimatedBarChart extends StatefulWidget {
  @override
  _AnimatedBarChartState createState() => _AnimatedBarChartState();
}

class _AnimatedBarChartState extends State<AnimatedBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<double> targetValues = [3, 6, 2, 4, 10]; // your final bar heights
  // final Color primaryColor = primaryColor; // replace with your color
  final TextStyle style14B = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<BarChartGroupData> generateBarGroups(double animValue) {
    return List.generate(targetValues.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: targetValues[index] * animValue,
            color: primaryColor,
            width: 16,
            borderRadius: BorderRadius.circular(100),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 10,
              color: primaryColor.withOpacity(0.1),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 10,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      switch (value.toInt()) {
                        case 0:
                          return Text(
                            'Jessica',
                            style: TextStyle(fontSize: 10),
                          );
                        case 1:
                          return Text('María', style: TextStyle(fontSize: 10));
                        case 2:
                          return Text(
                            'Isabella',
                            style: TextStyle(fontSize: 10),
                          );
                        case 3:
                          return Text(
                            'Alejandro',
                            style: TextStyle(fontSize: 10),
                          );
                        case 4:
                          return Text(
                            'Emmanuel',
                            style: TextStyle(fontSize: 10),
                          );
                        default:
                          return SizedBox.shrink();
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    getTitlesWidget: (value, _) {
                      return Text(value.toInt().toString(), style: style14B);
                    },
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              barGroups: generateBarGroups(_animation.value),
            ),
          );
        },
      ),
    );
  }
}

class InteractiveAnimatedBarChart extends StatefulWidget {
  @override
  _InteractiveAnimatedBarChartState createState() =>
      _InteractiveAnimatedBarChartState();
}

class _InteractiveAnimatedBarChartState
    extends State<InteractiveAnimatedBarChart>
    with SingleTickerProviderStateMixin {
  int? selectedBar; // selected bar index
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<double> targetValues = [3, 6, 2, 4, 10];
  final Color primaryColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<BarChartGroupData> generateBarGroups() {
    return List.generate(targetValues.length, (index) {
      final isSelected = index == selectedBar;
      final animatedExtra = isSelected ? _animation.value * 1.5 : 0.0;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: targetValues[index] + animatedExtra,
            color: primaryColor,
            width: 16,
            borderRadius: BorderRadius.circular(100),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 10,
              color: primaryColor.withOpacity(0.1),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 12,
              barTouchData: BarTouchData(
                enabled: true,
                touchCallback: (event, response) {
                  if (response != null && response.spot != null) {
                    setState(() {
                      selectedBar = response.spot!.touchedBarGroupIndex;
                      _controller.forward(from: 0);
                    });
                  }
                },
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      switch (value.toInt()) {
                        case 0:
                          return Text(
                            'Jessica',
                            style: TextStyle(fontSize: 10),
                          );
                        case 1:
                          return Text('María', style: TextStyle(fontSize: 10));
                        case 2:
                          return Text(
                            'Isabella',
                            style: TextStyle(fontSize: 10),
                          );
                        case 3:
                          return Text(
                            'Alejandro',
                            style: TextStyle(fontSize: 10),
                          );
                        case 4:
                          return Text(
                            'Emmanuel',
                            style: TextStyle(fontSize: 10),
                          );
                        default:
                          return SizedBox.shrink();
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    getTitlesWidget: (value, _) {
                      return Text(value.toInt().toString());
                    },
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              barGroups: generateBarGroups(),
            ),
          );
        },
      ),
    );
  }
}

class LoopingAnimatedBarChart extends StatefulWidget {
  @override
  _LoopingAnimatedBarChartState createState() =>
      _LoopingAnimatedBarChartState();
}

class _LoopingAnimatedBarChartState extends State<LoopingAnimatedBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<double> targetValues = [3, 6, 2, 4, 10];
  final Color primaryColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true); // loop up & down

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<BarChartGroupData> generateBarGroups() {
    return List.generate(targetValues.length, (index) {
      // bar height + animated extra (small up & down effect)
      final animatedExtra =
          _animation.value * 1; // adjust 1 for how much up/down
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: targetValues[index] + animatedExtra,
            color: primaryColor,
            width: 16,
            borderRadius: BorderRadius.circular(100),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 10,
              color: primaryColor.withOpacity(0.1),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 12,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      switch (value.toInt()) {
                        case 0:
                          return Text(
                            'Jessica',
                            style: TextStyle(fontSize: 10),
                          );
                        case 1:
                          return Text('María', style: TextStyle(fontSize: 10));
                        case 2:
                          return Text(
                            'Isabella',
                            style: TextStyle(fontSize: 10),
                          );
                        case 3:
                          return Text(
                            'Alejandro',
                            style: TextStyle(fontSize: 10),
                          );
                        case 4:
                          return Text(
                            'Emmanuel',
                            style: TextStyle(fontSize: 10),
                          );
                        default:
                          return SizedBox.shrink();
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    getTitlesWidget: (value, _) {
                      return Text(value.toInt().toString());
                    },
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              barGroups: generateBarGroups(),
            ),
          );
        },
      ),
    );
  }
}

enum ChartAnimationType { animatedOnce, interactive, looping }

class CombinedAnimatedBarChart extends StatefulWidget {
  final ChartAnimationType type;

  CombinedAnimatedBarChart({required this.type});

  @override
  _CombinedAnimatedBarChartState createState() =>
      _CombinedAnimatedBarChartState();
}

class _CombinedAnimatedBarChartState extends State<CombinedAnimatedBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int? selectedBar; // for interactive mode
  final List<double> targetValues = [3, 6, 2, 4, 10];
  // final Color primaryColr = primaryColor;
  final TextStyle style14B = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();

    if (widget.type == ChartAnimationType.animatedOnce) {
      _controller = AnimationController(
        duration: Duration(milliseconds: 1500),
        vsync: this,
      )..forward();
    } else if (widget.type == ChartAnimationType.looping) {
      _controller = AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this,
      )..repeat(reverse: true);
    } else if (widget.type == ChartAnimationType.interactive) {
      _controller = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this,
      );
    }

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<BarChartGroupData> generateBarGroups() {
    if (widget.type == ChartAnimationType.animatedOnce) {
      return List.generate(targetValues.length, (index) {
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: targetValues[index] * _animation.value,
              color: primaryColor,
              width: 16,
              borderRadius: BorderRadius.circular(100),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 10,
                color: primaryColor.withOpacity(0.1),
              ),
            ),
          ],
        );
      });
    } else if (widget.type == ChartAnimationType.interactive) {
      return List.generate(targetValues.length, (index) {
        final isSelected = index == selectedBar;
        final animatedExtra = isSelected ? _animation.value * 1.5 : 0.0;
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: targetValues[index] + animatedExtra,
              color: primaryColor,
              width: 16,
              borderRadius: BorderRadius.circular(100),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 10,
                color: primaryColor.withOpacity(0.1),
              ),
            ),
          ],
        );
      });
    } else if (widget.type == ChartAnimationType.looping) {
      return List.generate(targetValues.length, (index) {
        final animatedExtra = _animation.value * 1; // adjust effect
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: targetValues[index] + animatedExtra,
              color: primaryColor,
              width: 16,
              borderRadius: BorderRadius.circular(100),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 10,
                color: primaryColor.withOpacity(0.1),
              ),
            ),
          ],
        );
      });
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 12,
            barTouchData: BarTouchData(
              enabled: widget.type == ChartAnimationType.interactive,
              touchCallback: (event, response) {
                if (widget.type == ChartAnimationType.interactive &&
                    response != null &&
                    response.spot != null) {
                  setState(() {
                    selectedBar = response.spot!.touchedBarGroupIndex;
                    _controller.forward(from: 0);
                  });
                }
              },
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    switch (value.toInt()) {
                      case 0:
                        return _text(text: 'Jessica');
                      case 1:
                        return _text(text: 'María');

                      case 2:
                        return _text(text: 'Isabella');

                      case 3:
                        return _text(text: 'Alejandro');

                      case 4:
                        return _text(text: 'Emmanuel');

                      default:
                        return SizedBox.shrink();
                    }
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 2,
                  getTitlesWidget: (value, _) {
                    return Text(value.toInt().toString(), style: style14B);
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: generateBarGroups(),
          ),
        );
      },
    );
  }
}

_text({required String text}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text('$text', style: TextStyle(fontSize: 10)),
  );
}
