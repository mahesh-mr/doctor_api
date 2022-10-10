import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:new_task_api/controller/controller/doctor_controller.dart';
import 'package:new_task_api/controller/controller/style.dart';
import 'package:new_task_api/controller/service/apoiment.controller.dart';
import 'package:new_task_api/view/home.dart';

import 'package:new_task_api/view/widgets/textform.dart';

// ignore: must_be_immutable
class AppoimentDetails extends StatelessWidget {
  AppoimentDetails({Key? key}) : super(key: key);
  ApoimentController apoimentController = Get.put(ApoimentController());
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final sheight = SizedBox(height: height * .01);
    final swidth = SizedBox(width: width * .01);
    return Scaffold(
      backgroundColor: blue_shade,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: blue_shade,
        title: Text(
          "Apoiment Details",
          style: headLines,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                child: Lottie.network(
                    "https://assets1.lottiefiles.com/packages/lf20_njhsezni.json",
                    height: height * .4)),
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    name_FIeld(),
                    sheight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        age_Field(width),
                        radioButton(width, height),
                      ],
                    ),  sheight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        datePicker(width, height),
                      
                        timePicker(width, height),
                      ],
                    ),
                    sheight,
                    GetBuilder<ApoimentController>(builder: (controller) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: dark_blue,
                            shape: const StadiumBorder(),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            //         content: Text('Apoiment Bokked')));

                            if (formkey.currentState!.validate()) {}
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(const HomeScreen());
                                    },
                                    child: const AlertDialog(
                                      title: const Text("Success"),
                                      content: Text("Saved successfully"),
                                    ),
                                  );
                                });
                          },
                          child: const Text("Submit"));
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//================radio=======================================================
  Container radioButton(double width, double height) {
    return Container(
      width: width * .62,
      height: height * .06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
          border: Border.all(color: grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const Icon(Icons.person, color: grey),
            Obx(
              () {
                return Radio(
                  value: "Male",
                  groupValue: apoimentController.selectedGenter.value,
                  onChanged: (value) {
                    apoimentController.onchangeGenter(value);
                  },
                  activeColor: grey,
                  fillColor: MaterialStateProperty.all(grey),
                );
              },
            ),
            const Text("Male"),
            Obx(
              () {
                return Radio(
                  value: "Female",
                  groupValue: apoimentController.selectedGenter.value,
                  onChanged: (value) {
                    apoimentController.onchangeGenter(value);
                  },
                  activeColor: grey,
                  fillColor: MaterialStateProperty.all(grey),
                );
              },
            ),
            const Text("Female"),
          ],
        ),
      ),
    );
  }

//================================time====================================
  Obx timePicker(double width, height) {
    return Obx(() {
      return Row(
        children: [
          IconButton(
              onPressed: () {
                apoimentController.choseTime();
              },
              icon: const Icon(
                Icons.watch_later,
                color: grey,
              )),
          Container(
            width: width * .3,
            height: height * .06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: grey),
              color: white,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  "${apoimentController.selectTime.value.hour}:${apoimentController.selectTime.value.minute}"),
            ),
          ),
        ],
      );
    });
  }

//==============================date==================================================
  Row datePicker(double width, height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              apoimentController.choseDate();
            },
            icon: const Icon(
              Icons.date_range,
              color: grey,
            )),
        Obx(() {
          return Container(
            width: width * .3,
            height: height * .06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: grey),
              color: white,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(DateFormat("dd-MM-yyyy")
                  .format(apoimentController.selectedDate.value)
                  .toString()),
            ),
          );
        }),
      ],
    );
  }

//================age=====================================================
  SizedBox age_Field(double width) {
    return SizedBox(
      width: width * .3,
      child: TextForm(
          textinputType: TextInputType.phone,
          validator: (value) {
            if (value!.isEmpty || value == null) {
              return "Required Field";
            } else if (int.parse(value) < 0 || int.parse(value) > 120) {
              return "Must be b/w 0-120";
            } else {
              return null;
            }
          },
          controller: ageController,
          icons: Icons.person,
          title: "Age"),
    );
  }

//==============NAME===========================================================
  TextForm name_FIeld() {
    return TextForm(
      textinputType: TextInputType.text,
      validator: (value) {
        if (value!.length == 0) {
          return "Enter your name";
        } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
          return 'Please enter a valid name';
        } else {
          return null;
        }
      },
      controller: nameController,
      icons: Icons.person,
      title: "Name",
    );
  }
}
