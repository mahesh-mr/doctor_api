import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_task_api/controller/controller/doctor_controller.dart';
import 'package:new_task_api/controller/controller/style.dart';
import 'package:new_task_api/view/appoimet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorController doctorController = Get.put(DoctorController());
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final sheight = SizedBox(
      height: height * .01,
    );
    final swidth = SizedBox(
      width: width * .01,
    );
    return Scaffold(
      appBar: AppBar(
          actions: [
            filtter(context),
            sort(context),
          ],
          elevation: 0,
          backgroundColor: apbar_color,
          title: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "search by: Specialities, Symptoms",
              fillColor: white,
              focusColor: apbar_color,
              filled: true,
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(8), // Added this
            ),
          )),
      body: Obx(() {
        if (doctorController.isloding.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (doctorController.doctors.isEmpty) {
          return const Center(
            child:  Text("data is empty"),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Doctors Available (${doctorController.doctors.length})",
                style: headLines,
              ),
            ),
            sheight,
            Expanded(
              child: ListView.builder(
                itemCount: doctorController.doctors.length,
                itemBuilder: (context, index) {
                  final data = doctorController.doctors[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(AppoimentDetails());
                    },
                    child: SizedBox(
                      height: height * .18,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: grey, //<-- SEE HERE
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: width * .25,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                color: blue_shade,
                              ),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(top: height * .03),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(data.image!),
                                    radius: 40,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.doctorName!,
                                    style: headLines,
                                  ),
                                  sheight,
                                  Row(
                                    children: [
                                      IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Text(
                                              data.multiSpecialityKeyword!,
                                              style: subtitle,
                                            ),
                                            const VerticalDivider(
                                              color: subtitle_color,
                                              thickness: 1,
                                            ),
                                            Text(
                                              "${data.yearsOfExperience!} Years Exp",
                                              style: subtitle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  sheight,
                                  const SizedBox(
                                      width: 250,
                                      child:
                                          Divider(thickness: 1, color: grey)),
                                  sheight,
                                  Row(
                                    children: [
                                      const Icon(Icons.school_outlined,
                                          color: grey),
                                      swidth,
                                      SizedBox(
                                          width: 210,
                                          child: Text(
                                            data.qualification!,
                                            style: qualification,
                                            maxLines: 3,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

//===================sort=====================================
  IconButton sort(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: const Text("SORT"),
                  children: [
                    SimpleDialogOption(
                      onPressed: () {},
                      child: const Text("Experiance Low to High"),
                    ),
                    SimpleDialogOption(
                      onPressed: () {},
                      child: const Text("Experiance High to Low"),
                    )
                  ],
                );
              });
          Get.back();
        },
        icon: const Icon(CupertinoIcons.arrow_up_arrow_down, color: dark_blue));
  }
//========================filter==================================================================
  IconButton filtter(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const SimpleDialog(
                  // ignore: unnecessary_const
                  title: const Text("FILTER"),
                );
              });
          Get.back();
        },
        icon: const Icon(
          CupertinoIcons.slider_horizontal_3,
          color: dark_blue,
        ));
  }
}
