import 'package:bhk_seller_app/resources/colors.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:bhk_seller_app/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:dhurmaati/Constants/constants.dart';
// import 'package:dhurmaati/model/cartModel.dart';
// import 'package:dhurmaati/screens/login_screen.dart';
// import 'package:dhurmaati/screens/main_dashboard_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:overlay_support/overlay_support.dart';
import 'model/cartModel.dart';
// import 'model/subscriptionModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp(model: CartModel()));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final CartModel model;

  const MyApp({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: ScopedModel<CartModel>(
      model: model,
      child: GetMaterialApp(
        theme: ThemeData(
            fontFamily: 'Poppins', primaryColor: Color(appColors.colorPrimary)),
        home: SplashScreen(),
        getPages: RoutesClass.routes,
        initialRoute: RoutesClass.gotoSplash(),
        debugShowCheckedModeBanner: false,
      ),
    ));
  }
}

abstract class ParentWidget extends StatelessWidget {
  const ParentWidget({Key? key}) : super(key: key);
  Widget buildingView(BuildContext context, double h, double w);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        // showDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text(appStrings.confirmExit,style: TextStyle(fontSize: 20,color: Color(appColors.black))),
        //         content: Text(appStrings.areYouSure,style: TextStyle(fontSize: 16,color: Color(appColors.black))),
        //         actions: [
        //           TextButton(
        //             onPressed: (){
        //               SystemNavigator.pop();
        //             },
        //             style: TextButton.styleFrom(
        //                 backgroundColor: Color(appColors.appColorRed),
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(5)
        //                 )
        //             ),
        //             child: SizedBox(
        //                 width: w * 0.2,
        //                 child: Center(child: Text(appStrings.yes,style: TextStyle(fontSize: 16,color: Colors.white)))),
        //           ),
        //           SizedBox(),
        //           TextButton(
        //             onPressed: (){
        //               Navigator.of(context).pop();
        //             },
        //             style: TextButton.styleFrom(
        //                 backgroundColor: Color(appColors.black),
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(5)
        //                 )
        //             ),
        //             child: SizedBox(
        //                 width: w * 0.2,
        //                 child: Center(child: Text(appStrings.no,style: TextStyle(fontSize: 16,color: Colors.white)))),
        //           )
        //         ],
        //       );
        //     });
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          top: false,
          child: buildingView(context, h, w),
        ),
      ),
    );
  }
// Future<void> getToken() async {
//   var fcmToken = await FirebaseMessaging.instance.getToken();
//   print('fcm is ' + fcmToken!);
// }
}
