import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/storedetailscontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyStoreDetails extends StatelessWidget {
  const MyStoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Storedetailscontroller controller = Get.put(Storedetailscontroller());
    return Obx(() => Stack(children: [
          Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: AppConstants.customGradient,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              centerTitle: true,
              title: Text(
                "Store Details".toUpperCase(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300.0,
                      width: MediaQuery.of(context).size.width *
                          .92, // Adjust height as per your design
                      child: ClipRRect(
                        child: Image.network(
                          controller
                                  .getStoreDetailsModel.value.data?.storeLogo ??
                              "",
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5)),
                                child: Center(
                                    child: Text(
                                  "No Image data Found",
                                  textAlign: TextAlign.center,
                                )));
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      controller.getStoreDetailsModel.value.data?.storeName ??
                          "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Divider(),
                    // Store Description
                    Text('Store Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 8),
                    Text(
                      controller.getStoreDetailsModel.value.data?.description ??
                          "",
                    ),

                    Divider(),
                    // Size Selection

                    Text(
                      'Store Address',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    controller.storeDetailRow(
                        'house No.',
                        controller.getStoreDetailsModel.value.data?.address
                                ?.houseNo ??
                            ""),
                    controller.storeDetailRow(
                        'Street No.',
                        controller.getStoreDetailsModel.value.data?.address
                                ?.street ??
                            ""),
                    controller.storeDetailRow(
                        'City',
                        controller.getStoreDetailsModel.value.data?.address
                                ?.city ??
                            ""),
                    controller.storeDetailRow(
                        'State',
                        controller.getStoreDetailsModel.value.data?.address
                                ?.state ??
                            ""),
                    controller.storeDetailRow(
                        'Country',
                        controller.getStoreDetailsModel.value.data?.address
                                ?.country ??
                            ""),
                    controller.storeDetailRow(
                        'Pin Code',
                        controller.getStoreDetailsModel.value.data?.address
                                ?.postalCode ??
                            ""),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          progressBarTransparent(
              controller.rxRequestStatus.value == Status.LOADING,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.height)
        ]));
  }
}
