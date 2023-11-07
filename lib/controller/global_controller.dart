import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scsl_assessment/gen/assets.gen.dart';
import 'package:scsl_assessment/global/helpers.dart';

import '../api/api_helper.dart';
import '../api/api_urls.dart';
import '../model/bottomnav_items.dart';
import '../model/post_data.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/main_home_screen.dart';
import '../views/screens/notification_screen.dart';

class GlobalController extends GetxController {
  final searchController=TextEditingController();
  var posts = <PostData>[].obs;

  RxInt selectedIndex = 0.obs;
  var items=[
    BottomNavItems(icon: Assets.icon.home,label: 'হোম'),
    BottomNavItems(icon: Assets.icon.notification,label: 'হোম'),
  ];


  @override
  void onInit() {
    fetchAllPost();
    gotoHome();

    super.onInit();
  }
  List<Widget> screens(GlobalController controller) {
    return [
      HomeScreen(controller: controller),
      NotificationScreen(controller: controller),
    ];
  }
  gotoHome() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => MainHomeScreen());
    });
  }
 fetchAllPost() async{
   final response = await generalGet(url: ApiUrl.postUrl );
   if (response == null) {
     return;
   }
   try{
     final postData = postDataFromJson(response.body);
     posts.value=postData;
     logger.d(posts.length);
   }catch(e){

   }
 }

}