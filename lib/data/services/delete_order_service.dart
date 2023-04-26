import 'package:dio/dio.dart';
import 'package:qvf_farm/core/api_endpoint.dart';
import 'package:qvf_farm/data/data_storage/token_local_storage.dart';
import '../model/response_model/delete_order_response_model.dart';
import '../model/response_model/produce_category.dart';

class DeleteOrderService {
  static final Dio dio = Dio();
  static Future<DeleteOrderResponseModel?> get(String id) async {
    final url = ApiEndpoints.deleteOrder(id);
    final String accessToken = TokenStorage.retrieveToken();

    print(url);

    try {
      var response = await dio.delete(url,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = DeleteOrderResponseModel.fromJson(response.data);

        return result;
      }
    } catch (e) {
      if (e is DioError) {
        var statuscode1 = e.response?.statusCode;
        print(statuscode1);
        print(e.response!.data);
      }
    }
  }
}
