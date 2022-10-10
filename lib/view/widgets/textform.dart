import 'package:flutter/material.dart';
import 'package:new_task_api/controller/controller/style.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;
  final IconData icons;
  final String title;
  final TextInputType textinputType;


  // ignore: prefer_const_constructors_in_immutables
  TextForm(
      {Key? key,
      required this.textinputType,
      required this.validator,
      required this.controller,
      required this.icons,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(1),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: grey)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: grey),
          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: grey),
          ),
          prefixIcon: Icon(
            icons,
            color: grey,
          ),
          label: Text(title),
          fillColor: white,
          focusColor: apbar_color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
