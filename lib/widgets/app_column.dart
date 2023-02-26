import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:fooddeliveryapp/widgets/icon_and_text_widget.dart';
import 'package:fooddeliveryapp/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(text: text,size: Dimensions.font23,),
                      SizedBox(height: Dimensions.height10,),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: 15,)),
                          ),
                          SizedBox(width: Dimensions.width10,),
                          SmallText(text: "4.5"),
                          SizedBox(width: Dimensions.width10,),
                          SmallText(text: "1287"),
                          SizedBox(width: Dimensions.width10,),
                          SmallText(text: "Comments")
    
                        ],
                      ),
                    
                   SizedBox(height: Dimensions.height20,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      IconAndTextWidget(text: "Normal", icon: Icons.circle_sharp, iconColor: AppColors.iconColor1),
                      IconAndTextWidget(text: "1.7 km", icon: Icons.location_on, iconColor: AppColors.mainColor),
                      IconAndTextWidget(text: "32min", icon: Icons.access_time_rounded, iconColor: AppColors.iconColor2)
                    ],
                   ),
                    ],
                  );
  }
}