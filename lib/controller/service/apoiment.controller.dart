import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApoimentController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectTime = TimeOfDay.now().obs;
var selectedGenter = "Male".obs;

onchangeGenter(var genter){
  selectedGenter.value =genter;
  print(genter);
}

  choseDate() async {
    DateTime? pickDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2022),
        cancelText: 'Close',
        confirmText: 'Conform',
           errorInvalidText: 'Provide Valid Date'
        selectableDayPredicate: disableDate,
        lastDate: DateTime(2024));

    if (pickDate != null && pickDate != selectedDate.value) {
      selectedDate.value = pickDate;
    }
  }
  choseTime() async {
    TimeOfDay? pickTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectTime.value,
        initialEntryMode:  TimePickerEntryMode.input,
        cancelText: 'Close',
        confirmText: 'Conform',
        errorInvalidText: 'Provide Valid Time'
  
     );

    if (pickTime != null && pickTime != selectTime.value) {
      selectTime.value = pickTime;
    }
  }

  bool disableDate(DateTime day) {
    if (day.isAfter(DateTime.now().subtract(Duration(days: 1)))) {
      return true;
    }
    return false;
  }
}
