import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/data/repository/popular_product_repo.dart';
import 'package:fooddeliveryapp/models/products_model.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList=>_popularProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;
  int _quantity=0;
  int get quantity=>_quantity; 
  int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;

  Future<void> getPopularProductList() async{
   Response response=await popularProductRepo.getPopularProductList();
   if(response.statusCode==200){
    print("statusCode"+response.statusCode.toString());
    print("got products");
    _popularProductList=[];
    _popularProductList.addAll(Product.fromJson(response.body).products); 
    print("_popularProductList"+response.body.toString());
    _isLoaded=true;
    update();
   }else{
     
   }
  }
  
   void setQuantity(bool isIncrement){
    if(isIncrement){
      print('increment by 1'+_quantity.toString());
      _quantity= checkQuantity(_quantity+1);
    }else{
    _quantity=checkQuantity(_quantity-1);
    }
    update();
   }

  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Item Count", "You can't reduce anymore...!",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      return 0;
    }else if(quantity>20){
      Get.snackbar("Item Count", "You can't add anymore...!",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }
   }

   void initProduct(){
    _quantity=0;
    _inCartItems=0;
    //if exisist
    
    //get from storage _inCartItems
   }

   void addItem(ProductModel product){

   }
}