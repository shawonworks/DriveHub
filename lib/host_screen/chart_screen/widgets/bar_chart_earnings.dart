import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class EarningsBarChart extends StatelessWidget {
  EarningsBarChart({super.key});

  final List<String> months = [
    "Jun","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
  ];

  final List<double> values = [
    25, 30, 25, 40, 45, 38, 28, 32, 41, 43, 47,30
  ];

  List<BarChartGroupData> _groups() {
    return List.generate(values.length, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: values[i],
            width: 7.68,
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xFF009E99),
          )
        ],
      );
    });
  }

  Widget _bottom(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index < months.length) {
      return Text(
        months[index],
        style: TextStyle(
          fontSize: 10,
          color: Colors.black54,
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: _groups(),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        maxY: 60,
        minY: 0,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 15,
              getTitlesWidget: (value, meta) {
                return Text(
                  "${value.toInt()}k",
                  style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 11,
                  ),
                );
              },
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize:28,
              getTitlesWidget: _bottom,
            ),
          ),
        ),
      ),
    );
  }
}
