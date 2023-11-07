import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scsl_assessment/views/components/custom_text_styles.dart';

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
        child: Obx(() => Column(
              children: [
                buildSearchBar(),
                SizedBox(height: 24.h,),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _controller.posts.length,
                        itemBuilder: (context, index) {
                          final post=_controller.posts[index];
                              return ItemCard(
                                title: post.id.toString(),
                                subTittle: post.title.toString(),
                                userId: post.userId.toString(),
                                onTap: (){

                                },
                              );
                        }))
              ],
            )),
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      style: titleBlack(fontSize: 14.sp),
      controller: _controller.searchController,
      onChanged: (query) {
        // controller.filterChatHistories(query);
        /*controller.searchQuery.value = query;
        controller.filterChatHistory();
        if(query.isEmpty){
          controller.searchQuery.value='';
          controller.filteredChatHistory.value=[];
        }*/
      },
      decoration: InputDecoration(
        //  contentPadding: EdgeInsets.fromLTRB(12.w, 15.h, 12.w, 0),

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
