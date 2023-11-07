import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';



final logger = Logger();

errorToast({String? text}) {
  Fluttertoast.showToast(msg: text ?? "Something went wrong", backgroundColor: Colors.red);
}

successToast({String? text}) {
  Fluttertoast.showToast(msg: text ?? "Success", backgroundColor: Colors.green);
}

infoToast({required String text}) {
  Fluttertoast.showToast(msg: text, backgroundColor: Colors.indigo);
}
