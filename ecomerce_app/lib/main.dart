import 'package:ecomerce_app/controllers/controllers_popular.dart';
import 'package:ecomerce_app/controllers/recomandeed_product_controller.dart';
import 'package:ecomerce_app/home/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<RecomandedProductController>().getRecomandedList();
    Get.find<PopularProductController>().getproductList();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MainFoodpage());
  }
}
