//import 'package:fooddeliveryapp/data/repository/popular_product_repo.dart';
import 'package:fooddeliveryapp/data/repository/recommended_product_repo.dart';
import 'package:fooddeliveryapp/models/products_model.dart';
import 'package:fooddeliveryapp/models/recommended_model.dart';
import 'package:get/get.dart';

class RecommededProductController extends GetxController{
  final RecommendedProductRepo  recommededProductRepo;

  RecommededProductController({required this. recommededProductRepo});
  List<dynamic> _recommededProductList=[];
  List<dynamic> get recommededProductList=>_recommededProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  Future<void> getRecommendedProductList() async{
   Response response=await  recommededProductRepo.getRecommendedProductList();
   if(response.statusCode==200){
    print("statusCode for recommented"+response.statusCode.toString());
    print("got recommendedproducts");
    _recommededProductList=[];
    _recommededProductList.addAll(Product.fromJson(response.body).products); 
    // _recommededProductList.addAll(Recommended.fromJson(response.body).recommendedproducts); 
    print("_recommededProductList"+response.body.toString());
    _isLoaded=true;
    update();
   }else{
     
   }
  }
  
  

}