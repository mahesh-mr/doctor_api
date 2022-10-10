// To parse this JSON data, do
//
//     final getDoctersModel = getDoctersModelFromJson(jsonString);

import 'dart:convert';

GetDoctersModel getDoctersModelFromJson(String str) =>
    GetDoctersModel.fromJson(json.decode(str));

String getDoctersModelToJson(GetDoctersModel data) =>
    json.encode(data.toJson());

class GetDoctersModel {
  GetDoctersModel({
    this.doctors,
  });

  List<Doctor>? doctors;

  factory GetDoctersModel.fromJson(Map<String, dynamic> json) =>
      GetDoctersModel(
        doctors:
            List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "doctors": List<dynamic>.from(doctors!.map((x) => x.toJson())),
      };
}

class Doctor {
  Doctor({
    this.doctorId,
    this.doctorName,
    this.qualification,
    this.multiSpecialityKeyword,
    this.yearsOfExperience,
    this.image,
  });

  int? doctorId;
  String? doctorName;
  String? qualification;
  String? multiSpecialityKeyword;
  String? yearsOfExperience;
  String? image;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        doctorId: json["doctorId"],
        doctorName: json["doctorName"],
        qualification: json["qualification"],
        multiSpecialityKeyword: json["MultiSpecialityKeyword"],
        yearsOfExperience: json["YearsOfExperience"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "doctorId": doctorId,
        "doctorName": doctorName,
        "qualification": qualification,
        "MultiSpecialityKeyword": multiSpecialityKeyword,
        "YearsOfExperience": yearsOfExperience,
        "image": image,
      };
}
