import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:new_task_api/model/model.dart';

class DoctorService {
  static Future <List<Doctor>?>getDocters()async{
    try {
      var resposse = await Dio().get('https://eldoctor.free.beeceptor.com');
      GetDoctersModel doctersModel =getDoctersModelFromJson(jsonEncode(resposse.data));
      (resposse.data);
      ("success");
      return doctersModel.doctors;
     } on DioError catch (e) {
      ("dio error cateched service");
      (e.message);
      (e.response!.data);
      (e.type);
     (e);
    } catch (e) {
      ("service catch");
      (e);
    }
  }
}