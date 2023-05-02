import 'dart:convert';

import 'package:fooddeliveryapp/models/cart_model.dart';
import 'package:fooddeliveryapp/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{

final SharedPreferences sharedPreferences;
CartRepo({required this.sharedPreferences});

 List<String> cart=[];    
 List<String> cartHistory=[];
 void addToCartList(List<CartModel> cartList){
  //  sharedPreferences.remove(AppConstants.CART_LIST);
  // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  var time=DateTime.now().toString();
  cart=[];     
  /*  
  converts objects to string because sharedPreferences only accepts strings
  */
 /*  cartList.forEach((element) {
    return cart.add(jsonEncode(element));
  }); */

  cartList.forEach((element) {
    element.time=time;
  return  cart.add(jsonEncode(element));
    });
  sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
  print('SharedPreferences for cartList'+sharedPreferences.getStringList(AppConstants.CART_LIST).toString());
 //  getCartList();
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
   
   List<CartModel> getCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory=[];
      cartHistory=sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    print('SharedPreferences for CART_HISTORY List'+sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST).toString());
    }
    List<CartModel> cartListHistory=[];
    cartHistory.forEach((element)=>cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    print("Carthistory List length =="+cartListHistory.length.toString());
    print("Carthistory List length =="+cartListHistory.length.toString());

    // for(int m=0;m<=cartListHistory.length;m++){
    // print("cart image -----------"+cartListHistory[m].toString());
    // }
    return cartListHistory;
   }

   void addToCartHistoryList(){

    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
    cartHistory=sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
     for(int i=0;i<cart.length;i++){
      print("history list"+cart[i]);
      //  print("history list"+cart[i]);
      cartHistory.add(cart[i]);
      //print("The image for order is:"+getCartHistoryList()[i].img.toString());
     }
     removeCart();
     sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
    print("The length of history list is:"+getCartHistoryList().length.toString());
    for(int j=0;j<getCartHistoryList().length;j++){
      print("The image for order is:"+getCartHistoryList()[j].img.toString());
    }
   // removeCart();
   }

   void removeCart(){
    cart=[];
    sharedPreferences.remove(AppConstants.CART_LIST);
   }
}