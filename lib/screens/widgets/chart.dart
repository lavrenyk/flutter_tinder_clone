import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 10, Colors.red),
      ChartData('Steve', 12, Colors.amber),
    ];
    return Center(
      child: Container(
        //Initialize chart
        child: SfCircularChart(
          palette: <Color>[
            Colors.green,
            Colors.grey,
            Colors.amber,
            Colors.redAccent,
            Colors.blueAccent,
            Colors.teal
          ],
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              widget: PhysicalModel(
                child: Container(),
                shape: BoxShape.circle,
                elevation: 20,
                shadowColor: Colors.black,
                color: const Color.fromRGBO(230, 230, 230, 1),
              ),
              radius: "80%",
            ),
            CircularChartAnnotation(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Общий заработок"),
                  const Text(
                    "10'000",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("РУБЛЕЙ")
                ],
              ),
            ),
          ],
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              // Radius of doughnut
              radius: '80%', innerRadius: '60%',
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
