import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/controllers/cart_controller.dart';
import 'package:fooddeliveryapp/controllers/popular_product_controller.dart';
import 'package:fooddeliveryapp/pages/home/main_food_page.dart';
import 'package:fooddeliveryapp/utils/app_constants.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/app_column.dart';
import 'package:fooddeliveryapp/widgets/app_icon.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:fooddeliveryapp/widgets/expandaple_text_widget.dart';
import 'package:fooddeliveryapp/widgets/icon_and_text_widget.dart';
import 'package:fooddeliveryapp/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
   PopularFoodDetail({Key?key,required this.pageId}):super(key:key);

  @override
  Widget build(BuildContext context) {
    var product=Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
     print("Current height is:"+MediaQuery.of(context).size.height.toString());
     print("Current width is:"+MediaQuery.of(context).size.width.toString());
     print('page is id=='+pageId.toString());
     print('product name is'+product.name.toString());
    print('product price'+product.price.toString());
     
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
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                    //'asset/image/food0.png'
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
            GestureDetector(
              onTap: (){
                Get.to(MainFoodPage());
              },
              child: AppIcon(icon: Icons.arrow_back_ios)),
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
                AppColumn(text: product.name!),
                SizedBox(height:Dimensions.height20),
                BigText(text: "Introduce"),
                SizedBox(height:Dimensions.height10),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpandableTextWidget(text: product.description),
                  ),
                ),
              ],
            )
          ) ),
          //expandable text widget
        
        ],
      ),
      bottomNavigationBar:GetBuilder<PopularProductController >(builder: (popularProduct){
        return  Container(
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
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: Icon(Icons.remove,color: AppColors.signColor)),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: popularProduct.inCartItems.toString()),
                   SizedBox(width: Dimensions.width10/2),
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(true);
                    },
                    child: Icon(Icons.add,color: AppColors.signColor)),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                  popularProduct.addItem(product);
                },
              child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                child: BigText(
                  text: "\$${product.price} | Add to cart",
                  color: Colors.white,),
                       
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ],
        ),
      );
      }),
    );
  }
}