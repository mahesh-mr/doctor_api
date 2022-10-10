import 'package:get/get.dart';
import 'package:new_task_api/controller/service/doctor_service.dart';
import 'package:new_task_api/model/model.dart';

class DoctorController extends GetxController{
List <Doctor>doctors =[];
  RxBool isloding = true.obs;
  Future <List<Doctor>?>getDoctorContriller()async{
try {
  var data = await DoctorService.getDocters();
  isloding.value=false;
  return data;
 } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
      print('catch bloc called');
      isloding.value = false;
    }
  }
  @override
  void onInit() {
    getDoctorContriller().then((value) => doctors=value!);
    super.onInit();
  }
}