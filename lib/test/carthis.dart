/* import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/controllers/cart_controller.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/app_icon.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHis extends StatelessWidget {
  const CartHis({super.key});

  @override
  Widget build(BuildContext context) {
      var getCartHistoryList=Get.find<CartController>().getCartHistoryList();
  Map<String,int> cartItemsPerOrder=Map();
  
  for(int i=0;i<getCartHistoryList.length;i++){
    if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
      cartItemsPerOrder.update(getCartHistoryList[i].time!,(value)=>++value);
    }else{
      cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1);
    }
  }
 // print(cartItemsPerOrder);
  
  List<int> cartOrderTimeToList(){
  // return cartItemsPerOrder.entries.map((e)=>e.value).toList();
    return cartItemsPerOrder.entries.map((e){
      return e.value;
    }).toList();
  }
  
  List<int> itemsPerOrder=cartOrderTimeToList();
 // print(orderTimes);
  var listCounter=0;
    return Scaffold(
     /*  appBar: AppBar(
        actions: [
          Icon(Icons.shopping_cart)
        ],
        title: Text('Cart History'),
      ), */
      body: Column(
        children: [
          Container(
            height: 100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: 'Cart history',color: Colors.white,),
                AppIcon(icon: Icons.shopping_cart_outlined,iconColor: AppColors.mainColor,
                backgroundColor: AppColors.yellowColor,)
              ],
            ),
          ),
        Expanded(
            child: Container(
              //height: 500,
            margin: EdgeInsets.only(
              top: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            child: ListView(
              children: [
                for(int i=0;i<itemsPerOrder.length;i++)
                Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "05/02/2021"),
                      Row(
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            children: [
                              Text("Hi there"),
                              Text("Hi there")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                
                )
                // Text("data"+i.toString()),
                /* Text("data"),
                Text("data"),
                Text("data"),
                Text("data"), */
                
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
} */