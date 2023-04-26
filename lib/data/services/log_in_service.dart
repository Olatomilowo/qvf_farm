import 'dart:io';

// import 'package:api_test/core/api_endpoint.dart';
// import 'package:api_test/data/model/request_model/log_in_user_request_model.dart';
// import 'package:api_test/data/model/request_model/register_user_request_model.dart';
// import 'package:api_test/data/model/response_model/log_in_user_response_model.dart';
// import 'package:api_test/data/model/response_model/register_user_response_model.dart';
import 'package:dio/dio.dart';

import '../../core/api_endpoint.dart';
import '../model/request_model/log_in_request_model.dart';
import '../model/response_model/log_in_response_model.dart';

class LogInService {
  static final Dio dio = Dio();

  static Future<LogInResponseModel?> logIn(LogInRequestModel logInUser) async {
    final url = ApiEndpoints.logInUser();
    print(url);
    try {
      var response = await dio.post(
        url,
        data: logInUser.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = LogInResponseModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      if (e is SocketException) {
        return LogInResponseModel(message: e.message);
      } else if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);

        return LogInResponseModel(message: e.response!.data['message']);
      } else {}
    }
  }
}
