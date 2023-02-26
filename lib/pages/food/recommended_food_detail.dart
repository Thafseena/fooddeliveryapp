import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/app_icon.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:fooddeliveryapp/widgets/expandaple_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
         slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
               // Icon(Icons.shopping_cart_outlined)
              ],
            ),
            //floating: false,
            bottom: PreferredSize(child: Container(
             // margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              padding: EdgeInsets.only(top: 5,bottom: 10),
               decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20),)
              ),
              child: Center(child: BigText(size: Dimensions.font26,text: "Chinese Side")),
              width: double.maxFinite,
            ), preferredSize: Size.fromHeight(20)),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              //title: Text("sample"),
             background: Image.asset('asset/image/food0.png',
              //width: double.maxFinite,
              fit: BoxFit.cover,
              ),
            
            ),
          ),
          SliverToBoxAdapter(
          child:Column(
            children: [
              Container(
                child: ExpandableTextWidget(text:"Chicken marinated in a spiced youghurt is placed in a large pot,then layered "
                                 " with fried onions (cheeky easy sub below!), fresh coriander/cilantro,thn par boiled lightly spiced rice."
                                 "The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow"
                                  "Chicken marinated in a spiced youghurt is placed in a large pot,then layered "
                                 " with fried onions (cheeky easy sub below!), fresh coriander/cilantro,thn par boiled lightly spiced rice."
                                 "The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow"
                                 "Chicken marinated in a spiced youghurt is placed in a large pot,then layered "
                                 " with fried onions (cheeky easy sub below!), fresh coriander/cilantro,thn par boiled lightly spiced rice."
                                 "The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow"
                                  "Chicken marinated in a spiced youghurt is placed in a large pot,then layered "
                                 " with fried onions (cheeky easy sub below!), fresh coriander/cilantro,thn par boiled lightly spiced rice."
                                 "The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow"
                                 "Chicken marinated in a spiced youghurt is placed in a large pot,then layered "
                                 " with fried onions (cheeky easy sub below!), fresh coriander/cilantro,thn par boiled lightly spiced rice."
                                 "The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow"
                                  "Chicken marinated in a spiced youghurt is placed in a large pot,then layered "
                                 " with fried onions (cheeky easy sub below!), fresh coriander/cilantro,thn par boiled lightly spiced rice."
                                 "The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow",
                                 ),
                                 margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              )
            ],
          )
          )
         ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right:  Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                iconSize: Dimensions.iconSize24,
                iconColor:Colors.white,
                backgroundColor: AppColors.mainColor,
                icon: Icons.remove),
                BigText(text: "\$12.88 "+" X "+" 0 ",color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(
                iconSize: Dimensions.iconSize24,
                iconColor:Colors.white,
                backgroundColor: AppColors.mainColor,
                icon: Icons.add)
              ],
            ),
          ),
          Container(
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
              child:Icon(
                Icons.favorite,
                color: AppColors.mainColor,
              )
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
        ],
      ),
    );
  }
}