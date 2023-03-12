import 'dart:math';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/controllers/cart_controller.dart';
import 'package:fooddeliveryapp/controllers/popular_product_controller.dart';
import 'package:fooddeliveryapp/controllers/recommended_product_controller.dart';
import 'package:fooddeliveryapp/routes/route_helper.dart';
import 'package:fooddeliveryapp/utils/app_constants.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/app_icon.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:fooddeliveryapp/widgets/expandaple_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
 final int pageId1;
 const  RecommendedFoodDetail({Key? key,required this.pageId1}):super(key:key);

  @override
  Widget build(BuildContext context) {
    var product1=Get.find<RecommededProductController>().recommededProductList[pageId1];
     Get.find<PopularProductController>().initProduct(product1,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
         slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                   Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear)
                  ),
                //AppIcon(icon: Icons.shopping_cart_outlined),
                     GetBuilder<PopularProductController>(builder: (controller){
          return Stack(
            children: [
                  AppIcon(icon: Icons.shopping_cart_outlined),
                  Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right: 0,top: 0,
                      child: 
                      AppIcon(icon: Icons.circle,size: 20,iconColor: Colors.transparent,backgroundColor: AppColors.mainColor,)):
                    Container(),
                    Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right: 3,top: 3,
                      child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                      size: 12,
                      color: Colors.white,)):
                    Container()
            ],
          );
        })
               // //Icon(Icons.shopping_cart_outlined)
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
              child: Center(child: BigText(size: Dimensions.font26,text: product1.name!)),
              width: double.maxFinite,
            ), preferredSize: Size.fromHeight(20)),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              //title: Text("sample"),
             background: Image.network(
              AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product1.img!,
              //'asset/image/food0.png',
              //width: double.maxFinite,
              fit: BoxFit.cover,
              ),
            
            ),
          ),
          SliverToBoxAdapter(
          child:Column(
            children: [
              Container(
                child: ExpandableTextWidget(text:product1.description!
                                 ),
                                 margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              )
            ],
          )
          )
         ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
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
             GestureDetector(
                  onTap: (){
                    controller.setQuantity(false);
                    print("I am tapped");
                  },
                  child: AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor:Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove),
                ),
                BigText(text: "\$${product1.price!}  X  ${controller.inCartItems} ",color: AppColors.mainBlackColor,size: Dimensions.font26,),
                GestureDetector(
                  onTap: (){
                    controller.setQuantity(true);
                    print("I am tapped");
                  },
                  child: AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor:Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add),
                ),
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
            GestureDetector(
              onTap: (){
                controller.addItem(product1);
                print("clicked add button");
              },
              child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                child: BigText(text: "${product1.price!} | Add to cart",color: Colors.white,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
        ],
      );
      })
    );
  }
}