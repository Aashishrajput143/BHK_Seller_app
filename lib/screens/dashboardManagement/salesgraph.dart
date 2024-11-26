import 'package:bhk_seller_app/controller/commondashcontroller.dart';
import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Salesgraph extends StatelessWidget {
  const Salesgraph({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    CommonDashController dashController = Get.put(CommonDashController());
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sales History',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    dashController.selectedScreenIndex.value = 3;
                  },
                  child: Text(
                    'View All>',
                    style: TextStyle(fontSize: 14.0, color: Colors.brown),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: SfCartesianChart(
              backgroundColor: const Color.fromARGB(195, 247, 243, 233),
              primaryXAxis: CategoryAxis(
                edgeLabelPlacement: EdgeLabelPlacement
                    .shift, // Ensures edge labels are shifted into view
                interval: 1.8, // Displays every label on the x-axis
              ),
              title: ChartTitle(
                  text: 'Annual Sales of Year ${controller.currentYear}'),
              legend: Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<Map<String, dynamic>, String>>[
                LineSeries<Map<String, dynamic>, String>(
                  dataSource: controller.chartData,
                  xValueMapper: (Map<String, dynamic> sales, _) =>
                      sales['month'] as String,
                  yValueMapper: (Map<String, dynamic> sales, _) =>
                      sales['sales'] as num,
                  name: 'Sales',
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
          // Wrapping SparkLineChart in SizedBox to provide a fixed height
          /*SizedBox(
              height: 200, // Adjust the height as needed
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfSparkLineChart.custom(
                  // Enable the trackball
                  trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap,
                  ),
                  // Enable marker
                  marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all,
                  ),
                  // Enable data label
                  labelDisplayMode: SparkChartLabelDisplayMode.all,
                  xValueMapper: (int index) => data[index].year,
                  yValueMapper: (int index) => data[index].sales,
                  dataCount: 5,
                ),
              ),
            ),*/
        ],
      ),
    );
  }
}
