import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String MainbaseUrl;
  late Map<String, String> _mainheaders;

  ApiClient({required this.MainbaseUrl}) {
    this.baseUrl = this.MainbaseUrl;
    timeout = Duration(seconds: 30);
    _mainheaders = {
      'content-type': 'application/json ; charset=utf-8',
      'Authorization ': 'Bearer $token',
    };
  }
  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
