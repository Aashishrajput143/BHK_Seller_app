import 'package:bhk_seller_app/controller/viewprofilecontroller.dart';
import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ViewProfileController controller = Get.put(ViewProfileController());
    return Container(
      color: const Color.fromARGB(195, 247, 243, 233),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 243, 233),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppConstants.customGradient,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            "View Profile".toUpperCase(),
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Stack(fit: StackFit.loose, children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: const Alignment(0.0, 2.5),
                            child: CircleAvatar(
                              backgroundImage:
                                  controller.avatar?.isNotEmpty ?? true
                                      ? NetworkImage(
                                          // Otherwise show the network image
                                          controller.avatar ?? "")
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
                  const SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.edit_document,
                          size: 20.0,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Personal Information',
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: ListTile(
                      leading: Icon(Icons.person_outline, color: Colors.black),
                      title: Text(
                        "Name",
                        style: TextStyle(color: Colors.grey),
                      ),
                      subtitle: Text(
                        controller.name!.isNotEmpty
                            ? controller.name.toString()
                            : "User",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: ListTile(
                      leading: Icon(Icons.phone_outlined, color: Colors.black),
                      title: Text(
                        "Phone Number",
                        style: TextStyle(color: Colors.grey),
                      ),
                      subtitle: Text(
                        "${controller.countrycode!.isNotEmpty ? controller.countrycode.toString() : "Null"} ${controller.phone!.isNotEmpty ? controller.phone.toString() : "Null"}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: ListTile(
                      leading: Icon(Icons.email_outlined, color: Colors.black),
                      title: Text(
                        "Email",
                        style: TextStyle(color: Colors.grey),
                      ),
                      subtitle: Text(
                        controller.email!.isNotEmpty
                            ? controller.email.toString()
                            : "Null",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
