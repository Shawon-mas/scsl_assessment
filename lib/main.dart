import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scsl_assessment/views/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'TaskMaster',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
              textTheme: GoogleFonts.latoTextTheme(),
            /*textTheme: GoogleFonts.poppinsTextTheme(),
            colorSchemeSeed: tealColor,*/
          ),
          home: SplashScreen(),
        );
      }
    );
  }
}


