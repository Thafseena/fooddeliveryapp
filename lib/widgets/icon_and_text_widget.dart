import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  
  final Color iconColor;
  const IconAndTextWidget({super.key,required this.text,
  required this.icon,
  
  required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,color: iconColor,size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: text),
      ],
    );
  }
}