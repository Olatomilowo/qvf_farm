import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/api_endpoint.dart';
import '../model/request_model/sign_up_request_model.dart';
import '../model/response_model/sign_up_response_model.dart';

class SignUpService {
  static final Dio dio = Dio();

  static Future<SignUpResponseModel?> register(
      SignUpRequestModel registerUser) async {
    final url = ApiEndpoints.registerUser();
    print(url);
    print(registerUser.email);
    print(registerUser.firstname);
    print(registerUser.lastname);
    print(registerUser.phoneNumber);
    print(registerUser.password);

    try {
      var response = await dio.post(
        url,
        data: registerUser.toJson(),
        // options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 201) {
        var result = SignUpResponseModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      if (e is SocketException) {
        return SignUpResponseModel(message: e.message);
      } else if (e is DioError) {
        print(e.response!.statusCode);
        print(e.response!.data);

        return SignUpResponseModel(message: e.response!.data['message']);
      } else {}
    }
  }
}
