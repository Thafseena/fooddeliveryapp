import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/base/no_data_page.dart';
import 'package:fooddeliveryapp/controllers/cart_controller.dart';
import 'package:fooddeliveryapp/controllers/popular_product_controller.dart';
import 'package:fooddeliveryapp/controllers/recommended_product_controller.dart';
import 'package:fooddeliveryapp/pages/home/home_page.dart';
import 'package:fooddeliveryapp/pages/home/main_food_page.dart';
import 'package:fooddeliveryapp/routes/route_helper.dart';
import 'package:fooddeliveryapp/utils/app_constants.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/app_icon.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:fooddeliveryapp/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //header
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      log("clicked icon home");
                      Get.to(() => HomePage());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              )),
          //Listview builder for cart viewing products body
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getItems.length>0? Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                // color: Colors.red,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child:
                        GetBuilder<CartController>(builder: (cartController) {
                      var _cartList = cartController.getItems;
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            /* for tested for designing
                   return Container(
                    height: 100,
                    width: 200,
                    color: Colors.blue,
                    margin: EdgeInsets.only(bottom: 10),
                  ); */
                            return Container(
                              width: double.maxFinite,
                              height: Dimensions.height20 * 5,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      var popularIndex =
                                          Get.find<PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                      if (popularIndex >= 0) {
                                        Get.toNamed(RouteHelper.getPopularFood(
                                            popularIndex, "cartpage"));
                                      } else {
                                        var recommendedIndex = Get.find<
                                                RecommededProductController>()
                                            .recommededProductList
                                            .indexOf(_cartList[index].product!);
                                        if (recommendedIndex < 0) {
                                          Get.snackbar(
                                            "History Product",
                                            "Product review is not available for history products!",
                                            backgroundColor:
                                                AppColors.mainColor,
                                            colorText: Colors.white,
                                          );
                                        } else {
                                          Get.toNamed(
                                              RouteHelper.getRecommendedFood(
                                                  recommendedIndex,
                                                  "cartpage"));
                                        }
                                        // Get.toNamed(
                                        //     RouteHelper.getRecommendedFood(
                                        //         recommendedIndex, "cartpage"));
                                      }
                                      // print(" iam clicked the image to go the exact page!");
                                    },
                                    child: Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.height10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +
                                                  cartController
                                                      .getItems[index].img!),
                                          // AssetImage(
                                          //   "asset/image/food0.png"
                                          // )
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: Dimensions.height20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cartController
                                              .getItems[index].name!,
                                          // "Bitter Orange Juice",
                                          color: Colors.black54,
                                        ),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: cartController
                                                  .getItems[index].price
                                                  .toString(),
                                              //"\$33.0",
                                              color: Colors.redAccent,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.height10,
                                                  bottom: Dimensions.height10,
                                                  left: Dimensions.width10,
                                                  right: Dimensions.width10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius20)),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            -1);
                                                        //popularProduct.setQuantity(false);
                                                      },
                                                      child: Icon(Icons.remove,
                                                          color: AppColors
                                                              .signColor)),
                                                  SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2),
                                                  BigText(
                                                      text: _cartList[index]
                                                          .quantity
                                                          .toString()
                                                      // "0"
                                                      ), //popularProduct.inCartItems.toString()),
                                                  SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2),
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            1);
                                                        print("being tapped");
                                                        // popularProduct.setQuantity(true);
                                                      },
                                                      child: Icon(Icons.add,
                                                          color: AppColors
                                                              .signColor)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            );
                          });
                    })),
              )):NoDataPage(text: "Your cart page is empty!");
       
          })
          ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
          // height: 110,
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20),
          decoration: BoxDecoration(
              // color: Colors.amber,
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              )),
          child: cartController.getItems.length>0?Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: Row(
                  children: [
                    /* GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: Icon(Icons.remove,color: AppColors.signColor)), */
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(text: "\$" + cartController.totalAmount.toString()),
                    SizedBox(width: Dimensions.width10 / 2),
                    /* GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(true);
                    },
                    child: Icon(Icons.add,color: AppColors.signColor)), */
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // popularProduct.addItem(product);
                  cartController.addToHistory();
                  print("Tapped on check out");
                  cartController.storageItems.clear();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  child: BigText(
                    text: "Check out",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ):Container(),
        );
      }),
    );
  }
}
