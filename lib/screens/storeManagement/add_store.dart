import 'package:bhk_seller_app/common/commonmethods.dart';
import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/addstorecontroller.dart';
import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/resources/inputformatter.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';

class AddStore extends StatelessWidget {
  const AddStore({super.key});
  @override
  Widget build(BuildContext context) {
    AddStoreController controller = Get.put(AddStoreController());
    return Obx(
      () => Stack(
        children: [
          Container(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: AppConstants.customGradient,
                  ),
                ),
                iconTheme: const IconThemeData(color: Colors.white),
                centerTitle: true,
                title: Text(
                  "New Store".toUpperCase(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: const Color.fromARGB(195, 247, 243, 233),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title Row
                        const Row(
                          children: [
                            SizedBox(width: 5),
                            Icon(
                              Icons.store,
                              size: 20.0,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Add Store',
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),

                        // Subtitle
                        const Text(
                          'Add a Store.',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Color.fromARGB(255, 140, 136, 136),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Store Name",
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
                              return '*Required Field! Please Store Name';
                            }
                            return null;
                          },
                          cursorColor: Colors.grey,
                          cursorWidth: 1.5,
                          style: const TextStyle(height: 1),
                          controller: controller.nameController.value,
                          inputFormatters: [
                            NoLeadingSpaceFormatter(),
                            LengthLimitingTextInputFormatter(20),
                            EmojiInputFormatter(),
                            SpecialCharacterValidator(),
                            RemoveTrailingPeriodsFormatter()
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Enter Store Name',
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

                        SizedBox(height: 16.0),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "House/Flat Number",
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
                              return '*Required Field! Please enter House/Flat Number';
                            }
                            return null;
                          },
                          cursorColor: Colors.grey,
                          cursorWidth: 1.5,
                          style: const TextStyle(height: 1),
                          controller: controller.addresshouseController.value,
                          inputFormatters: [
                            NoLeadingSpaceFormatter(),
                            LengthLimitingTextInputFormatter(50),
                            SpecialCharacterValidator(),
                            EmojiInputFormatter(),
                            RemoveTrailingPeriodsFormatter()
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Enter House/Flat Number',
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
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Street",
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
                              return '*Required Field! Please enter Street';
                            }
                            return null;
                          },
                          cursorColor: Colors.grey,
                          cursorWidth: 1.5,
                          style: const TextStyle(height: 1),
                          controller: controller.addressstreetController.value,
                          inputFormatters: [
                            NoLeadingSpaceFormatter(),
                            LengthLimitingTextInputFormatter(80),
                            EmojiInputFormatter(),
                            SpecialCharacterValidator(),
                            RemoveTrailingPeriodsFormatter()
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Enter your Street',
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

                        const SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: CSCPicker(
                            ///Enable disable state dropdown [OPTIONAL PARAMETER]
                            showStates: true,

                            /// Enable disable city drop down [OPTIONAL PARAMETER]
                            showCities: true,
                            layout: Layout.vertical,

                            ///Enable (get flat with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                            flagState: CountryFlag.DISABLE,

                            ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                            dropdownDecoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 130, 127, 127),
                                ),
                                top: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 130, 127, 127),
                                ),
                                left: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 130, 127, 127),
                                ),
                                right: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 130, 127, 127),
                                ),
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)), // Add border radius
                            ),

                            ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                            disabledDropdownDecoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 130, 127, 127),
                                ),
                                top: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 130, 127, 127),
                                ),
                                left: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 130, 127, 127),
                                ),
                                right: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 130, 127, 127),
                                ),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),

                            ///selected item style [OPTIONAL PARAMETER]
                            selectedItemStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),

                            ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                            dropdownHeadingStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),

                            ///DropdownDialog Item style [OPTIONAL PARAMETER]
                            dropdownItemStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),

                            ///Dialog box radius [OPTIONAL PARAMETER]
                            dropdownDialogRadius: 10.0,

                            ///Search bar radius [OPTIONAL PARAMETER]
                            searchBarRadius: 10.0,

                            ///triggers once country selected in dropdown
                            onCountryChanged: (value) {
                              ///store value in country variable
                              controller.countryValue = value;
                            },

                            ///triggers once state selected in dropdown
                            onStateChanged: (value) {
                              ///store value in state variable
                              controller.stateValue = value;
                            },

                            ///triggers once city selected in dropdown
                            onCityChanged: (value) {
                              ///store value in city variable
                              controller.cityValue = value;
                            },
                          ),

                          // SelectState(
                          //   // style: TextStyle(color: Colors.red),
                          //   onCountryChanged: (value) {
                          //     setState(() {
                          //       countryValue = value;
                          //     });
                          //   },
                          //   onStateChanged: (value) {
                          //     setState(() {
                          //       stateValue = value;
                          //     });
                          //   },
                          //   onCityChanged: (value) {
                          //     setState(() {
                          //       cityValue = value;
                          //     });
                          //   },
                          // ),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Pin Code",
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
                              return '*Required Field! Please Enter Pin Code';
                            }
                            return null;
                          },
                          cursorColor: Colors.grey,
                          cursorWidth: 1.5,
                          style: const TextStyle(height: 1),
                          keyboardType: TextInputType.number,
                          controller: controller.pincodeController.value,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.digitsOnly,
                            NoLeadingSpaceFormatter(),

                            // Ensures that input is limited to 6 characters
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Enter Pin Code',
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
                        /*SizedBox(height: 16.0),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Select Store Opening Time",
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
                    TextField(
                      style: TextStyle(height: 0.6),
                      controller: openingTime,
                      decoration: const InputDecoration(
                        hintText: 'Enter Store opening Time',
                        hintStyle: TextStyle(fontSize: 12),
                        prefixIcon: Icon(Icons.timer, size: 20),
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
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay _selectedTime = TimeOfDay.now();
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: _selectedTime,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );

                        if (picked != null && picked != _selectedTime) {
                          setState(() {
                            _selectedTime = picked;
                            // Format the time to 24-hour format
                            String formattedTime = DateFormat('HH:mm').format(
                                DateTime(0, 0, 0, _selectedTime.hour,
                                    _selectedTime.minute));
                            openingTime.text = formattedTime;
                          });
                        }
                        // Show the time picker
                        // TimeOfDay? pickedTime = await showTimePicker(
                        //   initialTime: TimeOfDay.now(),
                        //   context: context,
                        // );

                        // if (pickedTime != null) {
                        //   // Format the picked time to a 12-hour format string
                        //   String formattedTime12Hour =
                        //       pickedTime.format(context).trim();
                        //   print(
                        //       'Picked time in 12-hour format: $formattedTime12Hour');

                        //   // Parse the time using a 12-hour format
                        //   DateTime parsedTime =
                        //       DateFormat.jm().parse(formattedTime12Hour);
                        //   print('Parsed DateTime: $parsedTime');

                        //   // Format the parsed time to a 24-hour format string
                        //   String formattedTime24Hour =
                        //       DateFormat('HH:mm:ss').format(parsedTime);
                        //   print(
                        //       'Formatted time in 24-hour format: $formattedTime24Hour');

                        //   setState(() {
                        //     openingTime.text = formattedTime24Hour;
                        //   });
                        // } else {
                        //   print("Time is not selected");
                        // }
                      },
                    ),
                    SizedBox(height: 16),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Select Store closing time",
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

                    TextField(
                      style: TextStyle(height: 0.6),
                      controller: closingTime,
                      decoration: const InputDecoration(
                        hintText: 'Enter Store closing Time',
                        hintStyle: TextStyle(fontSize: 12),
                        prefixIcon: Icon(Icons.timer, size: 20),
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
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay _selectedTime = TimeOfDay.now();
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: _selectedTime,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );

                        if (picked != null && picked != _selectedTime) {
                          setState(() {
                            _selectedTime = picked;
                            // Format the time to 24-hour format
                            String formattedTime = DateFormat('HH:mm').format(
                                DateTime(0, 0, 0, _selectedTime.hour,
                                    _selectedTime.minute));
                            closingTime.text = formattedTime;
                          });
                        }
                      },
                    ),*/
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
                            counterText: '',
                            hintText: 'Enter a description here...',
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
                        SizedBox(height: 16),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Upload Image",
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
                        SizedBox(height: 5.0),
                        Container(
                          width: double.infinity,
                          height: 150.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.image,
                                  size: 50, color: Colors.grey),
                              const SizedBox(height: 8.0),
                              const Text("Upload your image here"),
                              const SizedBox(height: 4.0),
                              ElevatedButton(
                                onPressed: () {
                                  controller.openImages(context);
                                },
                                child: const Text(
                                  'Click to browse',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),

                        // Instructions for Image upload
                        Text(
                          "Add a image to your Store. Used to represent your Store during checkout, in email, social sharing, and more.",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.errormessage,
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(height: 8.0),

                        Text("Picked File:"),
                        Divider(),
                        controller.imagefiles.value != null
                            ? Image.file(
                                controller.imagefiles.value!,
                                width: 100,
                                height: 100,
                              )
                            : Text("No image selected"),

                        SizedBox(height: 50),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.nameController.value.text.isNotEmpty &&
                                  controller.addresshouseController.value.text
                                      .isNotEmpty &&
                                  controller.addressstreetController.value.text
                                      .isNotEmpty &&
                                  controller.descriptionController.value.text
                                      .isNotEmpty &&
                                  controller.pincodeController.value.text
                                      .isNotEmpty &&
                                  controller.stateValue != null &&
                                  controller.cityValue != null &&
                                  controller.countryValue != null &&
                                  controller.imagefiles.value != null) {
                                controller.addStoreApi(context);
                              } else {
                                CommonMethods.showToast(
                                    "Please Fill All the Details");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5D2E17),
                              minimumSize: Size(double.infinity, 50),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                            child: Text(
                              'Add Store',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          progressBarTransparent(
              controller.rxRequestStatus.value == Status.LOADING,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.height)
        ],
      ),
    );
  }
}
