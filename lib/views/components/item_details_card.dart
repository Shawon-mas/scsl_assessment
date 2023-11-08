




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global/app_constants.dart';
import 'custom_text_styles.dart';
class ItemDetailsCard extends StatelessWidget {
  final String id;
  final String subTittle;
  final String userId;
  final String body;


  ItemDetailsCard({required this.id, required this.subTittle, required this.userId, required this.body});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(

      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(

          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(10.r),

            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.5),
                //    spreadRadius: 3.r,
                blurRadius: 2.r,
                offset: Offset(0.r, 1.r), // changes position of shadow
              ),
            ],
          ),


          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 18.h),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/icon/itemImage.jpg',

                  fit: BoxFit.cover,),
                SizedBox(height: 11.h),
                Text(
                  "Content ID: $id",
                  style: titleGrey(),
                ),
                SizedBox(height: 8.h),
                Text(
                  subTittle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: titleBlack(),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "User ID: $userId",
                      style: titlePink(),
                    ),
                    Container(
                      width: 125.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: secondaryColor,width: 0.5),
                        borderRadius: BorderRadius.circular(5.r)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.copy,color: secondaryColor,),
                          Text('লিংক কপি করুন',style: titlePink(),)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.h),
                Divider(color: secondaryColor,),
                SizedBox(height: 8.h),
                Text(
                  body,

                  style: titleBlack(fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

