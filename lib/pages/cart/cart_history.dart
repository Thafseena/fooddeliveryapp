import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/controllers/cart_controller.dart';
import 'package:fooddeliveryapp/models/cart_model.dart';
import 'package:fooddeliveryapp/routes/route_helper.dart';
import 'package:fooddeliveryapp/utils/app_constants.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/app_icon.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:fooddeliveryapp/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
      var getCartHistoryList=Get.find<CartController>().
      getCartHistoryList().reversed.toList();
  Map<String,int> cartItemsPerOrder=Map();
  
  for(int i=0;i<getCartHistoryList.length;i++){
    if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
      cartItemsPerOrder.update(getCartHistoryList[i].time!,(value)=>++value);
    }else{
      cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1);
    }
  }
 // print(cartItemsPerOrder);
  
  List<int> cartItemsPerOrderToList(){
  // return cartItemsPerOrder.entries.map((e)=>e.value).toList();
    return cartItemsPerOrder.entries.map((e){
      return e.value;
    }).toList();
  }
  
    List<String> cartOrderTimeToList(){
  // return cartItemsPerOrder.entries.map((e)=>e.value).toList();
    return cartItemsPerOrder.entries.map((e){
      return e.key;
    }).toList();
  }
  List<int> itemsPerOrder=cartItemsPerOrderToList();
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
            height: Dimensions.height10*10,
           // height: 100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
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
            child:MediaQuery.removePadding(
              removeTop: true,
              context: context, child: ListView( 
              children: [
                for(int i=0;i<itemsPerOrder.length;i++)
                Container(
                  height: Dimensions.height30*4,
                 // height: 120,
                    margin: EdgeInsets.only(bottom: Dimensions.height20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       ((){
                        print("current date===="+getCartHistoryList[i].time!);
                        DateTime parseDate=DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[i].time!);
                        var inputDate=DateTime.parse(parseDate.toString());
                       var outputFormat= DateFormat("MM/dd/yyyy hh:mm a");
                       var outputDate=outputFormat.format(inputDate);
                        print("current date==after convertion=="+outputDate);
                         return BigText(
                          text: outputDate,
                          //text: "${outputDate}"
                          );
                      // return BigText(text: outputDate);
                      }()),
                      /* BigText(
                        text: getCartHistoryList[listCounter].time! ,
                        //text: "05/02/2021"
                        ), */
                      SizedBox(height: Dimensions.height10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            children:List.generate(itemsPerOrder[i], (index) {
                              if(listCounter<getCartHistoryList.length){
                                listCounter++;
                              }
                              return index<=2?Container(
                                height:Dimensions.height15*5,
                                width: Dimensions.height15*5,
                                margin: EdgeInsets.only(right: Dimensions.width10/2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].img!
                                  ))
                                ),
                                //  child: Text("Hi there"),
                              ):Container();
                            })
                          ),
                          Container(
                            //color: Colors.red,
                            height: Dimensions.height15*5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SmallText(text: "Total"),
                                BigText(text: itemsPerOrder[i].toString()+" Items",color: AppColors.tittleColor,),
                               GestureDetector(
                                onTap: (){
                                  var orderTime=cartOrderTimeToList();
                                 //print("Order Time"+orderTime[i].toString());
                                 Map<int, CartModel> moreOrder={};
                                 for(int j=0;j<getCartHistoryList.length;j++){
                                  if(getCartHistoryList[j].time==orderTime[i]){
                                    //print("My order time ****"+orderTime[i]);
                                   // print("The cart or product id is"+getCartHistoryList[j].id.toString());
                                   //print("Product info is====="+jsonEncode(getCartHistoryList[j]));
                                    moreOrder.putIfAbsent(getCartHistoryList[j].id!, () => 
                                    CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j])))
                                    );
                                  }
                                 }
                                 Get.find<CartController>().setItems=moreOrder;
                                 Get.find<CartController>().addToCartList();
                                 Get.toNamed(RouteHelper.getCartPage());
                                },
                                child:  Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,
                                  vertical: Dimensions.height10/2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                    border: Border.all(width: 1,color: AppColors.mainColor),
                                  ),
                                  child: SmallText(text: "one more",color: AppColors.mainColor,),
                                ),
                               )
                              ],
                            ),
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
            ),)
            ),
          ),
        ],
      ),
    );
  }
}



/* import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/controllers/cart_controller.dart';
import 'package:fooddeliveryapp/utils/app_constants.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/app_icon.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:fooddeliveryapp/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

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
  print("cart details========="+cartItemsPerOrder.toString());
  
  List<int> cartOrderTimeToList(){
  // return cartItemsPerOrder.entries.map((e)=>e.value).toList();
    return cartItemsPerOrder.entries.map((e){
      return e.value;
    }).toList();
  }
  
  List<int> itemsPerOrder=cartOrderTimeToList();
  //print(orderTimes);
  var listCounter=0;
  for(int x=0;x<cartItemsPerOrder.length;x++){
    for(int y=1;y<itemsPerOrder[x];y++){
      print('inner loop is:'+y.toString());
      print('My order is'+getCartHistoryList[listCounter++].toString());
      print("images in cart"+AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].img!);
    }
  }

    return Scaffold(
      /* appBar: AppBar(
        actions: [
          Icon(Icons.shopping_cart),
        ],
        title: Center(child: BigText(text: 'Cart History')),
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
                BigText(text: "Cart History",color: Colors.white,),
                AppIcon(icon: Icons.shopping_cart_outlined,
                iconColor: AppColors.mainColor,
                backgroundColor: AppColors.yellowColor,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
             // height: 400,
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child:MediaQuery.removePadding(
                removeTop: true,
                context: context, child:  ListView(
                children: [
                 for(int i=0;i<itemsPerOrder.length;i++)
                 Container(
                  height: 120,
                       margin: EdgeInsets.only(bottom: Dimensions.height20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //immediately invoke function ((){}())
                      ((){
                        print("current date===="+getCartHistoryList[i].time!);
                        DateTime parseDate=DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[i].time!);
                        var inputDate=DateTime.parse(parseDate.toString());
                       var outputFormat= DateFormat("MM/dd/yyyy hh:mm a");
                       var outputDate=outputFormat.format(inputDate);
                        print("current date==after convertion=="+outputDate);
                         return BigText(text: "${outputDate}");
                      // return BigText(text: outputDate);
                      }()),
                    //  BigText(
                    //   text: getCartHistoryList[listCounter].time!,
                    //   //text: "05/04/2023"
                    //   ),
                     SizedBox(height:Dimensions.height10),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          children: List.generate(itemsPerOrder[i], (index) {
                            print('itemsperorder[i]===='+itemsPerOrder[i].toString());
                            for(int k=0;k<itemsPerOrder.length;k++){
                            print("images for cart history screen"+AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].img!);
                          }
                            if(listCounter<getCartHistoryList.length){
                            listCounter++;
                            }
                            print("image in cart history =="+AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[index].img.toString());
                            return index<=2?Container(
                            //child: Text("Hi There...."),
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.only(right: Dimensions.width10/2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                // image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].img!) )
                                image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[index].img!) )
                            ),
                            ):Container();
                          })
                        ),
                        Container(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SmallText(text: 'Total'),
                              BigText(text: itemsPerOrder[i].toString()+" items",color: AppColors.tittleColor,),
                              Container(
                               // padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                padding: EdgeInsets.symmetric( horizontal: Dimensions.width10/2,
                                vertical: Dimensions.height10/2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                  border: Border.all(width: 1,color: AppColors.mainColor),
                                  
                                ),
                                child: SmallText(text: "one more",color: AppColors.mainColor,),
                              )
                            ],
                          ),
                        )
                      ],
                     )
                    ],
                  ),
             
                 )
               
                 
                ],
              ),)
            ),
          )

        ],
      ),
    );
  }
} */