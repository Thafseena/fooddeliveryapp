import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
 // TextOverflow overFlow;
   SmallText({super.key,this.color=const Color(0xFFccc7c5), required this.text,
   this.height=1.0,
   //this.overFlow=TextOverflow.ellipsis,
  this.size=12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
    text,
   //overflow: overFlow,
    style: TextStyle(color: color,
    fontSize: size,
    fontFamily: 'Roboto',
    height: height)
    );
  }
}