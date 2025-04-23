import 'package:ecomerce_app/data/reposotory/Popular_Product_repo.dart';
import 'package:ecomerce_app/models/model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularRepo repo;

  PopularProductController({required this.repo});
  List<dynamic> _popularproductList = [];
  List<dynamic> get popularproductList => _popularproductList;
  bool _isloading=false;
  bool get isLoading=>_isloading;

  Future<Response> getproductList() async {
    Response response = await repo.getPopularproductList();
    if (response.statusCode == 200) {
      _popularproductList = [];
      _popularproductList.addAll(Product.FromJson(response.body).products);
      _isloading=true;
      update();
    }
  }
}
