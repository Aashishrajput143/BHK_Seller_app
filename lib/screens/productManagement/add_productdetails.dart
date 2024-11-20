import 'package:bhk_seller_app/common/CommonMethods.dart';
import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/addproductdetailscontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/main.dart';
import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/resources/inputformatter.dart';
import 'package:bhk_seller_app/screens/productManagement/buildStepCircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddProductDetails extends ParentWidget {
  const AddProductDetails({super.key});

  @override
  Widget buildingView(BuildContext context, double h, double w) {
    AddProductDetailsController controller =
        Get.put(AddProductDetailsController());
    return Obx(() => Stack(
          children: [
            Scaffold(
              backgroundColor: const Color.fromARGB(195, 247, 243, 233),
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: AppConstants.customGradient,
                  ),
                ),

                actions: [
                  controller.producteditId == false
                      ? InkWell(
                          onTap: () {
                            controller.addnewvariants(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                              Text(
                                'Add More',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              SizedBox(width: 10)
                            ],
                          ),
                        )
                      : SizedBox(),
                  SizedBox(width: 10)
                ],
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.white),
                // automaticallyImplyLeading: false,
                title: Text(
                  controller.producteditId == true
                      ? "Edit Product".toUpperCase()
                      : "Add Product".toUpperCase(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
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
                      BuildStepCircle(
                        iscompleted: 1,
                        active: 1,
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
                                    "Color",
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
                                    "Size",
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  value: controller.selectedColor.value,
                                  alignment: Alignment.center,
                                  items: controller.colors.map((String color) {
                                    return DropdownMenuItem(
                                      alignment: AlignmentDirectional.center,
                                      value: color,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            color: controller.getColor(color),
                                          ),
                                          const SizedBox(width: 15.0),
                                          Text(color),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    controller.selectedColor.value =
                                        newValue ?? "";
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
                              child: TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    return '*Required Field! Please enter Size';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.grey,
                                cursorWidth: 1.5,
                                style: const TextStyle(height: 1),
                                controller: controller.sizeController.value,
                                inputFormatters: [
                                  NoLeadingSpaceFormatter(),
                                  RemoveTrailingPeriodsFormatter(),
                                  EmojiInputFormatter(),
                                  LengthLimitingTextInputFormatter(15)
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'Enter Product Size ',
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:
                                            2.0), // Customize border color and width
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(82, 151, 92, 71),
                                        width:
                                            2.0), // Customize border color and width when focused
                                  ),
                                ),
                              ),
                            ), // Space between TextFormField and DropdownButton
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Maximum Retail Price (MRP)",
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
                            return '*Required Field! Please enter MRP';
                          }
                          return null;
                        },
                        cursorColor: Colors.grey,
                        cursorWidth: 1.5,
                        style: const TextStyle(height: 1),
                        keyboardType: TextInputType.number,
                        controller: controller.mrpController.value,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(7)
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Enter Maximum Retail Price',
                          prefixText: '₹ ',
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.0), // Customize border color and width
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(82, 151, 92, 71),
                                width:
                                    2.0), // Customize border color and width when focused
                          ),
                        ),
                        onChanged: (value) {
                          // Call calculateSellingPrice whenever the MRP field changes
                          controller.calculateSellingPrice();
                        },
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
                                    "Discount(%)",
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
                            SizedBox(width: 8),
                            Expanded(
                              flex:
                                  7, // Adjust the flex ratio according to your needs
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Selling Price",
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
                              child: TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    return '*Required Field! Please Enter Discount';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.grey,
                                cursorWidth: 1.5,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Only allow digits
                                  RangeInputFormatter(), // Limit to 0-100
                                ],
                                style: const TextStyle(height: 1),
                                controller: controller.discountController.value,
                                decoration: const InputDecoration(
                                  hintText: 'Enter discount',
                                  suffixText: '%',
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:
                                            2.0), // Customize border color and width
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(82, 151, 92, 71),
                                        width:
                                            2.0), // Customize border color and width when focused
                                  ),
                                ),
                                onChanged: (value) {
                                  // Call calculateSellingPrice whenever the MRP field changes
                                  controller.calculateSellingPrice();
                                },
                              ),
                            ), // Space between TextFormField and DropdownButton
                            const SizedBox(width: 8),
                            Expanded(
                              flex:
                                  5, // Adjust the flex ratio according to your needs
                              child: TextFormField(
                                cursorColor: Colors.grey,
                                cursorWidth: 1.5,
                                controller: TextEditingController(
                                  text:
                                      "₹ ${controller.sellingprice.value.toStringAsFixed(2)}",
                                ),
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                style: const TextStyle(height: 1),
                                decoration: const InputDecoration(
                                  hintText: '₹ 0',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:
                                            2.0), // Customize border color and width
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(82, 151, 92, 71),
                                        width:
                                            2.0), // Customize border color and width when focused
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Quantity",
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
                            return '*Required Field! Please enter Quantity';
                          }
                          return null;
                        },
                        cursorColor: Colors.grey,
                        cursorWidth: 1.5,
                        style: const TextStyle(height: 1),
                        inputFormatters: [
                          NoLeadingSpaceFormatter(),
                          LengthLimitingTextInputFormatter(5),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        controller: controller.quantityController.value,
                        decoration: const InputDecoration(
                          hintText: 'Enter Quantity',
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.0), // Customize border color and width
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(82, 151, 92, 71),
                                width:
                                    2.0), // Customize border color and width when focused
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Net Weight (${controller.dropdownValues})",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            " *",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              flex:
                                  7, // Adjust the flex ratio according to your needs
                              child: TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    controller.gm = true;
                                    return '*Required Field! Please enter Net Weight';
                                  }
                                  controller.gm = false;
                                  return null;
                                },
                                cursorColor: Colors.grey,
                                cursorWidth: 1.5,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(height: 1),
                                controller:
                                    controller.netweightController.value,
                                decoration: InputDecoration(
                                  hintText:
                                      'Enter Net Weight(in ${controller.dropdownValues})',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:
                                            2.0), // Customize border color and width
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(82, 151, 92, 71),
                                        width:
                                            2.0), // Customize border color and width when focused
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    8), // Space between TextFormField and DropdownButton
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: controller.gm == true
                                    ? const EdgeInsets.fromLTRB(0, 0, 0, 20)
                                    : const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  value: controller.dropdownValues.value,
                                  alignment: Alignment.center,
                                  items: controller.weights.map((String value) {
                                    return DropdownMenuItem(
                                      alignment: AlignmentDirectional.center,
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    );
                                  }).toList(),

                                  onChanged: (String? newValue) {
                                    controller.dropdownValues.value =
                                        newValue ?? "";
                                  },
                                  isExpanded:
                                      true, // Make dropdown button take up full width
                                  underline:
                                      SizedBox(), // Remove the default underline
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Material",
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
                            return '*Required Field! Please enter Material Used';
                          }
                          return null;
                        },
                        cursorColor: Colors.grey,
                        cursorWidth: 1.5,
                        style: const TextStyle(height: 1),
                        controller: controller.materialController.value,
                        inputFormatters: [
                          NoLeadingSpaceFormatter(),
                          RemoveTrailingPeriodsFormatter(),
                          EmojiInputFormatter(),
                          LengthLimitingTextInputFormatter(50)
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Enter Material Used',
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.0), // Customize border color and width
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(82, 151, 92, 71),
                                width:
                                    2.0), // Customize border color and width when focused
                          ),
                        ),
                      ),

                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Dimension(in L*B*H) in ${controller.dropdownValue}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
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
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              flex:
                                  2, // Adjust the flex ratio according to your needs
                              child: TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    controller.gm = true;
                                    return '*Required Field! Please enter Dimension(in L*B*H)';
                                  }
                                  controller.gm = false;
                                  return null;
                                },
                                //focusNode: controller.focusNode1.value,
                                cursorColor: Colors.grey,
                                cursorWidth: 1.5,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(height: 1),
                                controller: controller.lengthController.value,
                                inputFormatters: [
                                  NoLeadingSpaceFormatter(),
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4)
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'Length',
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:
                                            2.0), // Customize border color and width
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(82, 151, 92, 71),
                                        width:
                                            2.0), // Customize border color and width when focused
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              flex:
                                  2, // Adjust the flex ratio according to your needs
                              child: TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    controller.gm = true;
                                    return '*Required Field! Please enter Dimension(in L*B*H)';
                                  }
                                  controller.gm = false;
                                  return null;
                                },
                                //focusNode: controller.focusNode1.value,
                                cursorColor: Colors.grey,
                                cursorWidth: 1.5,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(height: 1),
                                controller: controller.breadthController.value,
                                inputFormatters: [
                                  NoLeadingSpaceFormatter(),
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4)
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'Breadth',
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:
                                            2.0), // Customize border color and width
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(82, 151, 92, 71),
                                        width:
                                            2.0), // Customize border color and width when focused
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              flex:
                                  2, // Adjust the flex ratio according to your needs
                              child: TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    controller.gm = true;
                                    return '*Required Field! Please enter Dimension(in L*B*H)';
                                  }
                                  controller.gm = false;
                                  return null;
                                },
                                //focusNode: controller.focusNode1.value,
                                cursorColor: Colors.grey,
                                cursorWidth: 1.5,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  NoLeadingSpaceFormatter(),
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4)
                                ],
                                style: const TextStyle(height: 1),
                                controller: controller.heightController.value,
                                decoration: const InputDecoration(
                                  hintText: 'Height',
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width:
                                            2.0), // Customize border color and width
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(82, 151, 92, 71),
                                        width:
                                            2.0), // Customize border color and width when focused
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    15), // Space between TextFormField and DropdownButton
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: controller.gm == true
                                    ? const EdgeInsets.fromLTRB(0, 0, 0, 20)
                                    : const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  value: controller.dropdownValue.value,
                                  alignment: Alignment.center,
                                  items: controller.measureunits
                                      .map((String value) {
                                    return DropdownMenuItem(
                                      alignment: AlignmentDirectional.center,
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    );
                                  }).toList(),

                                  onChanged: (String? newValue) {
                                    controller.dropdownValue.value =
                                        newValue ?? "";
                                  },
                                  isExpanded:
                                      true, // Make dropdown button take up full width
                                  underline:
                                      SizedBox(), // Remove the default underline
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16),
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
                        controller: controller.descriptionController.value,
                        maxLines: 2,
                        inputFormatters: [
                          NoLeadingSpaceFormatter(),
                          RemoveTrailingPeriodsFormatter(),
                          LengthLimitingTextInputFormatter(1000)
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Enter a description here...',
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.0), // Customize border color and width
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(82, 151, 92, 71),
                                width:
                                    2.0), // Customize border color and width when focused
                          ),
                        ),
                      ),

                      SizedBox(height: controller.gm == true ? 40 : 50),

                      // Save as Draft and Next Step Buttons
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              if (controller.producteditId == false) {
                                if (controller.netweightController.value.text
                                        .isNotEmpty &&
                                    controller.descriptionController.value.text
                                        .isNotEmpty &&
                                    controller.quantityController.value.text
                                        .isNotEmpty &&
                                    controller.materialController.value.text
                                        .isNotEmpty &&
                                    controller
                                        .sizeController.value.text.isNotEmpty &&
                                    controller
                                        .mrpController.value.text.isNotEmpty &&
                                    controller.discountController.value.text
                                        .isNotEmpty &&
                                    controller.lengthController.value.text
                                        .isNotEmpty &&
                                    controller.breadthController.value.text
                                        .isNotEmpty &&
                                    controller.dropdownValue.value.isNotEmpty &&
                                    controller
                                        .dropdownValues.value.isNotEmpty &&
                                    controller.heightController.value.text
                                        .isNotEmpty &&
                                    controller.selectedColor.value.isNotEmpty &&
                                    controller.sellingprice.value != 0.0) {
                                  controller.addvariants(context);
                                  controller.clickNext.value = false;
                                  controller.addProductVariantApi(
                                      context, controller.productId);
                                } else {
                                  CommonMethods.showToast(
                                      "Please Fill All the Details");
                                }
                              } else {
                                controller.addvariants(context);
                                controller.clickNext.value = false;
                                controller.addProductVariantApi(
                                    context, controller.productId);
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
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              if (controller.producteditId == false) {
                                if (controller.netweightController.value.text
                                        .isNotEmpty &&
                                    controller.descriptionController.value.text
                                        .isNotEmpty &&
                                    controller.quantityController.value.text
                                        .isNotEmpty &&
                                    controller.materialController.value.text
                                        .isNotEmpty &&
                                    controller
                                        .sizeController.value.text.isNotEmpty &&
                                    controller
                                        .mrpController.value.text.isNotEmpty &&
                                    controller.discountController.value.text
                                        .isNotEmpty &&
                                    controller.lengthController.value.text
                                        .isNotEmpty &&
                                    controller.breadthController.value.text
                                        .isNotEmpty &&
                                    controller.dropdownValue.value.isNotEmpty &&
                                    controller
                                        .dropdownValues.value.isNotEmpty &&
                                    controller.heightController.value.text
                                        .isNotEmpty &&
                                    controller.selectedColor.value.isNotEmpty &&
                                    controller.sellingprice.value != 0.0) {
                                  controller.addvariants(context);
                                  controller.clickNext.value = true;
                                  controller.addProductVariantApi(
                                      context, controller.productId);
                                } else {
                                  CommonMethods.showToast(
                                      "Please Fill All the Details");
                                }
                              } else {
                                controller.addvariants(context);
                                controller.clickNext.value = true;
                                controller.addProductVariantApi(
                                    context, controller.productId);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5D2E17),
                              padding: const EdgeInsets.symmetric(
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
          ],
        ));
  }
}
