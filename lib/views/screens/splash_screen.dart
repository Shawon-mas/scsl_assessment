import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scsl_assessment/gen/assets.gen.dart';
import 'package:scsl_assessment/global/app_constants.dart';

import '../../controller/global_controller.dart';
import '../components/custom_text_styles.dart';
class SplashScreen extends StatelessWidget {
  final controller = Get.put(GlobalController(), permanent: true);

   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(Assets.icon.background,fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.icon.task,
                    height: 100.h,
                    width: 100.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "TaskMaster",
                    style: titlePink(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(5.r),

                      color: primaryBlack,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
