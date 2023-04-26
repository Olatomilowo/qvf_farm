import 'package:dio/dio.dart';
import '../../core/api_endpoint.dart';
import '../data_storage/token_local_storage.dart';
import '../model/response_model/farm_division_response_model.dart';
import '../model/response_model/produce_category.dart';

class GetFarmDivisionService {
  static final Dio dio = Dio();
  static Future<FarmDivisionResponseModel?> get() async {
    final url = ApiEndpoints.getFarmDivisions();
    final String accessToken = TokenStorage.retrieveToken();

    print(url);

    try {
      var response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = FarmDivisionResponseModel.fromJson(response.data);

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
