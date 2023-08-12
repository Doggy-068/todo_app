import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenChart extends StatelessWidget {
  const ScreenChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.chart_title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16.0),
        children: [
          LineChart(
            LineChartData(lineBarsData: [
              LineChartBarData(spots: [
                const FlSpot(1, 1),
                const FlSpot(2, 2),
                const FlSpot(3, 3),
              ]),
            ]),
          ),
          BarChart(
            BarChartData(barGroups: [
              BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10)]),
              BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 20)]),
              BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 30)]),
            ]),
          ),
          PieChart(
            PieChartData(sections: [
              PieChartSectionData(
                value: 10,
                color: Colors.blue,
              ),
              PieChartSectionData(
                value: 20,
                color: Colors.yellow,
              ),
              PieChartSectionData(
                value: 30,
                color: Colors.green,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
