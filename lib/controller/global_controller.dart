import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scsl_assessment/gen/assets.gen.dart';
import 'package:scsl_assessment/global/helpers.dart';

import '../api/api_helper.dart';
import '../api/api_urls.dart';
import '../global/db_helper.dart';
import '../model/bottomnav_items.dart';
import '../model/post_data.dart';
import '../model/post_details_data.dart';
import '../views/components/custom_animated_popup.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/main_home_screen.dart';
import '../views/screens/notification_screen.dart';

class GlobalController extends GetxController {
  final searchController=TextEditingController();
  var posts = <PostData>[].obs;
  RxList filterItems=[].obs;
  RxInt selectedIndex = 0.obs;
  var items=[
    BottomNavItems(icon: Assets.icon.home,label: 'হোম'),
    BottomNavItems(icon: Assets.icon.notification,label: 'হোম'),
  ];
 final postDetails= PostDetailsData(
   userId: 0,id: 0,title: '',body: ''
 ).obs;
var isFetchPost=false.obs;
  @override
  void onInit() {
    fetchAllPost();
    gotoHome();
    filterItems.value=posts;
    super.onInit();
  }
  List<Widget> screens(GlobalController controller) {
    return [
      HomeScreen(controller: controller),
      Popup(controller: controller),
    ];
  }
  gotoHome() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => MainHomeScreen());
    });
  }
 fetchAllPost() async{
   isFetchPost.value=true;
   final response = await generalGet(url: ApiUrl.postUrl );
   if (response == null) {
     errorToast(text: 'Something went wrong');
     return;
   }
   try{
     final postData = postDataFromJson(response.body);
     posts.value=postData;
     logger.d(posts.length);
     isFetchPost.value=false;

     for (final post in postData) {
         await DatabaseHelper.instance.insertPost({
         'userId': post.userId,
         'title': post.title,
         'body': post.body,
       }).then((value) {
         logger.d(true);
       }).onError((error, stackTrace){
         logger.e(error);
         logger.e(stackTrace);
       });

     }
   }catch(e){
     isFetchPost.value=false;
     errorToast(text: e.toString());
   }
 }
  fetchPostDetails(int id) async{
    final response = await generalGet(url: "${ApiUrl.postUrl}/$id" );
    if (response == null) {
      return;
    }
    try{
      final postDetailsData = postDetailsDataFromJson(response.body);
      postDetails.value=postDetailsData;

    }catch(e){

    }
  }
 void filterItem(String id){
   List results=[];
   if(id.isEmpty){
     results=posts;
   }else{
     results=posts
         .where((item) => item.userId
         .toString()
         .toLowerCase()
         .contains(id.toLowerCase())).toList();
   }
   filterItems.value=results;
 }
}