import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/api_endpoint.dart';
import '../data_storage/token_local_storage.dart';
import '../model/request_model/create_order_request_model.dart';
import '../model/response_model/create_order_response_model.dart';


class CreateOrderService {
  static final Dio dio = Dio();

  static Future<CreateOrderResponseModel?> create(
      CreateOrderRequestModel createOrder) async {
    final url = ApiEndpoints.createOrder();
    print(url);
   final String accessToken = TokenStorage.retrieveToken();

    try {
      var response = await dio.post(
        url,
        data: createOrder.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'})
        // options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 201) {
        var result = CreateOrderResponseModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      if (e is SocketException) {
        return CreateOrderResponseModel(message: e.message);
      } else if (e is DioError) {
        print(e.response!.statusCode);
        print(e.response!.data);

        return CreateOrderResponseModel(message: e.response!.data['message']);
      } else {}
    }
  }
}