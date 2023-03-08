import 'package:fooddeliveryapp/data/repository/cart_repo.dart';
import 'package:fooddeliveryapp/models/cart_model.dart';
import 'package:fooddeliveryapp/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel>_items={};
  Map<int, CartModel> get items=>_items;

  void addItem(ProductModel product,int quantity){
  //print('length of the item is:'+_items.length.toString());
  if(_items.containsKey(product.id!)){
   _items.update(product.id!, (value) {
    return CartModel(
      id:value.id,
      name:value.name,
      price:value.price,
      img:value.img,
      isExit:true,
      quantity:value.quantity!+quantity,
      time:DateTime.now().toString(),
    ); 
   } );
  }else{
 
     _items.putIfAbsent(product.id!, () {
      
      // print('adding item to the cart id:'+product.id.toString()+"\nQuantity"+quantity.toString());

      // _items.forEach((key,value){
      //   print("Quantity is......"+value.quantity.toString());
      // });
      return CartModel(
      id:product.id,
      name:product.name,
      price:product.price,
      img:product.img,
      isExit:true,
      quantity:quantity,
      time:DateTime.now().toString(),
    );});
  }
    

  }
  
 bool existInCart(ProductModel product){
    if(_items.containsKey(product.id!)){
      return true;
    }else{
      return false;
    }
  }

 int  getQuantity(ProductModel product){
  var quantity=0;
  if(_items.containsKey(product.id)){
    _items.forEach((key, value) { 
      if(key==product.id){
      quantity=value.quantity!;
      }
    });
  }
return quantity;

}


}