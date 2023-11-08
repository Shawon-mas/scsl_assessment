import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/global_controller.dart';
import '../../model/post_details_data.dart';
import '../components/app_bar.dart';
import '../components/item_details_card.dart';
class PostDetailsScreen extends StatelessWidget {
  final int postId;

  final _controller = Get.put(GlobalController());

   PostDetailsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    _controller.fetchPostDetails(postId);

    return WillPopScope(
      onWillPop: ()async{
        _controller.postDetails.value=PostDetailsData(
            userId: 0,id: 0,title: '',body: ''
        );
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Obx(() => Stack(
          children: [
            Image.asset('assets/icon/bg.png',
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
            _controller.postDetails.value.id==0
                ?Center(child: SizedBox(height:50.h,width:50.w,child: CircularProgressIndicator()))
                :ItemDetailsCard(
              id: _controller.postDetails.value.id.toString(),
              subTittle: _controller.postDetails.value.title.toString(),
              userId: _controller.postDetails.value.userId.toString(),
              body: _controller.postDetails.value.body.toString(),
            ),

          ],
        )),
      ),
    );
  }
}
