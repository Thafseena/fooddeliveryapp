import 'dart:developer';

import 'package:fooddeliveryapp/pages/cart/cart_page.dart';
import 'package:fooddeliveryapp/pages/food/popular_food_detail.dart';
import 'package:fooddeliveryapp/pages/food/recommended_food_detail.dart';
import 'package:fooddeliveryapp/pages/home/home_page.dart';
import 'package:fooddeliveryapp/pages/home/main_food_page.dart';
import 'package:fooddeliveryapp/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper{
   static const String splashPage="/splash-page";
   static const String initial="/"; 
   static const String popularFood="/popular-food";
   static const String recommendedFood="/recommended-food";
   static const String cartPage="/cart-page";
    
    static String getSplashPage()=>'$splashPage';
    static String getInitial()=>'$initial';
    static String getPopularFood(int pageId,String page)=>'$popularFood?pageId=$pageId&page=$page';
    static String getRecommendedFood(int pageId1,String page1)=>'$recommendedFood?pageId1=$pageId1&page1=$page1';
    static String getCartPage()=>'$cartPage';

   static List<GetPage> routes=[
    GetPage(name: splashPage, page: ()=>SplashScreen()),
   GetPage(name: initial, page: ()=>HomePage()),
   GetPage(name: popularFood , page: (){
    var pageId=Get.parameters['pageId'];
    var page=Get.parameters['page'];
   return PopularFoodDetail(pageId: int.parse(pageId!),page:page!);
    },
    transition: Transition.fadeIn

   ),
   GetPage(name: recommendedFood, page: (){
    log("kkkk");
    var pageId1=Get.parameters['pageId1'];
    var page1=Get.parameters['page1'];
    return RecommendedFoodDetail(pageId1:int.parse(pageId1!),page1:page1!);
   },
   transition: Transition.fadeIn,
   ),
   GetPage(name: cartPage, page: (){
    return CartPage();
   },
   transition: Transition.fadeIn
   )

   ];

}