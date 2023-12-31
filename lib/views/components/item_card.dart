




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global/app_constants.dart';
import 'custom_text_styles.dart';
class ItemCard extends StatelessWidget {
  final String title;
  final String subTittle;
  final String userId;
  final VoidCallback onTap;

  ItemCard({required this.title, required this.subTittle, required this.userId, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              "Content ID: $title",
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
            Text(
              "User ID: $userId",
              style: titlePink(),
            ),
            SizedBox(height: 8.h),
            InkWell(
              splashColor: Colors.transparent,
              onTap: onTap,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    height: 30.h,
                   width: 80.w,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(5.r)

                  ),
                  child: Center(
                    child: Text(
                      'Read',style: whiteStyle(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

