import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scsl_assessment/views/components/custom_text_styles.dart';
import 'package:scsl_assessment/views/screens/post_details_screen.dart';

import '../../controller/global_controller.dart';
import '../../gen/assets.gen.dart';
import '../../global/app_constants.dart';
import '../components/item_card.dart';

class HomeScreen extends StatelessWidget {
  final GlobalController controller;
  final _controller = Get.put(GlobalController());

  HomeScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Obx(() => Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
                image: AssetImage('assets/icon/bg.png')
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildSearchBar(),
                  SizedBox(height: 24.h,),
                 _controller.isFetchPost.value
                  ?Center(child: SizedBox(height:50.h,width:50.w,child: CircularProgressIndicator()))
                  :Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _controller.filterItems.length,
                          itemBuilder: (context, index) {
                            final post=_controller.filterItems[index];
                                return Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 20.h),
                                  child: ItemCard(
                                    title: post.id.toString(),
                                    subTittle: post.title.toString(),
                                    userId: post.userId.toString(),
                                    onTap: (){
                                       Get.to(()=>PostDetailsScreen(
                                         postId: post.id,
                                       ) );
                                    },
                                  ),
                                );
                          }))
                ],
              ),
        )),
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      style: titleBlack(fontSize: 14.sp),
      controller: _controller.searchController,
      onChanged: (query) {
        _controller.filterItem(query);
      },
      decoration: InputDecoration(

        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryBorderColor)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryBorderColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryBorderColor)),
        hintText: "Search...",
        hintStyle: titleBlack(fontSize: 14.sp),
        prefixIcon: Padding(
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset(Assets.icon.search),
        ),
      ),
    );
  }
}
