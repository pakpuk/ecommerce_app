import 'package:ecomerce_app/data/reposotory/Recomande_prodict_repo.dart';
import 'package:ecomerce_app/models/model.dart';
import 'package:get/get.dart';

class RecomandedProductController extends GetxController {
  final RecomandeProductcontroller repo;

  RecomandedProductController({required this.repo});
  List<dynamic> _recoproductList = [];
  List<dynamic> get recoproductList => _recoproductList;
  bool _isloading = false;
  bool get isLoading => _isloading;

  Future<Response> getRecomandedList() async {
    Response response = await repo.getrecoproductList();
    if (response.statusCode == 200) {
      _recoproductList = [];
      _recoproductList.addAll(Product.FromJson(response.body).products);
      _isloading = true;
      update();
    
    }
  }
}
