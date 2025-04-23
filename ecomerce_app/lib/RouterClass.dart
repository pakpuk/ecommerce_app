import 'package:ecomerce_app/home/Popular_page_detail.dart';
import 'package:ecomerce_app/home/main_food_page.dart';
import 'package:get/get.dart';

class Router {
  static String initial = "/";
  static String popularFood = "/popular-Food";
  static String recomandedfood ="/recomanded-food";

  static String getinitial()=>"$initial";
  static String getpopularFood(int pageId)=>"$popularFood?pageId=$pageId";
  static String getrecomandedfood()=>"$recomandedfood";

  List<GetPage> routes =[
GetPage(name: initial, page: ()=>),
GetPage(name:popularFood , page: (){
  var pageId= Get.parameters.['pageId'];
  return PageUi (pageId);
},
transition : Transition.fadeIn
),
GetPage(name:recomandedfood , page: ()=>),


    
  ]
  
}

