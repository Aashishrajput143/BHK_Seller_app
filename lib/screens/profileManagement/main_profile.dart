// import 'dart:html';
import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/profilecontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Obx(() => Stack(children: [
          RefreshIndicator(
            color: Colors.brown,
            onRefresh: controller.profileRefresh,
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Stack(fit: StackFit.loose, children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: const Alignment(0.0, 2.5),
                              child: CircleAvatar(
                                backgroundImage: controller.getProfileModel
                                            .value.data?.avatar?.isNotEmpty ??
                                        false
                                    ? NetworkImage(
                                        // Otherwise show the network image
                                        controller.getProfileModel.value.data
                                                ?.avatar ??
                                            "")
                                    : AssetImage(
                                        AppImages.profile,
                                      ),
                                radius: 70.0,
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(height: 20),
                    Text(
                      controller.getProfileModel.value.data?.name?.isNotEmpty ??
                              false
                          ? controller.getProfileModel.value.data?.name ?? ""
                          : "User".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.getProfileModel.value.data?.email
                                  ?.isNotEmpty ??
                              false
                          ? controller.getProfileModel.value.data?.email ?? ""
                          : "User@gmail.com",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(
                          RoutesClass.gotoViewProfileScreen(),
                          arguments: {
                            'name':
                                controller.getProfileModel.value.data?.name ??
                                    "",
                            'email':
                                controller.getProfileModel.value.data?.email ??
                                    "",
                            'phone': controller
                                    .getProfileModel.value.data?.phoneNo ??
                                "",
                            'avatar':
                                controller.getProfileModel.value.data?.avatar ??
                                    "",
                            'countrycode': controller
                                    .getProfileModel.value.data?.countryCode ??
                                "",
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 155, 105, 89),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22.0,
                            vertical: 8.0), // Button background color
                        foregroundColor: Colors.white, // Button text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      child: const Text(
                        "View Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    // TextButton(
                    //   style: ButtonStyle(),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => EditProfile()),
                    //     );
                    //   },
                    //   child: const Text(
                    //     "Edit Profile",
                    //     style: TextStyle(
                    //         color: Colors.black, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                // List options with rounded card style
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    children: [
                      controller.buildProfileOptionCard(
                          'Orders',
                          'View, Modify and Track orders',
                          Icons.shopping_bag,
                          1),
                      controller.buildProfileOptionCard('Stores',
                          'Edit, add or remove Stores', Icons.store, 2),
                      controller.buildProfileOptionCard('Notifications',
                          'View Your Notifications', Icons.notifications, 3),
                      controller.buildProfileOptionCard(
                          'Settings',
                          'Edit Profile, Manage your profile',
                          Icons.settings_outlined,
                          4),
                      /*_buildProfileOptionCard(
                  'Customer Care', 'Policy & helpline', Icons.support, 5),
              _buildProfileOptionCard(
                  'My Wallet',
                  'Wallet history, redeem gift cards',
                  Icons.account_balance_wallet,
                  6),
              _buildProfileOptionCard(
                  'About Us', 'Our story and something', Icons.info, 7),
              _buildProfileOptionCard('Refer & Earn',
                  'Invite your friends & earn rewards', Icons.card_giftcard, 8),
              _buildProfileOptionCard('Settings',
                  'Change language, dark mode etc.', Icons.settings, 9),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
          progressBarTransparent(
              controller.rxRequestStatus.value == Status.LOADING,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.height)
        ]));
  }
}
