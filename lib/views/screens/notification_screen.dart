import 'package:flutter/material.dart';

import '../../controller/global_controller.dart';
class NotificationScreen extends StatelessWidget {
  final GlobalController controller ;

  const NotificationScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Noti'),
      ),
    );
  }
}
/*
ListView.separated(
                itemCount: controller.items.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16); // Add the desired space between items
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  final items=controller.items[index];
                  return itemBar(icon: items.icon,
                      label: items.label,
                      onTap: (){
                         controller.selectedIndex.value=index;
                      });
                }),
 */