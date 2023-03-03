import 'package:fooddeliveryapp/data/repository/cart_repo.dart';
import 'package:fooddeliveryapp/models/cart_model.dart';
import 'package:fooddeliveryapp/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel>_items={};

  void addItem(ProductModel product,int quantity){
    _items.putIfAbsent(product.id!, () => CartModel(
      id:product.id,
      name:product.name,
      price:product.price,
      img:product.img,
      isExit:true,
      quantity:quantity,
      time:DateTime.now().toString(),
    ));
  }
}