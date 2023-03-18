import 'dart:convert';

import 'package:fooddeliveryapp/models/cart_model.dart';
import 'package:fooddeliveryapp/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{

final SharedPreferences sharedPreferences;
CartRepo({required this.sharedPreferences});

 List<String> cart=[];
 void addToCartList(List<CartModel> cartList){
  cart=[];
  /*
  converts objects to string because sharedPreferences only accepts strings
  */
 /*  cartList.forEach((element) {
    return cart.add(jsonEncode(element));
  }); */

  cartList.forEach((element) =>cart.add(jsonEncode(element)));
  sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
  //print('SharedPreferences for cartList'+sharedPreferences.getStringList("Cart-list").toString());
   getCartList();
 }
   

   List<CartModel> getCartList(){
    List<String> carts=[];

    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts=sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("inside getCartList"+carts.toString());
    }
    List<CartModel> cartList=[];
    /* carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }); */

    carts.forEach((element)=> cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;

   }
}