import 'package:bhk_seller_app/controller/commondashcontroller.dart';
import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Salesgraph extends StatelessWidget {
  const Salesgraph({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    CommonDashController dashController = Get.put(CommonDashController());
    return Obx(
      () => SizedBox(
        height: 370,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sales Statistics',
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
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: DropdownButton2<String>(
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      value: controller.dropdownsold.value,
                      alignment: Alignment.center,
                      items: controller.salesfilter.map((String value) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade900),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.dropdownsold.value = newValue ?? "";
                      },
                      dropdownStyleData: DropdownStyleData(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        maxHeight: MediaQuery.of(context).size.height * .4,
                        width: MediaQuery.of(context).size.width * .35,
                        offset: const Offset(0, 2),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: 38,
                      ),
                      isExpanded: true,
                      underline: SizedBox(),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.36,
                    child: DropdownButton2<String>(
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      value: controller.dropdownmonth.value,
                      alignment: Alignment.center,
                      items: controller.daysfilter.map((String value) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade900),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.dropdownmonth.value = newValue ?? "";
                      },
                      dropdownStyleData: DropdownStyleData(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        maxHeight: MediaQuery.of(context).size.height * .4,
                        width: MediaQuery.of(context).size.width * .36,
                        offset: const Offset(0, 2),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: 38,
                      ),
                      isExpanded: true,
                      underline: SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 280,
              child: SfCartesianChart(
                backgroundColor: const Color.fromARGB(195, 247, 243, 233),
                primaryXAxis: CategoryAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  interval: 1.8,
                ),
                //legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries<Map<String, dynamic>, String>>[
                  ColumnSeries<Map<String, dynamic>, String>(
                    dataSource: controller.chartData,
                    xValueMapper: (Map<String, dynamic> sales, _) =>
                        sales['month'] as String,
                    yValueMapper: (Map<String, dynamic> sales, _) =>
                        sales['sales'] as num,
                    //name: 'Sales',
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 37, 153, 255),
                        Color.fromARGB(255, 97, 167, 227),
                        Color.fromARGB(255, 133, 194, 247),
                        Color.fromARGB(255, 74, 255, 216)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.outer,
                    ),
                    dataLabelMapper: (Map<String, dynamic> sales, _) {
                      final value = sales['sales'] as num;
                      return value != 0 ? value.toString() : null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
