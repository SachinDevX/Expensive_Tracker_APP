import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double monamount;
  final double tuesamount;
  final double wedamount;
  final double thursamount;
  final double friamount;
  final double satamount;
  final double sunamount;

  const MyBarGraph({
    super.key,
    required this.maxY,
    required this.monamount,
    required this.tuesamount,
    required this.wedamount,
    required this.thursamount,
    required this.friamount,
    required this.satamount,
    required this.sunamount,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the bar data
    BarData myBarData = BarData(
      sunamount: sunamount,
      monamount: monamount,
      tuesamount: tuesamount,
      wedamount: wedamount,
      thursamount: thursamount,
      friamount: friamount,
      satamount: satamount,
    );
    myBarData.InitailzelBardata();

    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        barGroups: myBarData.barData.map(
              (data) {
            return BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Colors.blue, // Customize the color as needed
                  width: 15, // Customize the width as needed
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
