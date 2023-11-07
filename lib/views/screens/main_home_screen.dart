import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scsl_assessment/global/helpers.dart';

import '../../controller/global_controller.dart';
import '../../gen/assets.gen.dart';
import '../../global/app_constants.dart';
import '../components/app_bar.dart';
import '../components/custom_painter.dart';
import '../components/custom_text_styles.dart';
class MainHomeScreen extends StatelessWidget {
  final controller = Get.put(GlobalController());
   MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: CustomAppBar(),
      body:  Obx(() {
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.screens(controller),
        );
      }),
      bottomNavigationBar:  BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: ListView.separated(
              itemCount: controller.items.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 50.w); // Add the desired space between items
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                final items=controller.items[index];
                return Obx(() => itemBar(icon: items.icon,
                    label: items.label,
                    color:controller.selectedIndex.value==index
                        ?storkColor
                        :Colors.transparent ,
                    onTap: (){
                      controller.selectedIndex.value=index;
                      logger.d(controller.selectedIndex.value);
                      logger.d(index);
                    }));
              }),
      ),

        floatingActionButton: FloatingActionButton(

        shape: CircleBorder(),
        backgroundColor: secondaryColor,
        onPressed: () {

        },
        child: SvgPicture.asset(Assets.icon.support),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
Widget  itemBar({required String icon, required String label,required VoidCallback onTap,required Color color}) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 50.w),
      child: InkWell(
        onTap: onTap,
        child: Column(

          children: [
            SvgPicture.asset(icon),
            Text(
             label,
              style: redStyle(
              ),
            ),
            Spacer(),
            Container(
              height: 3.h,
              width: 50.w,
              color: color,
            )

          ],
        ),
      ),
    );
  }
}
/*
bottomNavigationBar: Obx(() => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            currentIndex: controller.selectedIndex.value,
            onTap: (int index){
              controller.selectedIndex.value = index;

            },
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey.shade300,
            items: [
              itemBar(Icons.home, "Home"),
              itemBar(Icons.shop, "Shop"),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.transparent,
                  ),
                  label: ""),
              itemBar(Icons.volunteer_activism, "Donation"),
              itemBar(Icons.settings, "Setting")
            ],
          ))),
 */