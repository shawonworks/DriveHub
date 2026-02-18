import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_color.dart';

class UserGrowthLineChart extends StatelessWidget {
  UserGrowthLineChart({super.key});

  final List<double> data = [
    25, 22, 28, 35, 33, 38, 45, 43, 50, 47, 55, 65
  ];

  List<FlSpot> getSpots() {
    return List.generate(data.length, (i) {
      return FlSpot(i.toDouble(), data[i]);
    });
  }

  final List<String> months = [
    "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 70,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),

        lineBarsData: [
          LineChartBarData(
            spots: getSpots().take(11).toList(),
            isCurved: true,
            barWidth: 2,

            color: Color(0xFF006161),

            dotData: FlDotData(
              show: true,
              checkToShowDot: (spot, barData) => spot.x == 6,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 6,
                  color: const Color(0xFF006161),
                  strokeWidth: 0,
                );
              },
            ),

            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF009E99),
                  const Color(0xFFFFFFFF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],


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
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles:true,
              reservedSize: 22,
              getTitlesWidget: (value, meta) {
                int index = value.toInt();
                if (index < months.length) {
                  return Text(
                    months[index],
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),

      ),
    );
  }
}
