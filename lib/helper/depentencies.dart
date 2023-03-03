import 'package:fooddeliveryapp/controllers/cart_controller.dart';
import 'package:fooddeliveryapp/controllers/popular_product_controller.dart';
import 'package:fooddeliveryapp/controllers/recommended_product_controller.dart';
import 'package:fooddeliveryapp/data/api/api_client.dart';
import 'package:fooddeliveryapp/data/repository/cart_repo.dart';
import 'package:fooddeliveryapp/data/repository/popular_product_repo.dart';
import 'package:fooddeliveryapp/data/repository/recommended_product_repo.dart';
import 'package:fooddeliveryapp/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async{
  //api client
   Get.lazyPut(() => ApiClient(appBaseUrl:AppConstants.BASE_URL));
  
  //repos
   Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
   Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
   Get.lazyPut(() => CartRepo());

   //controllers
   Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
   Get.lazyPut(() => RecommededProductController(recommededProductRepo: Get.find()));
   Get.lazyPut(() => CartController(cartRepo: Get.find()));
}