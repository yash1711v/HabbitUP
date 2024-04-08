import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habitup/CommonMethods/Variable.dart';


class MyGraph extends StatefulWidget {
  final List<double> weelySummery;
  const MyGraph({super.key, required this.weelySummery});

  @override
  State<MyGraph> createState() => _MyGraphState();
}

class _MyGraphState extends State<MyGraph> {
  List<double> weelySummery = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weelySummery = widget.weelySummery;
  }
  @override
  Widget build(BuildContext context) {
    return BarChart(
        swapAnimationCurve: Curves.easeInOut,
        swapAnimationDuration: const Duration(milliseconds: 250),
        BarChartData(
          minY: 0,
          gridData: const FlGridData(
            show: false,
          ),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

             bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true,
               getTitlesWidget: getBottomTiles),

            )
          ),
          barGroups: widget.weelySummery.asMap()
              .entries.map((entry) => BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                  toY: entry.value.toDouble(),

                  color: Theme.of(contextProgress).textTheme.titleMedium?.color,
                  width: 35.51,
                  borderRadius: const BorderRadius.all(Radius.circular(10)
                  ),

                  backDrawRodData: BackgroundBarChartRodData(
                      show: false, toY: 10000, color: Colors.grey.shade800)
              )
            ]



          )).toList(),

          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipRoundedRadius: 8,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                late String weekDay;
                switch (group.x.toInt()) {
                  case 0:
                    weekDay = 'Mon';
                    break;
                  case 1:
                    weekDay = 'Tue';
                    break;
                  case 2:
                    weekDay = 'Wed';
                    break;
                  case 3:
                    weekDay = 'Thu';
                    break;
                  case 4:
                    weekDay = 'Fri';
                    break;
                  case 5:
                    weekDay = 'Sat';
                    break;
                  case 6:
                    weekDay = 'Sun';
                    break;
                }
                return BarTooltipItem(
                  '$weekDay: ${group.barRods[rodIndex].toY.round().toString()}',
                  const TextStyle(color: Colors.white),
                );
              },
            ),
          )



        ));
  }
}

Widget getBottomTiles(double value, TitleMeta data,) {
  var style = TextStyle(
    color: Theme.of(contextProgress).textTheme.titleMedium?.color,
    fontSize: 12,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  Widget text=Text(
    'Mon',
    style: style,
  );

  switch (value.toInt()) {
    case 0:
      text = Text(
        'Mon',
        style: style,
      );
      break;
    case 1:
      text = Text(
        'Tue',
        style: style,
      );
      break;
    case 2:
      text = Text(
        'Wed',
        style: style,
      );
      break;
    case 3:
      text = Text(
        'Thur',
        style: style,
      );
      break;
    case 4:
      text = Text(
        'Fri',
        style: style,
      );
      break;
    case 5:
      text = Text(
        'Sat',
        style: style,
      );
      break;
    case 6:
      text = Text(
        'Sun',
        style: style,
      );
      break;
  }

  return text;
}
