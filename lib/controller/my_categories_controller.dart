import 'package:get/get.dart';
import 'package:news/controller/home_controller.dart';
import 'package:news/controller/myhomecontroller.dart';
import 'package:news/core/class/status_request.dart';
import 'package:news/view/screens/homescreen.dart';

class MyCategoriesControllerImp extends GetxController {
  StatusRequest statusRequest = StatusRequest.noAction;
  void categories(String cat) {
    MyHomePageControllerImp.isSelectedCategory = cat;
    HomeControllerImp.currentpage = 0;
    Get.offAll(const HomeScreen());
  }
}
