import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/controllers/cart_controller.dart';
import 'package:fooddeliveryapp/controllers/popular_product_controller.dart';
import 'package:fooddeliveryapp/controllers/recommended_product_controller.dart';
import 'package:fooddeliveryapp/pages/cart/cart_page.dart';
import 'package:fooddeliveryapp/pages/food/recommended_food_detail.dart';
import 'package:fooddeliveryapp/pages/home/food_page_body.dart';
import 'package:fooddeliveryapp/pages/home/main_food_page.dart';
import 'package:fooddeliveryapp/pages/food/popular_food_detail.dart';
import 'package:fooddeliveryapp/pages/splash/splash_page.dart';
import 'package:fooddeliveryapp/routes/route_helper.dart';
import 'package:fooddeliveryapp/test/carthis.dart';
import 'package:get/get.dart';
import 'helper/depentencies.dart' as dep;
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
        return GetBuilder<RecommededProductController>(builder: (_){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            initialRoute: RouteHelper.getSplashPage(),
           
            getPages: RouteHelper.routes,
             //home:CartHis() ,
          );
        });
    });
  /*  /*  Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommededProductController>().getRecommendedProductList(); */
    print("aaa");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //home: CartPage(),
     // home: MainFoodPage(),
    // home: SplashScreen(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    ); */
  }
}
