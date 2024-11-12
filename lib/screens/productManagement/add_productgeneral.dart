import 'package:bhk_seller_app/common/CommonMethods.dart';
import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/addproductgeneralcontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/main.dart';
import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/resources/component/inputformatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddProductPage extends ParentWidget {
  const AddProductPage({super.key});

  @override
  Widget buildingView(BuildContext context, double h, double w) {
    AddProductGeneralController controller =
        Get.put(AddProductGeneralController());
    return Obx(() => Stack(children: [
          Scaffold(
            backgroundColor: const Color.fromARGB(195, 247, 243, 233),
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: AppConstants.customGradient,
                ),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                controller.producteditId == true
                    ? "Edit Product".toUpperCase()
                    : "Add Product".toUpperCase(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Row
                    controller.producteditId == true
                        ? const Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(
                                Icons.edit,
                                size: 20.0,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'Edit Product',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        : const Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(
                                Icons.shopping_cart,
                                size: 20.0,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'Add Product',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                    SizedBox(height: 5.0),

                    // Subtitle
                    controller.producteditId == true
                        ? const Text(
                            'Edit and manage your product.',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Color.fromARGB(255, 140, 136, 136),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            'Add a new product to your store.',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Color.fromARGB(255, 140, 136, 136),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    SizedBox(height: 25.0),

                    // Step Indicator
                    Row(
                      children: [
                        controller.buildStepCircle("General", 01, true),
                        controller.buildStepDivider(),
                        controller.buildStepCircle("Details", 02, false),
                        controller.buildStepDivider(),
                        controller.buildStepCircle("Files", 03, false),
                        controller.buildStepDivider(),
                        controller.buildStepCircle("Review", 04, false),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " *",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0), // Padding inside the container
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(
                              197, 113, 113, 113), // Border color
                          width: 1.5, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                      ),
                      child: DropdownButton<String>(
                        hint: Text(controller.getProductDetailsModel.value.data
                                ?.category?.categoryName ??
                            "Select Category"),
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        value: controller.selectedcategory.value?.isNotEmpty ??
                                false
                            ? controller.selectedcategory.value
                            : null, // Nullable selected value

                        items: controller.getCategoryModel.value.data?.docs
                            ?.map((item) {
                          return DropdownMenuItem<String>(
                            value: item.categoryId
                                .toString(), // Use the correct item value
                            child: Text(
                              item.categoryName ?? "",
                              style: const TextStyle(fontSize: 14),
                            ),
                          );
                        }).toList(),
                        onChanged: (controller.producteditId == true)
                            ? null
                            : (String? newValue) {
                                controller.selectedsubcategory.value = null;
                                controller.selectedcategory.value =
                                    newValue ?? ""; // Update selected item
                                controller.categoryid.value = newValue!;
                                controller.getSubCategoryApi(
                                    controller.categoryid.value);
                                print(controller.categoryid.value);
                              },
                        menuMaxHeight: MediaQuery.of(context).size.height * .25,
                        menuWidth: MediaQuery.of(context).size.width * .95,
                        isExpanded: true,
                        underline: const SizedBox(), // Remove default underline
                      ),
                    ),

                    const SizedBox(height: 16.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Row(
                        children: [
                          Expanded(
                            flex:
                                7, // Adjust the flex ratio according to your needs
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "SubCategory",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  " *",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width:
                                  8), // Space between TextFormField and DropdownButton

                          Expanded(
                            flex:
                                7, // Adjust the flex ratio according to your needs
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Brand",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  " *",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        children: [
                          Expanded(
                            flex:
                                5, // Adjust the flex ratio according to your needs
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      8.0), // Padding inside the container
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                      197, 113, 113, 113), // Border color
                                  width: 1.5, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded corners
                              ),
                              child: DropdownButton<String>(
                                hint: Text(controller.getProductDetailsModel
                                        .value.data?.category?.categoryName ??
                                    "Select SubCategory"),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                value: controller.selectedsubcategory.value
                                            ?.isNotEmpty ??
                                        false
                                    ? controller.selectedsubcategory.value
                                    : null, // Nullable selected value

                                items: controller
                                    .getSubCategoryModel.value.data?.docs
                                    ?.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.categoryId
                                        .toString(), // Use the correct item value
                                    child: Text(
                                      item.categoryName.toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (controller.producteditId == true)
                                    ? null
                                    : (String? newValue) {
                                        controller.selectedsubcategory.value =
                                            newValue ?? "";
                                        controller.subcategoryid.value =
                                            newValue!; // Update selected item
                                      },
                                menuMaxHeight:
                                    MediaQuery.of(context).size.height * .25,
                                menuWidth:
                                    MediaQuery.of(context).size.width * .45,
                                isExpanded: true,
                                underline:
                                    const SizedBox(), // Remove default underline
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex:
                                5, // Adjust the flex ratio according to your needs
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      8.0), // Padding inside the container
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                      197, 113, 113, 113), // Border color
                                  width: 1.5, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded corners
                              ),
                              child: DropdownButton<String>(
                                hint: Text(controller.getProductDetailsModel
                                        .value.data?.brand?.brandName ??
                                    "Select Brand"),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                value: controller
                                            .selectedbrand.value?.isNotEmpty ??
                                        false
                                    ? controller.selectedbrand.value
                                    : null, // Nullable selected value

                                items: controller.getBrandModel.value.data?.docs
                                    ?.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.brandId
                                        .toString(), // Use the correct item value
                                    child: Text(
                                      item.brandName.toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (controller.producteditId == true)
                                    ? null
                                    : (String? newValue) {
                                        controller.selectedbrand.value =
                                            newValue ?? "";
                                        controller.brandid.value =
                                            newValue!; // Update selected item
                                      },
                                menuMaxHeight:
                                    MediaQuery.of(context).size.height * .25,
                                menuWidth:
                                    MediaQuery.of(context).size.width * .45,
                                isExpanded: true,
                                underline:
                                    const SizedBox(), // Remove default underline
                              ),
                            ),
                          ), // Space between TextFormField and DropdownButton
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Name Field
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " *",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      validator: (value) {
                        if (value == '') {
                          return '*Required Field! Please enter Product name';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      cursorWidth: 1.5,
                      style: const TextStyle(height: 1),
                      inputFormatters: [
                        NoLeadingSpaceFormatter(),
                        RemoveTrailingPeriodsFormatter(),
                        EmojiInputFormatter(),
                        LengthLimitingTextInputFormatter(50)
                      ],
                      controller: controller.nameController.value,
                      decoration: const InputDecoration(
                        hintText: 'Enter your  Product name',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0), // Customize border color and width
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(82, 151, 92, 71),
                              width:
                                  2.0), // Customize border color and width when focused
                        ),
                      ),
                    ),

                    SizedBox(height: 16.0),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Store",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " *",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0), // Padding inside the container
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(
                              197, 113, 113, 113), // Border color
                          width: 1.5, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                      ),
                      child: DropdownButton<String>(
                        hint: Text(controller.getProductDetailsModel.value.data
                                ?.category?.categoryName ??
                            "Select a Store"),
                        style: TextStyle(fontSize: 14, color: Colors.black),

                        value:
                            controller.selectedstore.value?.isNotEmpty ?? false
                                ? controller.selectedstore.value
                                : null, // Nullable selected value

                        items: controller.getStoreModel.value.data?.docs
                            ?.map((item) {
                          return DropdownMenuItem<String>(
                            value: item.storeId
                                .toString(), // Use the correct item value
                            child: Text(
                              item.storeName.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.storebool = true;
                          controller.selectedstore.value = newValue ?? "";
                          controller.storeid.value =
                              newValue!; // Update selected item
                        },

                        menuMaxHeight: MediaQuery.of(context).size.height * .25,
                        menuWidth: MediaQuery.of(context).size.width * .95,
                        isExpanded: true,
                        underline: const SizedBox(), // Remove default underline
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Description Field
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " *",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      //focusNode: controller.focusNode1.value,
                      cursorColor: Colors.grey,
                      cursorWidth: 1.5,
                      validator: (value) {
                        if (value == '') {
                          return '*Required Field! Please enter description';
                        }
                        return null;
                      },
                      controller:
                          controller.detaileddescriptionController.value,
                      maxLines: 3,
                      inputFormatters: [
                        NoLeadingSpaceFormatter(),
                        RemoveTrailingPeriodsFormatter(),
                        LengthLimitingTextInputFormatter(1000)
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Enter a detailed description here...',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0), // Customize border color and width
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(82, 151, 92, 71),
                              width:
                                  2.0), // Customize border color and width when focused
                        ),
                      ),
                    ),

                    SizedBox(height: controller.gm == true ? 40 : 80),

                    // Save as Draft and Next Step Buttons
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            if (controller.producteditId == false) {
                              if (controller
                                      .nameController.value.text.isNotEmpty &&
                                  controller.detaileddescriptionController.value
                                      .text.isNotEmpty &&
                                  controller.categoryid.value.isNotEmpty &&
                                  controller.subcategoryid.value.isNotEmpty &&
                                  controller.brandid.value.isNotEmpty &&
                                  controller.storeid.value.isNotEmpty) {
                                controller.clickNext.value = false;
                                controller.addProductApi(context);

                                print(controller.clickNext.value);
                              } else {
                                CommonMethods.showToast(
                                    "Please Fill All the Details");
                              }
                            } else {
                              controller.clickNext.value = false;
                              controller.addProductApi(context);

                              print(controller.clickNext.value);
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.grey),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: Text(
                              controller.productId == 0
                                  ? 'Save as draft'
                                  : "Save",
                              style: TextStyle(color: Colors.black)),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.producteditId == false) {
                              if (controller
                                      .nameController.value.text.isNotEmpty &&
                                  controller.detaileddescriptionController.value
                                      .text.isNotEmpty &&
                                  controller.categoryid.value.isNotEmpty &&
                                  controller.subcategoryid.value.isNotEmpty &&
                                  controller.brandid.value.isNotEmpty &&
                                  controller.storeid.value.isNotEmpty) {
                                controller.clickNext.value = true;
                                controller.addProductApi(context);

                                print(controller.clickNext.value);
                              } else {
                                CommonMethods.showToast(
                                    "Please Fill All the Details");
                              }
                            } else {
                              controller.clickNext.value = true;
                              controller.addProductApi(context);

                              print(controller.clickNext.value);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5D2E17),
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'Next step',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
        ]));
  }
}
