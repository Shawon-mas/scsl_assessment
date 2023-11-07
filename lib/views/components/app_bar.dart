import 'package:flutter/material.dart';

import 'custom_text_styles.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  // TODO: implement preferredSize
  final Size preferredSize;
   CustomAppBar({Key? key,}): preferredSize = const Size.fromHeight(kToolbarHeight),
         super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: Text('Application',style: titleBlack(),),
      centerTitle: true,
    );
  }


}
