import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../views/screens/main_home_screen.dart';

class GlobalController extends GetxController {


  @override
  void onInit() {
    gotoHome();
    super.onInit();
  }

  gotoHome() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => MainHomeScreen());
    });
  }


}