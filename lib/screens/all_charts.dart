import 'package:flutter/material.dart';
import 'package:hackaton/core/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AllChartsScreen extends StatefulWidget {
  const AllChartsScreen({super.key});

  @override
  State<AllChartsScreen> createState() => _AllChartsScreenState();
}

class _AllChartsScreenState extends State<AllChartsScreen> {
  var data = [
    _ChartData('Бананы', 25),
    _ChartData('Миндаль', 38),
    _ChartData('Яблоки', 34),
  ];
  var _tooltip = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColors.white,
      appBar: AppBar(
        backgroundColor: CoreColors.white,
        title: Text("Все графики"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              opposedPosition: true,
              name: 'YAxis1',
            ),
            axes: <ChartAxis>[
              NumericAxis(
                opposedPosition: false,
                name: 'YAxis2',
              ),
            ],
            series: [
              ColumnSeries<ChartData, String>(
                color: Colors.red,
                dataSource: [
                  ChartData('Jan', 35, 28),
                  ChartData('Feb', 28, 34),
                  ChartData('Mar', 34, 32),
                  ChartData('Apr', 32, 40),
                ],
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y1,
                yAxisName: 'YAxis1',
              ),
              ColumnSeries<ChartData, String>(
                color: Colors.orange,
                dataSource: [
                  ChartData('Jan', 35, 28),
                  ChartData('Feb', 28, 34),
                  ChartData('Mar', 34, 32),
                  ChartData('Apr', 32, 40),
                ],
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y2,
                yAxisName: 'YAxis2',
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                width: 60,
                height: 10,
              ),
              Text(
                "  Миндаль",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  width: 60,
                  height: 10),
              Text(
                "  Яблоки",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ExpansionTile(title: Text("Сбор урожая за год"), children: [
            for (var i = 0; i < 3; i++)
              ListTile(
                title: Text("Пункт ${i + 1}"),
                trailing: Text("${1300 - (i + 4) * 2}"),
              )
          ]),
          SfCircularChart(
              tooltipBehavior: _tooltip,
              legend: Legend(isVisible: true),
              series: <CircularSeries<_ChartData, String>>[
                DoughnutSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Gold')
              ])
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2);
  final String x;
  final double y1;
  final double y2;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
