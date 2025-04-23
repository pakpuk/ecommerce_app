import 'package:ecomerce_app/controllers/controllers_popular.dart';
import 'package:ecomerce_app/controllers/recomandeed_product_controller.dart';
import 'package:ecomerce_app/data/Api/api_client.dart';
import 'package:ecomerce_app/data/reposotory/Popular_Product_repo.dart';
import 'package:ecomerce_app/data/reposotory/Recomande_prodict_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Apiclien
  Get.lazyPut(
      () => ApiClient(MainbaseUrl: "https//ghaihtsefiane/popularproduct"));
  //reposotories
  Get.lazyPut(() => PopularRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecomandeProductcontroller(apiClient: Get.find()));
  //controller
  Get.lazyPut(() => PopularProductController(repo: Get.find()));
  Get.lazyPut(() => RecomandedProductController(repo: Get.find()));
}
