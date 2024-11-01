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
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getBottomTitles,
                )
            )),
        barGroups: myBarData.barData.map(
              (data) {
            return BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Colors.grey[800], // Customize the color as needed
                  width: 25, // Customize the width as needed
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: maxY,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
Widget getBottomTitles(double value,TitleMeta meta){
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,

  );
  Widget text;
  switch (value.toInt()){
    case 0:
      text = const Text('S',style: style);
      break;
    case 1:
      text = const Text('M',style: style);
      break;
    case 2:
      text = const Text('T',style: style);
      break;
    case 3:
      text = const Text('W',style: style);
      break;
    case 4:
      text = const Text('T',style: style);
      break;
    case 5:
      text = const Text('F',style: style);
      break;
    case 6:
      text = const Text('S',style: style);
      break;
    default:
      text = const Text('', style: style); // Default case if no match
      break;

  }
  return SideTitleWidget(
    child: text,
    axisSide: meta.axisSide,
  );
}
