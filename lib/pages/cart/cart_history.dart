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
  for(int x=0;x<cartItemsPerOrder.length;x++){
    for(int y=0;y<itemsPerOrder[x];y++){
      print('inner loop is:'+y.toString());
      print('My order is'+getCartHistoryList[listCounter++].toString());
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
                      //   DateTime parseDate=DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
                      //   var inputDate=DateTime.parse(parseDate.toString());
                      //  var outputFormat= DateFormat("MM/dd/yyyy hh:mm a");
                      //  var outputDate=outputFormat.format(inputDate);
                         return BigText(text: "02/06/2022 04:38 PM");
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
                            if(listCounter<getCartHistoryList.length){
                            listCounter++;
                            }
                            return index<=2?Container(
                            //child: Text("Hi There...."),
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.only(right: Dimensions.width10/2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].img!) )
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
}