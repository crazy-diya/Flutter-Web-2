
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
                startDegreeOffset: 90,
                sections: PieChartsSectionDatas,
                sectionsSpace: 0,
                centerSpaceRadius: 70),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "29.1",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white,fontWeight: FontWeight.w600),
                ),
                Text("of 128GB"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<PieChartSectionData> PieChartsSectionDatas = [
  PieChartSectionData(
    value: 25,
    color: Colors.red,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    value: 18,
    color: Colors.green,
    showTitle: false,
    radius: 21,
  ),
  PieChartSectionData(
    value: 20,
    color: Colors.blue,
    showTitle: false,
    radius: 18,
  ),
  PieChartSectionData(
    value: 10,
    color: Colors.yellow,
    showTitle: false,
    radius: 14,
  ),
  PieChartSectionData(
    value: 27,
    color: Colors.pink,
    showTitle: false,
    radius: 28,
  ),
];
