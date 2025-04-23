import 'package:ecomerce_app/data/Api/api_client.dart';
import 'package:ecomerce_app/home/AppConstants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class RecomandeProductcontroller {
  final ApiClient apiClient;

  RecomandeProductcontroller({required this.apiClient});
  Future<Response> getrecoproductList() async {
    return await apiClient.getData(AppConstant.BaseUrl);
  }
}
