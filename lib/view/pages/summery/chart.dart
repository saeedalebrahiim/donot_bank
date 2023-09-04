import 'package:donot_bank/controller/provider/transaction_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarChartSample6 extends StatefulWidget {
  BarChartSample6({super.key});

  @override
  State<BarChartSample6> createState() => _BarChartSample6State();
}

class _BarChartSample6State extends State<BarChartSample6>
    with SingleTickerProviderStateMixin {
  final pilateColor = Colors.purple.shade900;

  final cyclingColor = Colors.cyan;

  final quickWorkoutColor = Colors.blue;

  final betweenSpace = 0.2;
  late double deposite = 0;
  late double withdraw = 0;

  getDtata() {
    TranactionState.tranactions.forEach((element) {
      if (element.isDeposite) {
        deposite = deposite + double.parse(element.amount.replaceAll("\$", ""));
      } else {
        withdraw = withdraw + double.parse(element.amount.replaceAll("\$", ""));
      }
    });
  }

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: pilateColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: quickWorkoutColor,
          width: 5,
        ),
        // BarChartRodData(
        //   fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
        //   toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
        //   color: cyclingColor,
        //   width: 5,
        // ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = '';
        break;
      case 2:
        text = '';
        break;
      case 3:
        text = '';
        break;
      case 4:
        text = '';
        break;
      case 5:
        text = '';
        break;
      case 6:
        text = '';
        break;
      case 7:
        text = '';
        break;
      case 8:
        text = '';
        break;
      case 9:
        text = '';
        break;
      case 10:
        text = '  ';
        break;
      case 11:
        text = 'DEC';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  late TabController controller;
  @override
  void initState() {
    getDtata();
    // TODO: implement initState
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: "Daily",
            ),
            Tab(
              text: "Monthly",
            ),
            Tab(
              text: "Year",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Day',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // LegendsListWidget(
                //   legends: [
                //     Legend('Pilates', pilateColor),
                //     Legend('Quick workouts', quickWorkoutColor),
                //     Legend('Cycling', cyclingColor),
                //   ],
                // ),
                const SizedBox(height: 14),
                AspectRatio(
                  aspectRatio: 2,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceBetween,
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(),
                        rightTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: bottomTitles,
                            reservedSize: 20,
                          ),
                        ),
                      ),
                      barTouchData: BarTouchData(enabled: true),
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: false),
                      barGroups: [
                        generateGroupData(0, 2, 3, 2),
                        generateGroupData(1, 2, 5, 1.7),
                        generateGroupData(2, 1.3, 3.1, 2.8),
                        generateGroupData(3, 3.1, 4, 3.1),
                        generateGroupData(4, 0.8, 3.3, 3.4),
                        generateGroupData(5, 2, 5.6, 1.8),
                        generateGroupData(6, 1.3, 3.2, 2),
                        generateGroupData(7, 2.3, 3.2, 3),
                        generateGroupData(8, 2, 4.8, 2.5),
                        generateGroupData(9, 1.2, 3.2, 2.5),
                        generateGroupData(10, 1, 4.8, 3),
                        generateGroupData(11, 2, 4.4, 2.8),
                      ],
                      maxY: 11 + (betweenSpace * 3),
                      extraLinesData: ExtraLinesData(
                        horizontalLines: [
                          HorizontalLine(
                            y: 3.3,
                            color: pilateColor,
                            strokeWidth: 1,
                            dashArray: [20, 4],
                          ),
                          HorizontalLine(
                            y: 8,
                            color: quickWorkoutColor,
                            strokeWidth: 1,
                            dashArray: [20, 4],
                          ),
                          // HorizontalLine(
                          //   y: 11,
                          //   color: cyclingColor,
                          //   strokeWidth: 1,
                          //   dashArray: [20, 4],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //2
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Month',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // LegendsListWidget(
                //   legends: [
                //     Legend('Pilates', pilateColor),
                //     Legend('Quick workouts', quickWorkoutColor),
                //     Legend('Cycling', cyclingColor),
                //   ],
                // ),
                const SizedBox(height: 14),
                AspectRatio(
                  aspectRatio: 2,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceBetween,
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(
                          drawBelowEverything: true,
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                textAlign: TextAlign.left,
                              );
                            },
                          ),
                        ),
                        rightTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: bottomTitles,
                            reservedSize: 20,
                          ),
                        ),
                      ),
                      barTouchData: BarTouchData(enabled: false),
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: false),
                      barGroups: [
                        generateGroupData(0, 2, 3, 2),
                        generateGroupData(1, 2, 5, 1.7),
                        generateGroupData(2, 1.3, 3.1, 2.8),
                        generateGroupData(3, 3.1, 4, 3.1),
                        generateGroupData(4, 0.8, 3.3, 3.4),
                        generateGroupData(5, 2, 5.6, 1.8),
                        generateGroupData(6, 1.3, 3.2, 2),
                        generateGroupData(7, 2.3, 3.2, 3),
                        generateGroupData(8, 2, 4.8, 2.5),
                        generateGroupData(9, 1.2, 3.2, 2.5),
                        generateGroupData(10, 1, 4.8, 3),
                        generateGroupData(11, 2, 4.4, 2.8),
                      ],
                      maxY: 11 + (betweenSpace * 3),
                      extraLinesData: ExtraLinesData(
                        horizontalLines: [
                          HorizontalLine(
                            y: 3.3,
                            color: pilateColor,
                            strokeWidth: 1,
                            dashArray: [20, 4],
                          ),
                          HorizontalLine(
                            y: 8,
                            color: quickWorkoutColor,
                            strokeWidth: 1,
                            dashArray: [20, 4],
                          ),
                          // HorizontalLine(
                          //   y: 11,
                          //   color: cyclingColor,
                          //   strokeWidth: 1,
                          //   dashArray: [20, 4],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //3
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Year',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // LegendsListWidget(
                //   legends: [
                //     Legend('Pilates', pilateColor),
                //     Legend('Quick workouts', quickWorkoutColor),
                //     Legend('Cycling', cyclingColor),
                //   ],
                // ),
                const SizedBox(height: 14),
                Consumer<TranactionState>(
                  builder: (context, value, child) => AspectRatio(
                    aspectRatio: 2,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceBetween,
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(),
                          rightTitles: const AxisTitles(),
                          topTitles: const AxisTitles(),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: bottomTitles,
                              reservedSize: 20,
                            ),
                          ),
                        ),
                        barTouchData: BarTouchData(enabled: true),
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(show: false),
                        barGroups: List.generate(
                            1,
                            (index) => generateGroupData(
                                  index,
                                  deposite,
                                  withdraw,
                                  2.5,
                                )),
                        maxY: withdraw + (betweenSpace * 3) + deposite,
                        extraLinesData: ExtraLinesData(
                          horizontalLines: [
                            HorizontalLine(
                              y: 3.3,
                              color: pilateColor,
                              strokeWidth: 1,
                              dashArray: [20, 4],
                            ),
                            HorizontalLine(
                              y: 8,
                              color: quickWorkoutColor,
                              strokeWidth: 1,
                              dashArray: [20, 4],
                            ),
                            // HorizontalLine(
                            //   y: 11,
                            //   color: cyclingColor,
                            //   strokeWidth: 1,
                            //   dashArray: [20, 4],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
