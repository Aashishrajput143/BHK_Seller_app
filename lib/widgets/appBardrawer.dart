import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/appBardrawercontroller.dart';
import 'package:bhk_seller_app/controller/commondashcontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appbardrawer extends StatelessWidget {
  const Appbardrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Appbardrawercontroller controller = Get.put(Appbardrawercontroller());
    CommonDashController commoncontroller = Get.put(CommonDashController());
    return Obx(
      () => Stack(
        children: [
          RefreshIndicator(
            color: Colors.brown,
            onRefresh: controller.profileRefresh,
            child: Drawer(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Container(
                color: const Color.fromARGB(195, 247, 243, 233),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          commoncontroller.selectedScreenIndex.value = 3;
                        },
                        child: UserAccountsDrawerHeader(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 96, 77, 46),
                                Color.fromARGB(255, 143, 90, 78),
                                Color.fromARGB(255, 181, 157, 148)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          accountName: Text(
                            controller.getProfileModel.value.data?.name
                                        ?.isNotEmpty ??
                                    true
                                ? controller.getProfileModel.value.data?.name ??
                                    "User".toUpperCase()
                                : "User".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          accountEmail: Text(
                              controller.getProfileModel.value.data?.email
                                          ?.isNotEmpty ??
                                      true
                                  ? controller
                                          .getProfileModel.value.data?.email ??
                                      "User@gmail.com"
                                  : controller.getProfileModel.value.data
                                          ?.phoneNo ??
                                      "XXXXXXXX10",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 8.0, bottom: 8.0),
                      child: Text(
                        'NAVIGATION',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 139, 136, 136),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      minTileHeight: 7,
                      leading: Icon(Icons.home, color: Colors.black),
                      title: Text('Home',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      onTap: () {
                        Navigator.of(context).pop();
                        commoncontroller.selectedScreenIndex.value = 0;
                      },
                    ),
                    // ListTile(
                    //   minTileHeight: 7,
                    //   leading: Icon(Icons.folder, color: Colors.black),
                    //   title: Text('Categories',
                    //       style: TextStyle(color: Colors.black, fontSize: 15)),
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 8.0, bottom: 8.0),
                      child: Text(
                        'MY Business',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 139, 136, 136),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      minTileHeight: 7,
                      leading: Icon(Icons.store, color: Colors.black),
                      title: Text('My Product',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      onTap: () {
                        Navigator.of(context).pop();
                        commoncontroller.selectedScreenIndex.value = 1;
                      },
                    ),

                    ListTile(
                      minTileHeight: 7,
                      leading: Icon(Icons.store, color: Colors.black),
                      title: Text('My Stores',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      onTap: () {
                        Navigator.of(context).pop();
                        Get.toNamed(RoutesClass.gotoStoreScreen());
                      },
                    ),
                    ListTile(
                      minTileHeight: 7,
                      leading: Icon(Icons.branding_watermark_outlined,
                          color: Colors.black),
                      title: Text('Explore Brands',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      onTap: () {
                        Navigator.of(context).pop();
                        Get.toNamed(RoutesClass.gotoBrandScreen());
                      },
                    ),
                    Divider(),
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                      child: Text(
                        'MY ACCOUNT',
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 136, 136),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      minTileHeight: 7,
                      leading: Icon(Icons.account_circle, color: Colors.black),
                      title: Text('Account Info',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      onTap: () {
                        Navigator.of(context).pop();
                        commoncontroller.selectedScreenIndex.value = 3;
                      },
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 8.0, bottom: 8.0),
                      child: Text(
                        'AUTHENTICATION',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 139, 136, 136),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      minTileHeight: 7,
                      leading: Icon(Icons.logout, color: Colors.black),
                      title: Text("Log Out",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      onTap: () {
                        Navigator.of(context).pop();
                        controller.showlogoutDialog();
                      },
                    ),
                    Divider(),
                    ListTile(
                      minTileHeight: 7,
                      //leading: Icon(Icons.receipt, color: Colors.black),
                      title: Text('Terms & Conditions',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 76, 72, 72),
                              fontSize: 14)),
                      onTap: () {
                        Get.toNamed(RoutesClass.gotoTermsConditionScreen());
                      },
                    ),
                    ListTile(
                      minTileHeight: 7,
                      //leading: Icon(Icons.receipt, color: Colors.black),
                      title: Text('Privacy Policy',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 76, 72, 72),
                              fontSize: 14)),
                      onTap: () {
                        Get.toNamed(RoutesClass.gotoPrivacyPolicyScreen());
                      },
                    ),
                    ListTile(
                      minTileHeight: 7,
                      //leading: Icon(Icons.receipt, color: Colors.black),
                      title: Text('FAQ',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 76, 72, 72),
                              fontSize: 14)),
                      onTap: () {
                        Get.toNamed(RoutesClass.gotoFAQScreen());
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          progressBarTransparent(
            controller.rxRequestStatus.value == Status.LOADING,
            MediaQuery.of(context).size.height,
            MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
