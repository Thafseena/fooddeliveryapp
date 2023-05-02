import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/controllers/cart_controller.dart';
import 'package:fooddeliveryapp/data/repository/popular_product_repo.dart';
import 'package:fooddeliveryapp/models/cart_model.dart';
import 'package:fooddeliveryapp/models/products_model.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList=>_popularProductList;
  late  CartController _cart;

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
   // print("got products");
    _popularProductList=[];
    _popularProductList.addAll(Product.fromJson(response.body).products); 
   // print("_popularProductList"+response.body.toString());
    _isLoaded=true;
    update();
   }else{
     
   }
  }
  
   void setQuantity(bool isIncrement){
    if(isIncrement){
      print('increment by 1'+_quantity.toString());
      _quantity= checkQuantity(_quantity+1);
      print("number of items"+_quantity.toString());
    }else{
    _quantity=checkQuantity(_quantity-1);
    print("decrement"+_quantity.toString());
    }
    update();
   }

  int checkQuantity(int quantity){
    if((_inCartItems+quantity)<0){
      Get.snackbar("Item Count", "You can't reduce anymore...!",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      if(_inCartItems>0){
        _quantity=-_inCartItems;
        return _quantity;
      }
      return 0;
    }else if((_inCartItems+quantity)>20){
      Get.snackbar("Item Count", "You can't add anymore...!",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }
   }

   void initProduct(ProductModel product,CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart=cart;
    var exist=false;
    exist=_cart.existInCart(product);
    //print('Exist or not'+exist.toString());
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
    //if exisist
   // print('The quantity in the cart is==='+_inCartItems.toString());
    //get from storage _inCartItems
   }

   void addItem(ProductModel product){
   // if(quantity>0){
      _cart.addItem(product, _quantity);
      _quantity=0; 
      _inCartItems=_cart.getQuantity(product);
      _cart.items.forEach((key, value) { 
        print('The id is====='+value.id.toString()+'The quantity is:'+value.quantity.toString());
      });
   /*  }else{
      Get.snackbar("Item Count", "You should at least add an item in the cart!",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
    } */
  update();
   }

   int get totalItems{
   return  _cart.totalItems;
   }

   List<CartModel> get getItems{
    return  _cart.getItems;
   }

 }