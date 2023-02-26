import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/controllers/popular_product_controller.dart';
import 'package:fooddeliveryapp/models/products_model.dart';
import 'package:fooddeliveryapp/utils/app_constants.dart';
import 'package:fooddeliveryapp/utils/colors.dart';
import 'package:fooddeliveryapp/utils/dimensions.dart';
import 'package:fooddeliveryapp/widgets/app_column.dart';
import 'package:fooddeliveryapp/widgets/big_text.dart';
import 'package:fooddeliveryapp/widgets/icon_and_text_widget.dart';
import 'package:fooddeliveryapp/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController=PageController(viewportFraction:0.85);
  var _currentPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.PageViewContainer;
 @override
 void initState(){
  super.initState();
  pageController.addListener(() {
   setState(() {
     _currentPageValue= pageController.page!;
    //  print("Current pagevalue"+_currentPageValue.toString());
   });
  });
 }
 @override
 void dispose(){
  pageController.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider Widget
      GetBuilder<PopularProductController>(builder: (popularProducts){
        return   Container(
      //  color: Colors.redAccent,
      height: Dimensions.PageView,
      child: PageView.builder(
        controller: pageController,
        itemCount: popularProducts.popularProductList.length,
        itemBuilder: (context, position){
           return _buildPageItem(position,popularProducts.popularProductList[position]);
      }
      ),
      );  
      }),     
       // dots
    GetBuilder<PopularProductController>(builder: (popularProducts){
       return   DotsIndicator(
  dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
  position: _currentPageValue,
  decorator: DotsDecorator(
    activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
   activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
);

    }),
         //Popular text
     SizedBox(height: Dimensions.height30,),
     Container(
      margin: EdgeInsets.only(left: Dimensions.width30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(text: "Popular"),
          SizedBox(width: Dimensions.width10),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: BigText(text: ".",color: Colors.black26,),
          ),
          SizedBox(width: Dimensions.width10),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: SmallText(text: "Food pairing"),
          )
        ],
      ),
     ),
     //list of food and images
    
       ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true, 
        //it is used when physics is alwaysscrollablescrollphysics()
      itemCount: 10,
      itemBuilder: (context, index) {
         return Container(
          margin: EdgeInsets.only(left:Dimensions.width20 ,right:Dimensions.width20,bottom: Dimensions.height10),
          child: Row(
            children: [
              //image section
              Container(
                // height: 120,
               // width: 120,
               height: Dimensions.listViewImgSize,
              width:  Dimensions.listViewImgSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white38,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("asset/image/food0.png"))
                ),
              ),
            //text container
            Expanded(
              child: Container(
             //  height: 100,
             //  width: 200,
              height: Dimensions.listViewTextContSize,
            
                // width: ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,top: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                            BigText(text: "Nutritious fruit meal in china"),
                            SizedBox(height: Dimensions.height10),
                            SmallText(text: "With chinese characterstics"),
                            SizedBox(height: Dimensions.height10),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconAndTextWidget(text: "Normal", icon: Icons.circle_sharp, iconColor: AppColors.iconColor1),
                        IconAndTextWidget(text: "1.7 km", icon: Icons.location_on, iconColor: AppColors.mainColor),
                        IconAndTextWidget(text: "32min", icon: Icons.access_time_rounded, iconColor: AppColors.iconColor2)
                      ],
                     )
                  
                      ],
                    ),
                  ),
                  ),

              ),
            
            )
            ],
          ),
         );
     }),
     
      ],
    );
  }

  Widget _buildPageItem(int index,ProductModel popularProduct){
    Matrix4 matrix=new Matrix4.identity();
    if(index==_currentPageValue.floor()){
      var currScale=1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
    }else if(index==_currentPageValue.floor()+1){
      var currScale=_scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
    }else if(index==_currentPageValue.floor()-1){
      var currScale=1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
    }else{
      var currScale=0.8;
      matrix=Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: 
          [
          Container(
          //  width: double.infinity,
            height: Dimensions.PageViewContainer,
             margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color:index.isEven?const Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
               image:NetworkImage(AppConstants.BASE_URL+"/uploads/"+popularProduct.img!) ),
            //  image:AssetImage("asset/image/food0.png") ),
            ),
          ),
           Align(
            alignment: Alignment.bottomCenter,
             child: Container(
              height: Dimensions.PageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30,bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color:Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                     blurRadius: 5.0,
                    // offset:Offset(-5,-5)
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                   color: Colors.white,
                   offset: Offset(-5, 0) 
                  ),
                  BoxShadow(
                   color: Colors.white,
                   offset: Offset(5, 0) 
                  ),

                ],
                 ),
                 child: Container(
                  //color: Colors.redAccent,
                 // width: 320,
                  padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.width15,right: Dimensions.width15),
                  child:AppColumn(text: popularProduct.name!,)
                  //AppColumn(text: "Chinese Side",)
                 ),
                  ),

           ),
        ],
      ),
    );
  }
}