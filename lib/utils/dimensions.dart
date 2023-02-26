import 'package:get/get.dart';
class Dimensions{

static double screenHeight=Get.context!.height;
static double screenWidth=Get.context!.width;

static double PageView=screenHeight/2.00;//320
static double PageViewContainer=screenHeight/2.91;//220
static double PageViewTextContainer=screenHeight/5.33;//120

//dynamic height for padding and margin
static double height10=screenHeight/64.00;//10
static double height15=screenHeight/42.66;//15
static double height20=screenHeight/32.00;
static double height30=screenHeight/21.33;
static double height45=screenHeight/14.22;

//dynamic width for padding and margin
//static double width5=screenWidth
static double width10=screenHeight/73.14;
static double width15=screenHeight/48.76;
static double width20=screenHeight/36.6;
static double width30=screenHeight/24.38;
//font size
static double font16=screenHeight/40.00;
static double font14=screenHeight/45.71;
static double font20=screenHeight/36.6;//20
static double font26=screenHeight/24.61;

//radius
static double radius15=screenHeight/48.76;
static double radius20=screenHeight/36.6;
static double radius30=screenHeight/24.38;

//icon size
static double iconSize24=screenHeight/30.47;
static double iconSize16=screenHeight/40.00;

//list view size
static double listViewImgSize=screenWidth/3.43;
static double listViewTextContSize=screenWidth/3.9;
////static double listViewImgSize=screenWidth/3.42; SMJ7305F

////static double listViewTextContSize=screenWidth/4.11;  SMJ7305F
//popular food
static double popularFoodImgSize=screenHeight/2.41;

//bottom height

static double bottomHeightBar=screenHeight/6.44;
}