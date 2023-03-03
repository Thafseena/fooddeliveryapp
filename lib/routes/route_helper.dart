import 'package:fooddeliveryapp/pages/food/popular_food_detail.dart';
import 'package:fooddeliveryapp/pages/food/recommended_food_detail.dart';
import 'package:fooddeliveryapp/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper{
 
   static const String initial="/"; 
   static const String popularFood="/popular-food";
   static const String recommendedFood="/recommended-food";
    
    static String getInitial()=>'$initial';
    static String getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';
    static String getRecommendedFood(int pageId1)=>'$recommendedFood?pageId1=$pageId1';

   static List<GetPage> routes=[
   GetPage(name: initial, page: ()=>MainFoodPage()),
   GetPage(name: popularFood , page: (){
    var pageId=Get.parameters['pageId'];
   return PopularFoodDetail(pageId: int.parse(pageId!));
    },
    transition: Transition.fadeIn

   ),
   GetPage(name: recommendedFood, page: (){
    var pageId1=Get.parameters['pageId1'];
    return RecommendedFoodDetail(pageId1:int.parse(pageId1!));
   },
   transition: Transition.fadeIn,
   )

   ];

}