import 'package:dio/dio.dart';
import 'package:qvf_farm/core/api_endpoint.dart';
import 'package:qvf_farm/data/data_storage/token_local_storage.dart';
import 'package:qvf_farm/data/model/response_model/log_out_response_model.dart';

class LogOutService {
  static final Dio dio = Dio();
  static Future<LogOutResponseModel?> get() async {
    final url = ApiEndpoints.logOutUser();
    final String accessToken = TokenStorage.retrieveToken();

    print(url);

    try {
      var response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = LogOutResponseModel.fromJson(response.data);

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
