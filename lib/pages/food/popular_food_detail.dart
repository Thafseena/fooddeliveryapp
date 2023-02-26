import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/app_column.dart';
import 'package:fooddeliveryapp/widgets/app_icon.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:fooddeliveryapp/widgets/expandaple_text_widget.dart';
import 'package:fooddeliveryapp/widgets/icon_and_text_widget.dart';
import 'package:fooddeliveryapp/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
     print("Current height is:"+MediaQuery.of(context).size.height.toString());
     print("Current width is:"+MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
             // height: 290,
             height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'asset/image/food0.png'
                  ))
              ),

          )),
       //icon widgets
       Positioned(
        top: Dimensions.height45,
        left: Dimensions.width20,
        right: Dimensions.width20,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIcon(icon: Icons.arrow_back_ios),
            AppIcon(icon: Icons.shopping_cart_outlined)
          ],
        ) ),
       //introduction of food
        Positioned(
          top: Dimensions.popularFoodImgSize-20,
          bottom: 0,
          left: 0,
          right: 0,
          child:Container(
            padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppColumn(text: "Biriani",),
                SizedBox(height:Dimensions.height20),
                BigText(text: "Introduce"),
                SizedBox(height:Dimensions.height10),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpandableTextWidget(text: "Chicken marinated in a spiced youghurt is placed in a large pot,then layered "
                                 " with fried onions (cheeky easy sub below!), fresh coriander/cilantro,thn par boiled lightly spiced rice."
                                 "The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow"
                                  "Chicken marinated in a spiced youghurt is placed in a large pot,then layered "
                                 " with fried onions (cheeky easy sub below!), fresh coriander/cilantro,thn par boiled lightly spiced rice."
                                 "The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow"
                                  "Chicken marinated in a spiced youghurt is placed in a large pot,then layered "
                                 " with fried onions (cheeky easy sub below!), fresh coriander/cilantro,thn par boiled lightly spiced rice."
                                 "The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow"),
                  ),
                ),
              ],
            )
          ) ),
          //expandable text widget
        
        ],
      ),
      bottomNavigationBar: Container(
       // height: 110,
       height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(
         // color: Colors.amber,
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20)
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: "0"),
                   SizedBox(width: Dimensions.width10/2),
                  Icon(Icons.add,color: AppColors.signColor),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              child: BigText(text: "\$10 | Add to cart",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}