import 'package:ecomerce_app/data/Api/api_client.dart';
import 'package:ecomerce_app/home/AppConstants.dart';
import 'package:get/get.dart';

class PopularRepo extends GetxService {
  final ApiClient apiClient;

  PopularRepo({required this.apiClient});
  Future<Response> getPopularproductList() async {
    return await apiClient.getData(AppConstant.BaseUrl);
  }
}
