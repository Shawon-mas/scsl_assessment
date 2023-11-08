import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scsl_assessment/global/app_constants.dart';

import '../../controller/global_controller.dart';
class Popup extends StatefulWidget {
  final GlobalController controller ;

  const Popup({super.key, required this.controller});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> with SingleTickerProviderStateMixin{
  var toggle=true;
  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 350),reverseDuration:Duration(milliseconds: 275) );
    _animation=CurvedAnimation(parent: _controller, curve: Curves.easeOut,reverseCurve: Curves.easeIn);
    _controller.addListener(() {
      setState(() {

      });
    });
  }

  Alignment alignment1=Alignment(0.0, 0.0);
  Alignment alignment2=Alignment(0.0, 0.0);
  Alignment alignment3=Alignment(0.0, 0.0);
  double size1=50.0;
  double size2=50.0;
  double size3=50.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          child: Stack(
            children: [

              AnimatedAlign(
                duration:toggle? Duration(milliseconds: 275):Duration(milliseconds: 875),
                alignment: alignment1,
                curve:toggle? Curves.easeIn:Curves.elasticOut,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 275),
                    curve:toggle? Curves.easeIn:Curves.easeOut,
                  height: size1,
                  width: size1,
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Icon(
                    Icons.call,color: Colors.white,
                  ),
                ),
              ),
              AnimatedAlign(
                duration:toggle? Duration(milliseconds: 275):Duration(milliseconds: 875),
                alignment: alignment2,
                curve:toggle? Curves.easeIn:Curves.elasticOut,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 275),
                    curve:toggle? Curves.easeIn:Curves.easeOut,
                  height: size2,
                  width: size2,
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Icon(
                    Icons.message,color: Colors.white,
                  ),
                ),
              ),
              AnimatedAlign(
                duration:toggle? Duration(milliseconds: 275):Duration(milliseconds: 875),
                alignment: alignment3,
                curve:toggle? Curves.easeIn:Curves.elasticOut,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 275),
                    curve:toggle? Curves.easeIn:Curves.easeOut,
                  height: size3,
                  width: size3,
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Icon(
                    Icons.contacts,color: Colors.white,
                  ),
                ),
              ),
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 375),
              curve: Curves.easeOut,
              height:toggle? 70:60,
              width: toggle? 70:60,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(60)
                ),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    splashColor: Colors.black45,
                      splashRadius: 31.0,
                      onPressed: (){
                        setState(() {
                          if(toggle){
                              toggle = !toggle;
                              _controller.forward();
                              alignment1=Alignment(-0.7, -0.4);
                              size1=50.0;
                              alignment2=Alignment(0.0, -0.8);
                              size2=50.0;
                              alignment3=Alignment(0.7, -0.4);
                              size3=50.0;
                            }else{
                            toggle = !toggle;
                            _controller.reverse();
                            alignment1=Alignment(0.0, 0.0);
                            alignment2=Alignment(0.0, 0.0);
                            alignment3=Alignment(0.0, 0.0);

                          }
                          });
                  }, icon: Icon(toggle?Icons.add:Icons.cancel_outlined,size: 30,color: Colors.white,)),
                ),
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
