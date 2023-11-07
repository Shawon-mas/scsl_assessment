import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/app_constants.dart';



TextStyle whiteStyle({
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.lato(
    color: whiteColor,
    fontWeight: FontWeight.w300,
    fontSize: 14.sp,
  );
}

TextStyle titleBlack({
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.lato(
    color: primaryBlack,
    fontWeight: FontWeight.bold,
    fontSize:fontSize?? 20.sp,
  );
}
TextStyle descriptionBlack({
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.lato(
    color: primaryBlack,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
}
TextStyle titleGrey({
  double? fontSize,
  FontWeight? fontWeight,
  TextDecoration? textDecoration,
}) {
  return GoogleFonts.lato(
    color: primaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    decoration: textDecoration,
  );
}

TextStyle titlePink({
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.lato(
    color: secondaryColor,
    fontWeight: fontWeight??FontWeight.w500,
    fontSize:fontSize?? 14.sp,
  );

}

TextStyle redStyle({
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.lato(
    color: storkColor,
    fontWeight: fontWeight??FontWeight.w500,
    fontSize:fontSize?? 14.sp,
  );

}

