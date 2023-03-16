import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/controllers/popular_product_controller.dart';
import 'package:fooddeliveryapp/controllers/recommended_product_controller.dart';
import 'package:fooddeliveryapp/routes/route_helper.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {


  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResouce() async{
     await  Get.find<PopularProductController>().getPopularProductList();
    await  Get.find<RecommededProductController>().getRecommendedProductList();

    }
@override
  void initState(){
    super.initState();
    _loadResouce();
    controller= AnimationController(
      vsync: this,
      duration: Duration(seconds: 2))..forward();
    animation=CurvedAnimation(parent: controller,
     curve: Curves.linear);

     Timer(Duration(seconds: 3), ()=>
      Get.offNamed(RouteHelper.getInitial())
     );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
            child: Center(child: Image.asset("asset/image/logo part 1.png",
            //width: 250,
            width: Dimensions.splashImg,
            ))),
          Center(child: Image.asset("asset/image/logo part 2.png",
         // width: 250,
         width: Dimensions.splashImg,
          )),
        ],
      ),
    );
  }
}