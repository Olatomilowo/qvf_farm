import 'package:dio/dio.dart';
import 'package:qvf_farm/core/api_endpoint.dart';
import 'package:qvf_farm/data/data_storage/token_local_storage.dart';
import 'package:qvf_farm/data/model/request_model/update_order_request_model.dart';
import '../model/response_model/update_order_response_model.dart';
import '../model/response_model/produce_category.dart';

class UpdateOrderService {
  static final Dio dio = Dio();
  static Future<UpdateOrderResponseModel?> get(
      String id, UpdateOrderRequestModel request) async {
    final url = ApiEndpoints.updateOrder(id);
    final String accessToken = TokenStorage.retrieveToken();

    print(url);

    try {
      var response = await dio.put(url,
          data: request.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = UpdateOrderResponseModel.fromJson(response.data);

        return result;
      }
    } catch (e) {
      if (e is DioError) {
        var statuscode1 = e.response?.statusCode;

        print(statuscode1);
        print(e.response!.data);
        return UpdateOrderResponseModel(message: e.response!.data['message']);
      }
    }
  }
}
